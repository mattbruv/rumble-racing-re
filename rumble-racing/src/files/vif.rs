use std::io::Cursor;

use thiserror::Error;

#[derive(Error, Debug)]
pub enum VIFParseError {
    //
}

#[derive(Debug)]
pub struct VIFData {
    //
}

pub fn parse_vif_data(data: &[u8]) -> Result<VIFData, VIFParseError> {
    let mut vif = VIFData {};

    let mut cursor = Cursor::new(data);

    Ok(vif)
}
