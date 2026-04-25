use std::{
    io::{self, Cursor, Read},
    string::FromUtf8Error,
};

use thiserror::Error;

use crate::files::types::FourCC;
#[derive(Error, Debug)]
pub enum GenericChunkParseError {
    #[error("Bad FourCC")]
    InvalidFourCC(#[from] FromUtf8Error),

    #[error("IO error")]
    IoError(#[from] io::Error),
}

#[derive(Debug)]
pub struct GenericChunk<'a> {
    tag: FourCC,
    data: &'a [u8],
}

pub fn parse_generic_chunks(data: &[u8]) -> Result<Vec<GenericChunk<'_>>, GenericChunkParseError> {
    let mut chunks = Vec::new();

    let mut cursor = Cursor::new(data);

    let mut tag_buffer: [u8; 4] = [0; 4];
    cursor.read_exact(&mut tag_buffer)?; // automatically advances cursor position
    tag_buffer.reverse(); // the tags are backwards, so reverse them
    let fourcc = FourCC::new(tag_buffer)?;

    println!("BUFFER: {:?}", fourcc);

    Ok(chunks)
}
