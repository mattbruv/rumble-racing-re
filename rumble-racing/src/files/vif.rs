use std::io::{Cursor, Read};

use thiserror::Error;

#[derive(Error, Debug)]
pub enum VIFParseError {
    #[error("IO Error")]
    IOError(#[from] std::io::Error),
}

#[derive(Debug)]
pub struct VIFData {
    //
}

pub fn parse_vif_data(data: &[u8]) -> Result<VIFData, VIFParseError> {
    let mut vif = VIFData {};

    let mut cursor = Cursor::new(data);

    let mut command_buffer: [u8; 4] = [0; 4];
    cursor.read_exact(&mut command_buffer)?;

    Ok(vif)
}
