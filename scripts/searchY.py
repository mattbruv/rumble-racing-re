import os
import json
import base64
import struct
from concurrent.futures import ProcessPoolExecutor

def check_matrix_diagnostics(matrix_tuple):
    """
    Validates matrix elements and returns a specific reason string if it fails.
    Returns (True, "VALID") or (False, "Detailed Reason String")
    """
    row_names = ["Row 0 (Right Vector)", "Row 1 (Up Vector)", "Row 2 (Forward Vector)"]
    
    # 1. Check Orientation/Rotation Components (-2.0 to 2.0)
    for row_idx in range(3):
        row = matrix_tuple[row_idx]
        for col_idx, val in enumerate(row[:3]):
            if not (-130.01 <= val <= 130.01): 
                return False, f"{row_names[row_idx]} component [{col_idx}] is out of bounds (Value: {val:.4f})"
        
        # 2. Check Direction Vector W components (Should be ~0.0)
        if not (-0.01 <= row[3] <= 0.01):
            return False, f"{row_names[row_idx]} W-component is invalid (Value: {row[3]:.4f}, expected ~0.0)"

    # 3. Check Position Vector W component (Should be ~1.0)
    pos_w = matrix_tuple[3][3]
    if not (0.99 <= pos_w <= 1.01):
        return False, f"Row 3 (Position Vector) W-component is invalid (Value: {pos_w:.4f}, expected ~1.0)"

    return True, "VALID"

def scan_memory_for_y_values(binary_data, x_bytes, z_bytes):
    """
    Scans binary data for X and Z anchors.
    - If ONLY ONE matching anchor block is found total: skips validation and returns it.
    - If MORE THAN ONE matching anchor block is found: validates all entries and keeps good ones.
    """
    data_len = len(binary_data)
    start_pos = 0
    
    # Track all raw matrices discovered during the initial scan
    raw_matrices = []

    while True:
        idx = binary_data.find(x_bytes, start_pos)
        if idx == -1:
            break
            
        if idx - 48 < 0 or idx + 16 > data_len:
            start_pos = idx + 1
            continue
            
        if binary_data[idx + 8 : idx + 12] == z_bytes:
            y_bytes = binary_data[idx + 4 : idx + 8]
            y_float = struct.unpack('<f', y_bytes)[0]
            
            # if y_float != 0.0 and y_float != 1.0:
            chunk_start = idx - 48
            chunk_data = binary_data[chunk_start : chunk_start + 64]
            floats = struct.unpack('<16f', chunk_data)
            matrix_tuple = tuple(floats[i : i + 4] for i in range(0, 16, 4))
            raw_matrices.append(matrix_tuple)
            
        start_pos = idx + 1

    # CASE 0: Absolutely nothing matched the byte patterns
    if len(raw_matrices) == 0:
        return "ANCHOR_NOT_FOUND", []

    # CASE 1: Exactly one entry found -> bypass all validation and return it directly
    # if len(raw_matrices) == 1:
    #     single_matrix = raw_matrices[0]
    #     return "SUCCESS", [[list(row) for row in single_matrix]]

    # CASE 2: More than one entry found -> apply rigid structural checks
    found_datasets = set()
    validation_failures = set()

    for matrix_tuple in raw_matrices:
        is_valid, reason_str = check_matrix_diagnostics(matrix_tuple)
        if is_valid:
            found_datasets.add(matrix_tuple)
        else:
            validation_failures.add(reason_str)

    if not found_datasets:
        combined_reasons = " | ".join(sorted(validation_failures))
        return f"VALIDATION_FAILED (Evaluated {len(raw_matrices)} entries): {combined_reasons}", []

    return "SUCCESS", [list(list(row) for row in matrix) for matrix in found_datasets]

def worker_task(json_file_info):
    """
    Processes a single JSON file. Returns either the data payload or a clear error stage.
    """
    json_file, json_path, binary_data = json_file_info
    try:
        with open(json_path, 'r') as f:
            data = json.load(f)
        
        resource_index = data.get("O3DResourceIndex")
        if resource_index is None or int(resource_index) == 0:
            return json_file, "SKIPPED_INDEX_ZERO"
            
        x_b64 = data.get("XBytes")
        y_b64 = data.get("YBytes")
        z_b64 = data.get("ZBytes")
        
        if not all([x_b64, y_b64, z_b64]):
            return json_file, "JSON_MISSING_ANCHORS"
            
        x_bytes = base64.b64decode(x_b64)
        y_bytes = base64.b64decode(y_b64)
        z_bytes = base64.b64decode(z_b64)
        
        if len(x_bytes) != 4 or len(y_bytes) != 4 or len(z_bytes) != 4:
            return json_file, "INVALID_ANCHOR_SIZE"
            
        status, datasets = scan_memory_for_y_values(binary_data, x_bytes, z_bytes)
        
        if not status.startswith("SUCCESS"):
            return json_file, status
            
        return json_file, datasets
        
    except Exception as e:
        return json_file, f"EXCEPTION: {str(e)}"

def process_and_export_parallel(binary_path, json_dir, output_json_path):
    binary_path = os.path.abspath(binary_path)
    json_dir = os.path.abspath(json_dir)

    if not os.path.exists(json_dir) or not os.path.exists(binary_path):
        print("Error: Input paths do not exist.")
        return

    json_files = [f for f in os.listdir(json_dir) if f.lower().endswith('.json')]
    if not json_files:
        print(f"No JSON files found in {json_dir}")
        return

    print(f"Reading memory file into RAM: {binary_path}...")
    with open(binary_path, 'rb') as f:
        binary_data = f.read()

    tasks = [
        (json_file, os.path.join(json_dir, json_file), binary_data) 
        for json_file in json_files
    ]

    output_data = {}
    failed_reasons = {}

    print(f"Processing matching files across CPU cores...")
    print("-" * 60)

    with ProcessPoolExecutor() as executor:
        results = executor.map(worker_task, tasks)
        
        for json_file, result in results:
            key_name = json_file.split('_')[0]
            
            if result == "SKIPPED_INDEX_ZERO":
                continue
                
            if isinstance(result, str):
                if result == "ANCHOR_NOT_FOUND":
                    failed_reasons[key_name] = "Failed to find any matching X/Z byte patterns in memory dump"
                elif result == "JSON_MISSING_ANCHORS":
                    failed_reasons[key_name] = "The base JSON description is missing raw byte properties"
                elif result == "INVALID_ANCHOR_SIZE":
                    failed_reasons[key_name] = "Decoded base64 sequence did not match expected 4-byte float size"
                elif result.startswith("VALIDATION_FAILED"):
                    failed_reasons[key_name] = result
                else:
                    failed_reasons[key_name] = result
                    print(f"  [!] {json_file} encountered a fatal error: {result}")
            else:
                if len(result) == 1:
                    output_data[key_name] = result[0]
                    print(f"  [+] {json_file} -> '{key_name}': Extracted 1 matrix (Bypassed validation)")
                else:
                    output_data[key_name] = result[0]
                    print(f"  [+] {json_file} -> '{key_name}': Extracted {len(result)} valid unique matrices")

    try:
        with open(output_json_path, 'w') as out_file:
            json.dump(output_data, out_file, indent=2)
    except Exception as e:
        print(f"Error writing output file: {e}")

    print("-" * 60)
    print(f"SUCCESS! Valid data written to: {os.path.abspath(output_json_path)}")
    print("-" * 60)
    
    if failed_reasons:
        print(f"[-] NO MATRICES FOUND FOR THE FOLLOWING MODELS ({len(failed_reasons)} total):")
        for model in sorted(failed_reasons.keys()):
            print(f"  * {model:<15} -> {failed_reasons[model]}")
    else:
        print("[+] Awesome! Found valid matrices for every processed model file.")
    print("-" * 60)

if __name__ == "__main__":
    tracks = [
        ["BB1", "Sun Burn"],
        ["BB2", "Surf And Turf"],
        ["BL1", "So Refined"],
        ["BL2", "Coal Cuts"],
        ["DA1", "Flip Out"],
        ["DA2", "The Gauntlet"],
        ["DA3", "Wild Kingdom"],
        ["JT1", "Circus Minimus"],
        ["JT2", "Outer Limits"],
        ["MA1", "Passing Through"],
        ["MA2", "Falls Down"],
        ["MP1", "Touch And Go"],
        ["MP2", "Car Go"],
        ["SE1", "True Grits"],
        ["SE2", "Over Easy"],
    ]
    for thing in tracks:
        shorthand = thing[0]
        name = thing[1]

        BINARY_FILE_PATH = f"../rumble-reader/dumps/{name.lower().replace(" ", "_")}/eeMemory.bin"
        JSON_DIR_PATH = f"../OUT/{shorthand} - {name}/Cact/"
        OUTPUT_JSON_PATH = f"{shorthand}.json"
        
        process_and_export_parallel(BINARY_FILE_PATH, JSON_DIR_PATH, OUTPUT_JSON_PATH)