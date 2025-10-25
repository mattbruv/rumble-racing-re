mod fourcc;

use std::io::Read;
use std::{fs::File, io::Seek};

use crate::fourcc::{ChunkType, FourCC};

fn main() -> std::io::Result<()> {
    let f = File::open("SE1.TRK")?;

    read_track_file(f)?;

    Ok(())
}

fn read_track_file(mut f: File) -> Result<(), std::io::Error> {
    let fourcc = FourCC::read_le(&mut f)?;
    let chunk_type: ChunkType = fourcc.into();
    Ok(match chunk_type {
        ChunkType::CTRL => println!("Found CTRL chunk"),
        ChunkType::Unknown(code) => println!("Unknown chunk: {}", code.to_string()),
    })
}
