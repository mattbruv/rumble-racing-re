use std::string::FromUtf8Error;

use thiserror::Error;

use crate::files::types::FourCC;
#[derive(Error, Debug)]
pub enum GenericChunkParseError {
    #[error("Bad FourCC")]
    InvalidFourCC(#[from] FromUtf8Error),
}

#[derive(Debug)]
pub struct GenericChunk<'a> {
    tag: FourCC,
    data: &'a [u8],
}

pub fn parse_generic_chunks(data: &[u8]) -> Result<Vec<GenericChunk<'_>>, GenericChunkParseError> {
    let mut chunks = Vec::new();

    Ok(chunks)
}
