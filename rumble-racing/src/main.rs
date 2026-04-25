use std::fs;
mod files;

fn main() {
    let file =
        fs::read("../OUT-FEB-7/SE1 - True Grits/o3d/23_SOURCES-SE_CHICKENA.O3D.o3d").unwrap();

    files::o3d::parse_o3d(&file);
}
