use crate::{convert::convert::ConvertableAsset, files::o3d::O3DFile};

impl ConvertableAsset for O3DFile {
    fn foo(&self) -> u32 {
        42
        // todo!()
    }
}
