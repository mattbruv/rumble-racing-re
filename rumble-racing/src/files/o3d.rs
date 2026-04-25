use thiserror::Error;

use crate::files::{
    chunk::{GenericChunkParseError, parse_generic_chunks},
    gmd::Gmd,
    obf::{Obf, ObfParseError, parse_obf_data},
};

#[derive(Debug)]
pub struct O3DPart {
    pub raw_data: Vec<u8>,
}

#[derive(Debug)]
pub struct ExpF {
    pub raw_data: Vec<u8>,
}

#[derive(Debug)]
pub struct O3DFile {
    pub gmds: Vec<Gmd>,
    pub parts: Vec<O3DPart>,
    pub expfs: Vec<ExpF>,
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

    let mut o3d = O3DFile {
        gmds: vec![],
        parts: vec![],
        expfs: vec![],
        obfs: vec![],
    };

    for chunk in generic_chunks {
        match chunk.tag.as_str() {
            "Gmd " => {
                o3d.gmds.push(Gmd {});
            } // Don't know what Gmd's are, skip them for now
            "ExpF" => {
                o3d.expfs.push(ExpF {
                    raw_data: chunk.data.into(),
                });
            }
            "Part" => {
                o3d.parts.push(O3DPart {
                    raw_data: chunk.data.into(),
                });
            }
            "Obf " => {
                // Discard the first 8 bytes of the header... Idk what it does for now.
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
