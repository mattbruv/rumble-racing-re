import re
from collections import defaultdict

def label_asm(asm_path, sym_path, output_path):
    symbols = defaultdict(list)
    
    # 1. Parse Symbols File
    sym_pattern = re.compile(r'^\s*([0-9A-Fa-f]+)\s+[0-9A-Fa-f]+\s+\S+\s+(\S+)')
    
    with open(sym_path, 'r') as f:
        for line in f:
            match = sym_pattern.match(line)
            if match:
                addr = match.group(1).lstrip('0').lower()
                symbols[addr].append(match.group(2))

    # 2. Process ASM File
    asm_addr_pattern = re.compile(r'^\s*([0-9A-Fa-f]+):')
    branch_target_pattern = re.compile(r'(0x[0-9A-Fa-f]+)')
    
    with open(asm_path, 'r') as f_in, open(output_path, 'w') as f_out:
        for line in f_in:
            line = line.rstrip()
            addr_match = asm_addr_pattern.match(line)
            
            # A. Print all symbols ABOVE the line (including .vu labels)
            if addr_match:
                current_addr = addr_match.group(1).lstrip('0').lower()
                if current_addr in symbols:
                    sym_list = ", ".join(symbols[current_addr])
                    f_out.write(f"; --- {sym_list} ---\n")
            
            # B. Look for branch targets (Filter out .dot labels)
            branch_comment = ""
            branch_match = branch_target_pattern.search(line)
            if branch_match:
                target_addr = branch_match.group(1)[2:].lstrip('0').lower()
                if target_addr in symbols:
                    # Filter: find symbols that DO NOT start with a dot
                    named_symbols = [s for s in symbols[target_addr] if not s.startswith('.')]
                    
                    if named_symbols:
                        # Use the most descriptive name (usually the last one in the list)
                        branch_comment = f" ; target: {named_symbols[-1]}"
            
            # C. Write the final line
            f_out.write(f"{line}{branch_comment}\n")

if __name__ == "__main__":
    # Ensure these filenames match your local files
    label_asm('../rumble-reader/vu1.asm', '../XMAP.TXT', 'labeled_output.asm')
    print("Labeling complete. Symbols are now placed above their respective lines.")