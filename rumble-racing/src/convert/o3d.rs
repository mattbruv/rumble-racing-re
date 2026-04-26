use crate::{
    convert::convert::{ConvertableAsset, ConvertedAsset},
    files::o3d::O3DFile,
};

impl ConvertableAsset for O3DFile {
    fn get_converted_asset(&self, file_name: &str) -> super::convert::ConvertedAsset {
        let mut lines = vec!["# Exported from O3D".to_string()];
        let mut positions = Vec::new();
        let mut normals = Vec::new();
        let mut uvs = Vec::new();
        let mut faces = Vec::new();

        for (obf_idx, wrapped_obf) in self.obfs.iter().enumerate() {
            let mesh = wrapped_obf.obf.to_mesh();
            if mesh.positions.is_empty() {
                continue;
            }

            lines.push(format!("o obf_{}", obf_idx));
            let base = positions.len();

            positions.extend(mesh.positions.iter().cloned());
            normals.extend(mesh.normals.iter().cloned());
            uvs.extend(mesh.uvs.iter().cloned());

            for face in mesh.faces {
                let mapped_face = [
                    [face[0][0] + base, face[0][1] + base, face[0][2] + base],
                    [face[1][0] + base, face[1][1] + base, face[1][2] + base],
                    [face[2][0] + base, face[2][1] + base, face[2][2] + base],
                ];
                faces.push(mapped_face);
            }
        }

        if positions.is_empty() {
            lines.push("# no vertex data found".to_string());
        } else {
            for (x, y, z, pos) in positions {
                lines.push(format!("v {} {} {} # {}", x, y, z, pos));
            }
            lines.push(String::new());

            for (u, v, pos) in uvs {
                lines.push(format!("vt {} {} # {}", u, v, pos));
            }
            lines.push(String::new());

            for (x, y, z, pos) in normals {
                lines.push(format!("vn {} {} {} # {}", x, y, z, pos));
            }
            lines.push(String::new());

            for face in faces {
                lines.push(format!(
                    "f {}/{}/{} {}/{}/{} {}/{}/{}",
                    face[0][0],
                    face[0][1],
                    face[0][2],
                    face[1][0],
                    face[1][1],
                    face[1][2],
                    face[2][0],
                    face[2][1],
                    face[2][2],
                ));
            }
        }

        ConvertedAsset {
            file_name: file_name.into(),
            file_extension: "obj".into(),
            file_bytes: lines.join("\n").into_bytes(),
        }
    }
}
