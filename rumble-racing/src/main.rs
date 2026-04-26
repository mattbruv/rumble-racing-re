use std::fs;

use walkdir::WalkDir;

use crate::files::{o3d::parse_o3d, obf::parse_obf_data};
mod files;

fn main() {
    // for entry in WalkDir::new("../OUT-FEB-7/")
    //     .into_iter()
    //     .filter_map(Result::ok)
    //     .filter(|e| e.file_type().is_file() && e.path().extension().is_some_and(|ext| ext == "o3d"))
    // {
    //     let file = fs::read(entry.path()).unwrap();

    //     match parse_o3d(&file) {
    //         Ok(o3d) => {
    //             if o3d.parts.len() > 0 {
    //                 for part in o3d.parts {
    //                     // println!("Part: {:?}: {:?}", entry.path(), part.raw_data)
    //                 }
    //             }
    //         }
    //         Err(err) => println!("Error parsing {:?} o3d! {:?}", entry.path(), err),
    //     };
    // }

    let file =
        fs::read("../OUT-FEB-7/SE1 - True Grits/o3d/23_SOURCES-SE_CHICKENA.O3D.o3d").unwrap();

    match parse_o3d(&file) {
        Ok(_o3d) => {
            println!("Successfully parsed o3d!");
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
