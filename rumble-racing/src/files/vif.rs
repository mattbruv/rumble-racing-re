use std::io::{Cursor, Read};

use thiserror::Error;

#[derive(Error, Debug)]
pub enum VIFParseError {
    #[error("IO Error")]
    IOError(#[from] std::io::Error),

    #[error("Unhandled VIF command at {0}: {1}")]
    UnhandledCommand(u64, u8),

    #[error("Unhandled Unpack Type {0}")]
    UnhandledUnpackType(u64, u8),

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

    // row registers
    row_registers: [u32; 4],
    // column registers
    // col_registers: [u32; 4],

    // r0: u32,
    // r1: u32,
    // r2: u32,
    // r3: u32,
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

    /// 6Eh/7Eh UNPACK V4-8
    // V4_8,
    Unsupported(u8),
}

#[derive(Debug)]
enum UnpackedData {
    V2_32(Vec<(f32, f32, String)>),
    V3_32(Vec<(f32, f32, f32, String)>),
    V4_32(Vec<(f32, f32, f32, f32, String)>),
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
        row_registers: [0; 4],
        // r0: 0,
        // r1: 0,
        // r2: 0,
        // r3: 0,
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
                // state = EmulateVIFState {
                //     cycle_register: 0,
                //     row_registers: [0; 4],
                //     mask_register: 0,
                // }
                // Idk what this means or if I need to do anything
                // We might need to figure out if there is a VU program we need to emulate
                // at a high level here.
                // for example, KatamariDamacy emulates a high level program here.
                // but KingdomHearts2 just resets the state.
            }

            // Sets the MASK register to the next 32-bit word in the stream.
            // This is used for UNPACK write masking.
            0x20 => {
                let mut word_buf: [u8; 4] = [0; 4];
                cursor.read_exact(&mut word_buf)?;
                let mask = u32::from_le_bytes(word_buf);
                state.mask_register = mask;
            }

            // STROW
            // Sets the R0-R3 row registers to the next 4 32-bit words in the stream.
            // This is used for UNPACK write filling.
            0x30 => {
                let mut word_buf: [u8; 4] = [0; 4];
                cursor.read_exact(&mut word_buf)?;
                let r0 = u32::from_le_bytes(word_buf);
                cursor.read_exact(&mut word_buf)?;
                let r1 = u32::from_le_bytes(word_buf);
                cursor.read_exact(&mut word_buf)?;
                let r2 = u32::from_le_bytes(word_buf);
                cursor.read_exact(&mut word_buf)?;
                let r3 = u32::from_le_bytes(word_buf);
                state.row_registers = [r0, r1, r2, r3];
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
                    let supported = matches!(
                        (
                            &unpack_info.unpack_type,
                            state.mask_register,
                            state.row_registers
                        ),
                        // normals: XYZ from stream, W = row, row registers all 1.0f
                        (UnpackType::V3_32, 0x40404040, [1065353216, 1065353216, 1065353216, 1065353216]) |
                        // UVs: XY from stream, Z/W = row, row registers all 1.0f
                        (UnpackType::V2_32, 0x50505050, [1065353216, 1065353216, 1065353216, 1065353216])
                    );

                    if !supported {
                        return Err(VIFParseError::WriteMaskingNotImplemented(cursor.position()));
                    }
                }

                match unpack_info.unpack_type {
                    // Four vectors of 32 bits
                    UnpackType::V4_32 => {
                        let mut out = vec![];

                        for _ in 0..num {
                            let start = cursor.position(); // debug
                            let mut buf: [u8; 4] = [0; 4];
                            cursor.read_exact(&mut buf)?;
                            let v1 = f32::from_le_bytes(buf);
                            cursor.read_exact(&mut buf)?;
                            let v2 = f32::from_le_bytes(buf);
                            cursor.read_exact(&mut buf)?;
                            let v3 = f32::from_le_bytes(buf);
                            cursor.read_exact(&mut buf)?;
                            let v4 = f32::from_le_bytes(buf);
                            out.push((
                                v1,
                                v2,
                                v3,
                                v4,
                                format!(
                                    "offset: {}, row regs: {:?} mask: {:?}",
                                    start, state.row_registers, state.mask_register
                                ),
                            ));
                        }

                        vif.unpacked_data.push(UnpackedData::V4_32(out));
                    }

                    // Three vectors of 32 bits
                    UnpackType::V3_32 => {
                        let mut out = vec![];

                        for _ in 0..num {
                            let start = cursor.position(); // debug
                            let mut buf: [u8; 4] = [0; 4];
                            cursor.read_exact(&mut buf)?;
                            let v1 = f32::from_le_bytes(buf);
                            cursor.read_exact(&mut buf)?;
                            let v2 = f32::from_le_bytes(buf);
                            cursor.read_exact(&mut buf)?;
                            let v3 = f32::from_le_bytes(buf);
                            out.push((
                                v1,
                                v2,
                                v3,
                                format!(
                                    "offset: {}, row regs: {:?} mask: {:?}",
                                    start, state.row_registers, state.mask_register
                                ),
                            ));
                        }

                        vif.unpacked_data.push(UnpackedData::V3_32(out));
                    }

                    // Two vectors of 32 bits
                    UnpackType::V2_32 => {
                        let mut out = vec![];

                        for _ in 0..num {
                            let start = cursor.position(); // debug
                            let mut buf: [u8; 4] = [0; 4];
                            cursor.read_exact(&mut buf)?;
                            let v1 = f32::from_le_bytes(buf);
                            cursor.read_exact(&mut buf)?;
                            let v2 = f32::from_le_bytes(buf);
                            out.push((
                                v1,
                                v2,
                                format!(
                                    "offset: {}, row regs: {:?} mask: {:?}",
                                    start, state.row_registers, state.mask_register
                                ),
                            ));
                        }

                        vif.unpacked_data.push(UnpackedData::V2_32(out));
                    }

                    // Four vectors of 8 bits ??
                    // UnpackType::V4_8 => return Err(VIFParseError::UnimplementedImmediate),
                    //
                    UnpackType::Unsupported(val) => {
                        return Err(VIFParseError::UnhandledUnpackType(cursor.position(), val));
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

impl VIFData {
    pub fn to_mesh(&self) -> Mesh {
        let mut mesh = Mesh::new();
        let mut i = 0;

        while i < self.unpacked_data.len() {
            if let UnpackedData::V4_32(_) = &self.unpacked_data[i] {
                i += 1;
                continue;
            }

            if i + 2 >= self.unpacked_data.len() {
                break;
            }

            match (
                &self.unpacked_data[i],
                &self.unpacked_data[i + 1],
                &self.unpacked_data[i + 2],
            ) {
                (
                    UnpackedData::V3_32(norms),
                    UnpackedData::V3_32(positions),
                    UnpackedData::V2_32(uvs),
                ) if norms.len() == positions.len() && positions.len() == uvs.len() => {
                    let start = mesh.positions.len();

                    for position in positions.iter().cloned() {
                        mesh.positions.push(position);
                    }
                    for normal in norms.iter().cloned() {
                        mesh.normals.push(normal);
                    }
                    for uv in uvs.iter().cloned() {
                        mesh.uvs.push((uv.0, 1.0 - uv.1, uv.2));
                    }

                    for j in 0..positions.len().saturating_sub(2) {
                        let (i0, i1, i2) = if j % 2 == 0 {
                            (j, j + 1, j + 2)
                        } else {
                            (j, j + 2, j + 1)
                        };

                        let face = [
                            [start + i0 + 1, start + i0 + 1, start + i0 + 1],
                            [start + i1 + 1, start + i1 + 1, start + i1 + 1],
                            [start + i2 + 1, start + i2 + 1, start + i2 + 1],
                        ];
                        mesh.faces.push(face);
                    }

                    i += 3;
                }
                _ => {
                    i += 1;
                }
            }
        }

        mesh
    }
}

pub(crate) struct Mesh {
    pub positions: Vec<(f32, f32, f32, String)>,
    pub normals: Vec<(f32, f32, f32, String)>,
    pub uvs: Vec<(f32, f32, String)>,
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
            // 0x6E | 0x7E => UnpackType::V4_8,
            _ => UnpackType::Unsupported(command),
        },

        // If bit 15 of IMMEDIATE is set, TOPS is added to the starting address.
        // This is only applicable for VIF1.
        add_tops_to_address: (immediate >> 15) & 0b1 == 1,

        // Bit 4 of CMD performs UNPACK write masking if set.
        perform_unpack_write_masking: (command & 0b10000) != 0,
    }
}
