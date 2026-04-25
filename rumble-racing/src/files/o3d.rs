use thiserror::Error;

use crate::files::{
    chunk::{GenericChunkParseError, parse_generic_chunks},
    gmd::Gmd,
    obf::Obf,
};

#[derive(Debug)]
pub struct O3DFile {
    pub gmds: Vec<Gmd>,
    pub obfs: Vec<Obf>,
}

#[derive(Error, Debug)]
pub enum O3DParseError {
    #[error("generic chunk parsing error")]
    GenericChunkError(#[from] GenericChunkParseError),

    #[error("Unknown Chunk: '{0}'")]
    UnknownChunk(String),
}

pub fn parse_o3d(binary: &[u8]) -> Result<O3DFile, O3DParseError> {
    let generic_chunks = parse_generic_chunks(binary)?;

    let mut o3d = O3DFile {
        gmds: vec![],
        obfs: vec![],
    };

    for chunk in generic_chunks {
        match chunk.tag.as_str() {
            "Gmd " => {}
            "Obf " => {}
            tag => return Err(O3DParseError::UnknownChunk(tag.into())),
        }
    }

    return Ok(o3d);
}
