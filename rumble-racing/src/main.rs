use std::fs;

use crate::files::{o3d::parse_o3d, obf::parse_obf_data};
mod files;

fn main() {
    let file =
        fs::read("../OUT-FEB-7/SE1 - True Grits/o3d/23_SOURCES-SE_CHICKENA.O3D.o3d").unwrap();

    match parse_o3d(&file) {
        Ok(o3d) => {
            println!("Successfully parsed o3d!");
            println!("{:?}", o3d);
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
