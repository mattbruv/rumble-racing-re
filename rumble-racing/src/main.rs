mod convert;
mod files;

use std::{fs, time::Instant};

use walkdir::WalkDir;

use crate::convert::convert::ConvertableAsset;
use crate::files::{o3d::parse_o3d, obf::parse_obf_data};

fn main() {
    // let start = Instant::now();

    // for entry in WalkDir::new("../OUT-FEB-7/")
    //     .into_iter()
    //     .filter_map(Result::ok)
    //     .filter(|e| e.file_type().is_file() && e.path().extension().is_some_and(|ext| ext == "o3d"))
    // {
    //     let file = fs::read(entry.path()).unwrap();

    //     match parse_o3d(&file) {
    //         Ok(o3d) => {
    //             println!("Success!: {:?}", entry.path());
    //             if o3d.parts.len() > 0 {
    //                 for part in o3d.parts {
    //                     // println!("Part: {:?}: {:?}", entry.path(), part.raw_data)
    //                 }
    //             }
    //         }
    //         Err(err) => println!("Error parsing {:?} o3d! {:?}", entry.path(), err),
    //     };
    // }

    // let elapsed = start.elapsed();
    // println!("Took: {:?}", elapsed);

    let file =
        fs::read("../OUT-FEB-7/SE1 - True Grits/o3d/23_SOURCES-SE_CHICKENA.O3D.o3d").unwrap();

    match parse_o3d(&file) {
        Ok(_o3d) => {
            println!("Successfully parsed o3d!");
            let asset = _o3d.foo();
            println!("Asset: {:?}", asset);
            // println!("{:?}", o3d);
        }
        Err(err) => println!("Error parsing o3d! {:?}", err),
    };

    // let file = fs::read("../OUT-FEB-7/SE1 - True Grits/obf/1_-RESOURCES-TRACK.OBF.obf").unwrap();

    // match parse_obf_data(&file) {
    //     Ok(obf) => {
    //         println!("Successfully parsed track obf!");
    //         println!("{:?}", obf);
    //     }
    //     Err(err) => println!("Error parsing o3d! {:?}", err),
    // };
}
