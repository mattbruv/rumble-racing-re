use std::{
    cmp::{self, max_by_key},
    io::{Cursor, Read},
};

use thiserror::Error;

#[derive(Error, Debug)]
pub enum VIFParseError {
    #[error("IO Error")]
    IOError(#[from] std::io::Error),

    #[error("Unhandled VIF command at {0}: {1}")]
    UnhandledCommand(u64, u8),

    #[error("Unhandled Unpack Type {0}")]
    UnhandledUnpackType(u8),

    #[error("Unimplemented Immediate Function")]
    UnimplementedImmediate,

    #[error("Unimplemented Write Masking")]
    WriteMaskingNotImplemented(u64),
}

#[derive(Debug)]
pub struct VIFData {
    gif_data: Vec<Quadword>,
    unpacked_data: Vec<UnpackedData>,
}

#[derive(Debug)]
struct EmulateVIFState {
    cycle_register: u16,

    r0: u32,
    r1: u32,
    r2: u32,
    r3: u32,
    mask_register: u32,
}

#[derive(Debug)]
enum UnpackExtendType {
    Zero,
    Signed,
}

#[derive(Debug)]
enum UnpackType {
    /// 0x64, 0x74
    V2_32,

    /// 0x68, 0x78
    V3_32,

    /// 0x6C, 0x7C
    V4_32,

    Unsupported(u8),
}

#[derive(Debug)]
enum UnpackedData {
    V2_32(Vec<(f32, f32)>),
    V3_32(Vec<(f32, f32, f32)>),
    V4_32(Vec<(f32, f32, f32, f32)>),
}

#[derive(Debug)]
struct UnpackInfo {
    address: u64,
    extend_type: UnpackExtendType,
    unpack_type: UnpackType,

    add_tops_to_address: bool,
    perform_unpack_write_masking: bool,
}

#[derive(Debug)]
pub struct Quadword([u8; 4 * 4]);

// https://psi-rockin.github.io/ps2tek/#vifcommands
pub fn parse_vif_data(data: &[u8]) -> Result<VIFData, VIFParseError> {
    let mut vif = VIFData {
        gif_data: vec![],
        unpacked_data: vec![],
    };

    let mut cursor = Cursor::new(data);

    let mut state = EmulateVIFState {
        cycle_register: 0,
        r0: 0,
        r1: 0,
        r2: 0,
        r3: 0,
        mask_register: 0,
    };

    while (cursor.position() as usize) < data.len() {
        let mut command_buffer: [u8; 4] = [0; 4];
        cursor.read_exact(&mut command_buffer)?;

        let command_u32 = u32::from_le_bytes(command_buffer);

        let command: u8 = (command_u32 >> 24) as u8;
        let num: u8 = ((command_u32 >> 16) & 0xFF) as u8;
        let immediate: u16 = (command_u32 & 0xFFFF) as u16;

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

            // 10h FLUSHE
            // Stalls the VIF until the VU is finished executing a microprogram.
            0x10 => {}

            // 17h MSCNT
            // Starts microprogram execution starting at the VU's TPC register
            // this usually means the instruction right after the end of the previous microprogram.
            // If the VU is currently active, MSCNT stalls like MSCAL.
            0x17 => {
                // Idk what this means or if I need to do anything
            }

            // Sets the MASK register to the next 32-bit word in the stream.
            // This is used for UNPACK write masking.
            0x20 => {
                let mut word_buf: [u8; 4] = [0; 4];
                cursor.read_exact(&mut word_buf)?;
                let mask = u32::from_le_bytes(word_buf);
                state.mask_register = mask;
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

            // UNPACK
            0x60..=0x7F => {
                let unpack_info: UnpackInfo = get_unpack_info(command, immediate);

                if unpack_info.perform_unpack_write_masking {
                    // TODO: Uncomment and fix
                    // return Err(VIFParseError::WriteMaskingNotImplemented(cursor.position()));
                }

                match unpack_info.unpack_type {
                    // Four vectors of 32 bits
                    UnpackType::V4_32 => {
                        let mut out = vec![];

                        for _ in 0..num {
                            let mut buf: [u8; 4] = [0; 4];
                            cursor.read_exact(&mut buf)?;
                            let v1 = f32::from_le_bytes(buf);
                            cursor.read_exact(&mut buf)?;
                            let v2 = f32::from_le_bytes(buf);
                            cursor.read_exact(&mut buf)?;
                            let v3 = f32::from_le_bytes(buf);
                            cursor.read_exact(&mut buf)?;
                            let v4 = f32::from_le_bytes(buf);
                            out.push((v1, v2, v3, v4));
                        }

                        vif.unpacked_data.push(UnpackedData::V4_32(out));
                    }

                    // Three vectors of 32 bits
                    UnpackType::V3_32 => {
                        let mut out = vec![];

                        for _ in 0..num {
                            let mut buf: [u8; 4] = [0; 4];
                            cursor.read_exact(&mut buf)?;
                            let v1 = f32::from_le_bytes(buf);
                            cursor.read_exact(&mut buf)?;
                            let v2 = f32::from_le_bytes(buf);
                            cursor.read_exact(&mut buf)?;
                            let v3 = f32::from_le_bytes(buf);
                            out.push((v1, v2, v3));
                        }

                        vif.unpacked_data.push(UnpackedData::V3_32(out));
                    }

                    // Two vectors of 32 bits
                    // UNPACK V2-32
                    UnpackType::V2_32 => {
                        let mut out = vec![];

                        for _ in 0..num {
                            let mut buf: [u8; 4] = [0; 4];
                            cursor.read_exact(&mut buf)?;
                            let v1 = f32::from_le_bytes(buf);
                            cursor.read_exact(&mut buf)?;
                            let v2 = f32::from_le_bytes(buf);
                            out.push((v1, v2));
                        }

                        vif.unpacked_data.push(UnpackedData::V2_32(out));
                    }

                    UnpackType::Unsupported(val) => {
                        return Err(VIFParseError::UnhandledUnpackType(val));
                    }
                }

                // for thing in &vif.unpacked_data {
                //     match thing {
                //         UnpackedData::V4_32(data) => {
                //             println!("{:?}", data);
                //         }
                //         UnpackedData::V3_32(items) => println!("{:?}", items),
                //     }
                // }
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

fn get_unpack_info(command: u8, immediate: u16) -> UnpackInfo {
    UnpackInfo {
        // Decompresses data in various formats to
        // the given address in bits 0-9 of IMMEDIATE multiplied by 16
        address: (((immediate & 0b1111111111) as u64) * 16),

        // If bit 14 of IMMEDIATE is set, the decompressed data is zero-extended.
        // Otherwise, it is sign-extended
        extend_type: match (immediate >> 14) & 0b1 {
            1 => UnpackExtendType::Zero,
            _ => UnpackExtendType::Signed,
        },

        unpack_type: match command {
            0x64 | 0x74 => UnpackType::V2_32,
            0x68 | 0x78 => UnpackType::V3_32,
            0x6C | 0x7C => UnpackType::V4_32,
            _ => UnpackType::Unsupported(command),
        },

        // If bit 15 of IMMEDIATE is set, TOPS is added to the starting address.
        // This is only applicable for VIF1.
        add_tops_to_address: (immediate >> 15) & 0b1 == 1,

        // Bit 4 of CMD performs UNPACK write masking if set.
        perform_unpack_write_masking: (command & 0b10000) != 0,
    }
}
