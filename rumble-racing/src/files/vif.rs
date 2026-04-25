use std::{
    io::{Cursor, Read},
    os::macos::raw::stat,
};

use thiserror::Error;

#[derive(Error, Debug)]
pub enum VIFParseError {
    #[error("IO Error")]
    IOError(#[from] std::io::Error),

    #[error("Unhandled VIF command at {0}: {1}")]
    UnhandledCommand(u64, u8),

    #[error("Unimplemented Immediate Function")]
    UnimplementedImmediate,
}

#[derive(Debug)]
pub struct VIFData {
    gif_data: Vec<Quadword>,
}

struct EmulateVIFState {
    cycle_register: u16,

    r0: u32,
    r1: u32,
    r2: u32,
    r3: u32,
}

#[derive(Debug)]
pub struct Quadword([u8; 4 * 4]);

// https://psi-rockin.github.io/ps2tek/#vifcommands
pub fn parse_vif_data(data: &[u8]) -> Result<VIFData, VIFParseError> {
    let mut vif = VIFData { gif_data: vec![] };

    let mut cursor = Cursor::new(data);

    let mut state = EmulateVIFState {
        cycle_register: 0,
        r0: 0,
        r1: 0,
        r2: 0,
        r3: 0,
    };

    while (cursor.position() as usize) < data.len() {
        let mut command_buffer: [u8; 4] = [0; 4];
        cursor.read_exact(&mut command_buffer)?;

        let command_format = u32::from_le_bytes(command_buffer);
        let command: u8 = (command_format >> 24) as u8;
        let num: u8 = ((command_format >> 16) & 0xFF) as u8;
        let immediate: u16 = (command_format & 0xFFFF) as u16;

        // println!("COMMAND FMT: {:?}", command_format);
        // println!("COMMAND: {:?}", command);
        // println!("NUM: {:?}", num);
        // println!("IMMEDIATE: {:?}", immediate);

        match command {
            // NOP, does nothing
            0x00 => {}

            // Sets the CYCLE register to IMMEDIATE.
            // In particular, CYCLE.CL is set to bits 0-7 and CYCLE.WL is set to bits 8-15.
            // The CYCLE register is used for skipping/filling writes for UNPACK.
            0x01 => {
                state.cycle_register = immediate;
            }

            // Sets the R0-R3 row registers to the next 4 32-bit words in the stream.
            // This is used for UNPACK write filling.
            0x30 => {
                let mut word_buf: [u8; 4] = [0; 4];
                cursor.read_exact(&mut word_buf)?;
                state.r0 = u32::from_le_bytes(word_buf);
                cursor.read_exact(&mut word_buf)?;
                state.r1 = u32::from_le_bytes(word_buf);
                cursor.read_exact(&mut word_buf)?;
                state.r2 = u32::from_le_bytes(word_buf);
                cursor.read_exact(&mut word_buf)?;
                state.r3 = u32::from_le_bytes(word_buf);
            }

            // DIRECT (VIF1)
            0x50 => {
                // println!("IMMEDIATE: {:?}", immediate);
                match immediate {
                    // If IMMEDIATE is 0, 65,536 quadwords are transferred.
                    0 => return Err(VIFParseError::UnimplementedImmediate),
                    // Transfers IMMEDIATE quadwords to the GIF
                    n => {
                        // a quadword on the PS2 is 16 bytes ( 4 bytes (u32) * 4 = quad )
                        let mut quadword: [u8; 4 * 4] = [0; 16];
                        for _ in 0..n {
                            cursor.read_exact(&mut quadword)?;
                            vif.gif_data.push(Quadword(quadword));
                        }
                    }
                }
            }

            // Unhandled, error
            _ => {
                return Err(VIFParseError::UnhandledCommand(
                    cursor.position() - 4,
                    command,
                ));
            }
        };
    }

    Ok(vif)
}
