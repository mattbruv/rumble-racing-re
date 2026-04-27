mod convert;
mod files;

use std::path::Path;
use std::{fs, time::Instant};

use walkdir::WalkDir;

use crate::convert::convert::ConvertableAsset;
use crate::files::o3d::parse_o3d;
use crate::files::obf::parse_obf_data;

enum DoThing {
    AllFiles,
    Chicken,
    Map,
    Tornado,
}

fn main() {
    let start = Instant::now();

    match DoThing::Map {
        DoThing::AllFiles => {
            for entry in WalkDir::new("../OUT-FEB-7/")
                .into_iter()
                .filter_map(Result::ok)
                .filter(|e| {
                    e.file_type().is_file() && e.path().extension().is_some_and(|ext| ext == "o3d")
                })
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

                        let assets = o3d.get_converted_assets(file_stem);

                        for asset in assets {
                            let output_dir = entry.path().parent().unwrap();
                            let output_path = output_dir
                                .join(format!("{}.{}", asset.file_name, asset.file_extension));

                            fs::write(output_path, asset.file_bytes).unwrap();
                        }
                    }
                    Err(err) => println!("Error parsing {:?} o3d! {:?}", entry.path(), err),
                };
            }

            for entry in WalkDir::new("../OUT-FEB-7/")
                .into_iter()
                .filter_map(Result::ok)
                .filter(|e| {
                    e.file_type().is_file() && e.path().extension().is_some_and(|ext| ext == "obf")
                })
            {
                let file = fs::read(entry.path()).unwrap();

                match parse_obf_data(&file) {
                    Ok(obf) => {
                        println!("Success!: {:?}", entry.path());

                        let file_stem = entry
                            .path()
                            .file_stem()
                            .and_then(|stem| stem.to_str())
                            .unwrap_or("obf_model");

                        let asset = obf.to_asset(file_stem, 0);

                        let output_dir = entry.path().parent().unwrap();
                        let output_path = output_dir
                            .join(format!("{}.{}", asset.file_name, asset.file_extension));

                        fs::write(output_path, asset.file_bytes).unwrap();
                    }
                    Err(err) => println!("Error parsing {:?} o3d! {:?}", entry.path(), err),
                };
            }
        }
        x @ (DoThing::Chicken | DoThing::Tornado) => {
            let path_str = match x {
                DoThing::Chicken => {
                    "../OUT-FEB-7/SE1 - True Grits/o3d/23_SOURCES-SE_CHICKENA.O3D.o3d"
                }
                DoThing::Tornado => "../OUT-FEB-7/GLBLDATA/o3d/5001_BJECTS-TWISTERPART1.O3D.o3d",
                _ => panic!(""),
            };

            let path = Path::new(path_str);
            let file = fs::read(path).unwrap();

            match parse_o3d(&file) {
                Ok(_o3d) => {
                    println!("Successfully parsed o3d!");

                    let file_stem = path
                        .file_stem()
                        .and_then(|stem| stem.to_str())
                        .unwrap_or("o3d_model");

                    let assets = _o3d.get_converted_assets(file_stem);

                    for asset in assets {
                        fs::write(
                            format!("./{}.{}", asset.file_name, asset.file_extension),
                            asset.file_bytes, // asset.file_bytes,
                        )
                        .unwrap();
                    }
                }
                Err(err) => println!("Error parsing o3d! {:?}", err),
            };
        }
        DoThing::Map => {
            let file =
                fs::read("../OUT-FEB-7/SE1 - True Grits/obf/1_-RESOURCES-TRACK.OBF.obf").unwrap();

            match parse_obf_data(&file) {
                Ok(obf) => {
                    let out = obf.to_asset("MAP_TEST.OBF", 0);
                    fs::write(
                        format!("{}.{}", out.file_name, out.file_extension),
                        out.file_bytes,
                    )
                    .unwrap();
                    println!("Successfully parsed track obf!");
                }
                Err(err) => println!("Error parsing o3d! {:?}", err),
            };
        }
    }

    let elapsed = start.elapsed();
    println!("Took: {:?}", elapsed);
}
