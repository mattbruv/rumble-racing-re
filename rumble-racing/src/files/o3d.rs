use thiserror::Error;

use crate::files::{
    chunk::{GenericChunkParseError, parse_generic_chunks},
    obf::{Obf, ObfParseError, parse_obf_data},
};

#[derive(Debug)]
pub struct O3DFile {
    pub obfs: Vec<WrappedObf>,
}

#[derive(Debug)]
pub struct WrappedObf {
    pub header_bytes: Vec<u8>,
    pub obf: Obf,
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
            "Obf " => {
                // Discard the first 8 bytes of the header... Idk what it does for now.
                // Skip the first 16 header bytes, we don't know what this is/if relevant yet
                let (header_bytes, rest) = chunk
                    .data
                    .split_at_checked(8)
                    .ok_or(ObfParseError::HeaderSplitError)?;

                o3d.obfs.push(WrappedObf {
                    header_bytes: header_bytes.into(),
                    obf: parse_obf_data(rest)?,
                });
            }
            tag => return Err(O3DParseError::UnknownChunk(tag.into())),
        }
    }

    return Ok(o3d);
}
