#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub struct FourCC(pub [u8; 4]);

impl FourCC {
    pub fn from_str(s: &str) -> Self {
        let bytes = s.as_bytes();
        assert!(bytes.len() == 4, "FourCC must be exactly 4 chars");
        let mut arr = [0u8; 4];
        arr.copy_from_slice(bytes);
        Self(arr)
    }

    pub fn to_string(&self) -> String {
        String::from_utf8_lossy(&self.0).to_string()
    }

    pub fn read_le<R: std::io::Read>(reader: &mut R) -> std::io::Result<Self> {
        let mut buf = [0u8; 4];
        reader.read_exact(&mut buf)?;
        buf.reverse();
        Ok(Self(buf))
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum ChunkType {
    CTRL,
    // add more as needed
    Unknown(FourCC),
}

impl From<FourCC> for ChunkType {
    fn from(code: FourCC) -> Self {
        match code.to_string().as_str() {
            "CTRL" => ChunkType::CTRL,
            _ => ChunkType::Unknown(code),
        }
    }
}

impl From<ChunkType> for FourCC {
    fn from(chunk: ChunkType) -> Self {
        match chunk {
            ChunkType::CTRL => FourCC::from_str("CTRL"),
            ChunkType::Unknown(code) => code,
        }
    }
}
