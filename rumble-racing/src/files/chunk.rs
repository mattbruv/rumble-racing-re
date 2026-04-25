use std::{
    io::{self, Cursor, Read, Seek},
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

    #[error("Out of bounds")]
    OutOfBounds,
}

#[derive(Debug)]
pub struct GenericChunk<'a> {
    pub tag: FourCC,
    pub size: u32,
    pub data: &'a [u8],
}

pub fn parse_generic_chunks(data: &[u8]) -> Result<Vec<GenericChunk<'_>>, GenericChunkParseError> {
    let mut chunks = Vec::new();

    let mut cursor = Cursor::new(data);

    while (cursor.position() as usize) < cursor.get_ref().len() {
        let mut tag_bytes: [u8; 4] = [0; 4];
        cursor.read_exact(&mut tag_bytes)?; // automatically advances cursor position
        tag_bytes.reverse(); // the tags are backwards, so reverse them
        let fourcc = FourCC::new(tag_bytes)?;

        let mut size_bytes: [u8; 4] = [0; 4];
        cursor.read_exact(&mut size_bytes)?;

        let size = u32::from_le_bytes(size_bytes);

        let payload_start = cursor.position() as usize;

        let payload_size = (size as usize)
            .checked_sub(8)
            .ok_or(GenericChunkParseError::OutOfBounds)?;

        let end = payload_start
            .checked_add(payload_size)
            .ok_or(GenericChunkParseError::OutOfBounds)?;

        let payload_data = cursor
            .get_ref()
            .get(payload_start..end)
            .ok_or(GenericChunkParseError::OutOfBounds)?;

        cursor.seek(io::SeekFrom::Start(end as u64))?;

        chunks.push(GenericChunk {
            tag: fourcc,
            size,
            data: payload_data,
        });
    }

    Ok(chunks)
}
