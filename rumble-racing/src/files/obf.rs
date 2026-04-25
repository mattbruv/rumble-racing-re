use thiserror::Error;

use crate::files::chunk::GenericChunk;

#[derive(Error, Debug)]
pub enum ObfParseError {}

#[derive(Debug)]
pub struct Obf {
    elhes: Vec<ELHE>,
    eltls: Vec<ELTL>,
    eldas: Vec<ELDA>,
}

#[derive(Debug)]
pub struct ELHE {}

#[derive(Debug)]
pub struct ELTL {}

#[derive(Debug)]
pub struct ELDA {}

pub fn parse_obf(chunk: GenericChunk) -> Result<Obf, ObfParseError> {
    let mut obf = Obf {
        elhes: vec![],
        eltls: vec![],
        eldas: vec![],
    };

    Ok(obf)
}
