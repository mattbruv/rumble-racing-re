mod convert;
mod files;

use std::{fs, time::Instant};

use walkdir::WalkDir;

use crate::convert::convert::ConvertableAsset;
use crate::files::o3d::parse_o3d;

fn main() {
    let start = Instant::now();

    for entry in WalkDir::new("../OUT-FEB-7/")
        .into_iter()
        .filter_map(Result::ok)
        .filter(|e| e.file_type().is_file() && e.path().extension().is_some_and(|ext| ext == "o3d"))
    {
        let file = fs::read(entry.path()).unwrap();

        match parse_o3d(&file) {
            Ok(o3d) => {
                println!("Success!: {:?}", entry.path());

                let file_stem = entry
                    .path()
                    .file_stem()
                    .and_then(|stem| stem.to_str())
                    .unwrap_or("o3d_model");

                let asset = o3d.get_converted_asset(file_stem);

                let output_dir = entry.path().parent().unwrap();
                let output_path =
                    output_dir.join(format!("{}.{}", asset.file_name, asset.file_extension));

                fs::write(output_path, asset.file_bytes).unwrap();
            }
            Err(err) => println!("Error parsing {:?} o3d! {:?}", entry.path(), err),
        };
    }

    let elapsed = start.elapsed();
    println!("Took: {:?}", elapsed);

    // let file =
    //     fs::read("../OUT-FEB-7/SE1 - True Grits/o3d/23_SOURCES-SE_CHICKENA.O3D.o3d").unwrap();

    // match parse_o3d(&file) {
    //     Ok(_o3d) => {
    //         println!("Successfully parsed o3d!");
    //         let asset = _o3d.get_converted_asset();

    //         fs::write(
    //             format!("./{}.{}", asset.file_name, asset.file_extension),
    //             asset.file_bytes,
    //         )
    //         .unwrap();
    //     }
    //     Err(err) => println!("Error parsing o3d! {:?}", err),
    // };

    // let file = fs::read("../OUT-FEB-7/SE1 - True Grits/obf/1_-RESOURCES-TRACK.OBF.obf").unwrap();

    // match parse_obf_data(&file) {
    //     Ok(obf) => {
    //         println!("Successfully parsed track obf!");
    //         println!("{:?}", obf);
    //     }
    //     Err(err) => println!("Error parsing o3d! {:?}", err),
    // };
}
