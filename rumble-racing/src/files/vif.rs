use thiserror::Error;

#[derive(Error, Debug)]
pub enum VIFParseError {
    //
}

#[derive(Debug)]
pub struct ELDA {
    //
}

pub fn parse_vif_data(data: &[u8]) -> Result<ELDA, VIFParseError> {
    todo!()
}
