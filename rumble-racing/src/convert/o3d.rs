use crate::{
    convert::convert::{ConvertableAsset, ConvertedAsset},
    files::o3d::O3DFile,
};

impl ConvertableAsset for O3DFile {
    fn get_converted_asset(&self) -> super::convert::ConvertedAsset {
        ConvertedAsset {
            file_name: "test_model".into(),
            file_extension: "obj".into(),
            file_bytes: vec![],
        }
    }
}
