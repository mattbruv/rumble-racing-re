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
pub enum TopLevelChunk {
    CTRL,
    Unknown(FourCC),
}

impl From<FourCC> for TopLevelChunk {
    fn from(code: FourCC) -> Self {
        match code.to_string().as_str() {
            "CTRL" => TopLevelChunk::CTRL,
            _ => TopLevelChunk::Unknown(code),
        }
    }
}

impl From<TopLevelChunk> for FourCC {
    fn from(chunk: TopLevelChunk) -> Self {
        match chunk {
            TopLevelChunk::CTRL => FourCC::from_str("CTRL"),
            TopLevelChunk::Unknown(code) => code,
        }
    }
}
