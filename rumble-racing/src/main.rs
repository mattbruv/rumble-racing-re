use std::fs;

use crate::files::o3d::{O3DParseError, parse_o3d};
mod files;

fn main() {
    let file =
        fs::read("../OUT-FEB-7/SE1 - True Grits/o3d/23_SOURCES-SE_CHICKENA.O3D.o3d").unwrap();

    match parse_o3d(&file) {
        Ok(o3d) => {
            println!("Successfully parsed o3d!");
            println!("{:?}", o3d);
        }
        Err(err) => println!("Error parsing o3d! {}", err),
    };
}
