use std::string::FromUtf8Error;

#[derive(Debug, Clone, PartialEq, Eq, Hash)]
pub struct FourCC(String);

impl FourCC {
    pub fn new(bytes: [u8; 4]) -> Result<String, FromUtf8Error> {
        String::from_utf8(bytes.to_vec())
    }

    pub fn as_str(&self) -> &str {
        &self.0
    }
}
