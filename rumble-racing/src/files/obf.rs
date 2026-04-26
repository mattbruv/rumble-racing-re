use std::io::{self, Cursor, Read, Seek};
use std::string::FromUtf8Error;

use thiserror::Error;

use crate::files::{
    types::FourCC,
    vif::{VIFData, VIFParseError, parse_vif_data},
};

#[derive(Error, Debug)]
pub enum ObfParseError {
    #[error("Error parsing OBF chunks")]
    ChunkParsingError(#[from] ObfChunkParseError),

    #[error("Error parsing VIF data")]
    VIFParseError(#[from] VIFParseError),

    #[error("OBF Header Split Error")]
    HeaderSplitError,

    #[error("Unhandled FourCC: '{0}'")]
    UnhandledFourCC(String),
}

#[derive(Debug)]
pub struct Obf {
    header_bytes: Vec<u8>,
    elhes: Vec<ELHE>,
    eltls: Vec<ELTL>,
    eldas: Vec<Option<VIFData>>,
}

pub struct Mesh {
    pub positions: Vec<(f32, f32, f32)>,
    pub normals: Vec<(f32, f32, f32)>,
    pub uvs: Vec<(f32, f32)>,
    pub faces: Vec<[[usize; 3]; 3]>,
}

impl Mesh {
    pub fn new() -> Self {
        Self {
            positions: Vec::new(),
            normals: Vec::new(),
            uvs: Vec::new(),
            faces: Vec::new(),
        }
    }
}

impl Obf {
    pub fn vertices(&self) -> Vec<(f32, f32, f32)> {
        let mut vertices = Vec::new();

        for elda in self.eldas.iter().flatten() {
            vertices.extend(elda.vertices());
        }

        vertices
    }

    pub fn uvs(&self) -> Vec<(f32, f32)> {
        let mut uvs = Vec::new();

        for elda in self.eldas.iter().flatten() {
            uvs.extend(elda.uvs());
        }

        uvs
    }

    pub fn to_mesh(&self) -> Mesh {
        let mut mesh = Mesh::new();

        for elda in self.eldas.iter().flatten() {
            let sub_mesh = elda.to_mesh();
            let base = mesh.positions.len();

            mesh.positions.extend(sub_mesh.positions.iter().cloned());
            mesh.normals.extend(sub_mesh.normals.iter().cloned());
            mesh.uvs.extend(sub_mesh.uvs.iter().cloned());

            for face in sub_mesh.faces {
                mesh.faces.push([
                    [face[0][0] + base, face[0][1] + base, face[0][2] + base],
                    [face[1][0] + base, face[1][1] + base, face[1][2] + base],
                    [face[2][0] + base, face[2][1] + base, face[2][2] + base],
                ]);
            }
        }

        mesh
    }
}

#[derive(Debug)]
pub struct ELHE {
    pub raw_data: Vec<u8>,
}

#[derive(Debug)]
pub struct ELTL {
    pub raw_data: Vec<u8>,
}

pub fn parse_obf_data(data: &[u8]) -> Result<Obf, ObfParseError> {
    let mut obf = Obf {
        header_bytes: vec![],
        elhes: vec![],
        eltls: vec![],
        eldas: vec![],
    };

    // Skip the first 8 header bytes, we don't know what this is/if relevant yet
    let (head, rest) = data
        .split_at_checked(8)
        .ok_or(ObfParseError::HeaderSplitError)?;

    obf.header_bytes = head.into();

    // println!("{:?}", head);

    let obf_chunks = parse_obf_chunks(rest)?;

    for obf_chunk in obf_chunks {
        //
        match obf_chunk.tag.as_str() {
            "HEAD" => {
                // println!("{:?}, {:?}", obf_chunk.tag, obf_chunk.data);
            }
            "ELHE" => {
                obf.elhes.push(ELHE {
                    raw_data: obf_chunk.data.into(),
                });
            }
            "ELTL" => {
                obf.eltls.push(ELTL {
                    raw_data: obf_chunk.data.into(),
                });
            }
            "ELDA" => {
                let vif_data: Option<VIFData> = match obf_chunk.data.len() {
                    0 => None,
                    _ => Some(parse_vif_data(obf_chunk.data)?),
                };

                obf.eldas.push(vif_data);
            }
            val => return Err(ObfParseError::UnhandledFourCC(val.into())),
        }
    }

    Ok(obf)
}

#[derive(Debug)]
pub struct ObfChunk<'a> {
    pub tag: FourCC,
    pub size: u32,
    pub data: &'a [u8],
}

#[derive(Error, Debug)]
pub enum ObfChunkParseError {
    #[error("Bad FourCC")]
    InvalidFourCC(#[from] FromUtf8Error),

    #[error("IO error")]
    IoError(#[from] io::Error),

    #[error("Out of bounds")]
    OutOfBounds,
}

fn parse_obf_chunks(data: &[u8]) -> Result<Vec<ObfChunk<'_>>, ObfChunkParseError> {
    let mut chunks = Vec::new();

    let mut cursor = Cursor::new(data);

    while (cursor.position() as usize) < cursor.get_ref().len() {
        let mut tag_bytes: [u8; 4] = [0; 4];
        cursor.read_exact(&mut tag_bytes)?;
        let fourcc = FourCC::new(tag_bytes)?;
        // println!("OBF TAG: {:?}", fourcc);

        let mut size_bytes: [u8; 4] = [0; 4];
        cursor.read_exact(&mut size_bytes)?;

        // size excludes the 8 byte header
        let payload_size = u32::from_le_bytes(size_bytes) as usize;

        let payload_start = cursor.position() as usize;

        let end = payload_start
            .checked_add(payload_size)
            .ok_or(ObfChunkParseError::OutOfBounds)?;

        let payload_data = cursor
            .get_ref()
            .get(payload_start..end)
            .ok_or(ObfChunkParseError::OutOfBounds)?;

        cursor.seek(io::SeekFrom::Start(end as u64))?;

        chunks.push(ObfChunk {
            tag: fourcc,
            size: payload_size as u32,
            data: payload_data,
        });
    }

    Ok(chunks)
}
