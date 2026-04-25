use std::io::{Cursor, Read};

use thiserror::Error;

#[derive(Error, Debug)]
pub enum VIFParseError {
    #[error("IO Error")]
    IOError(#[from] std::io::Error),

    #[error("Unhandled VIF command at {0}: {1}")]
    UnhandledCommand(u64, u32),
}

#[derive(Debug)]
pub struct VIFData {
    //
}

pub fn parse_vif_data(data: &[u8]) -> Result<VIFData, VIFParseError> {
    let mut vif = VIFData {};

    let mut cursor = Cursor::new(data);

    while (cursor.position() as usize) < data.len() {
        let mut command_buffer: [u8; 4] = [0; 4];
        cursor.read_exact(&mut command_buffer)?;

        let command_format = u32::from_le_bytes(command_buffer);
        let command = command_format >> 24;
        let num = (command_format >> 16) & 0xFF;
        let immediate = command_format & 0xFF;

        println!("COMMAND FMT: {:?}", command_format);
        println!("COMMAND: {:?}", command);
        println!("NUM: {:?}", num);
        println!("IMMEDIATE: {:?}", immediate);

        match command {
            80 => {}
            _ => {
                return Err(VIFParseError::UnhandledCommand(
                    cursor.position() - 4,
                    command,
                ));
            }
        }
    }

    Ok(vif)
}
