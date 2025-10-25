mod fourcc;

use std::fs::File;
use std::io::Read;

use crate::fourcc::{ChunkType, FourCC};

fn main() -> std::io::Result<()> {
    let mut f = File::open("SE1.TRK")?;
    let fourcc = FourCC::read_le(&mut f)?;
    let chunk_type: ChunkType = fourcc.into();

    match chunk_type {
        ChunkType::Lrtc => println!("Found LRTC chunk"),
        ChunkType::Vagp => println!("Found VAGp chunk"),
        ChunkType::Unknown(code) => println!("Unknown chunk: {}", code.to_string()),
        _ => println!("Other known chunk"),
    }

    Ok(())
}
