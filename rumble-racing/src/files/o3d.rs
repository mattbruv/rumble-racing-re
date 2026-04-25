use thiserror::Error;

use crate::files::chunk::{GenericChunkParseError, parse_generic_chunks};

pub struct O3DFile {}

#[derive(Error, Debug)]
pub enum O3DParseError {
    #[error("generic chunk parsing error")]
    GenericChunkError(#[from] GenericChunkParseError),
}

pub fn parse_o3d(binary: &[u8]) -> Result<O3DFile, O3DParseError> {
    let generic_chunks = parse_generic_chunks(binary)?;
    println!("CHUNKS: {:?}", generic_chunks);

    return Ok(O3DFile {});
}
