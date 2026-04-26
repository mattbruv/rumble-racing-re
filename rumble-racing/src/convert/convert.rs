#[derive(Debug)]
pub struct ConvertedAsset {
    pub file_name: String,
    pub file_extension: String,
    pub file_bytes: Vec<u8>,
}

pub trait ConvertableAsset {
    fn get_converted_asset(&self, file_name: &str) -> ConvertedAsset;
}
