use thiserror::Error;

use crate::files::{
    chunk::{GenericChunkParseError, parse_generic_chunks},
    obf::{Obf, ObfParseError, parse_obf},
};

#[derive(Debug)]
pub struct O3DFile {
    pub obfs: Vec<Obf>,
}

#[derive(Error, Debug)]
pub enum O3DParseError {
    #[error("generic chunk parsing error")]
    GenericChunkError(#[from] GenericChunkParseError),

    #[error("error parsing obf")]
    ObfParseError(#[from] ObfParseError),

    #[error("Unknown Chunk: '{0}'")]
    UnknownChunk(String),
}

pub fn parse_o3d(binary: &[u8]) -> Result<O3DFile, O3DParseError> {
    let generic_chunks = parse_generic_chunks(binary)?;

    let mut o3d = O3DFile { obfs: vec![] };

    for chunk in generic_chunks {
        match chunk.tag.as_str() {
            "Gmd " => {} // Don't know what Gmd's are, skip them for now
            "Obf " => o3d.obfs.push(parse_obf(chunk)?),
            tag => return Err(O3DParseError::UnknownChunk(tag.into())),
        }
    }

    return Ok(o3d);
}
