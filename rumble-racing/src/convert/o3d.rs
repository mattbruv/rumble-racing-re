use crate::{
    convert::convert::{ConvertableAsset, ConvertedAsset},
    files::{
        o3d::O3DFile,
        obf::Obf,
        vif::{UnpackedData, VifCommand},
    },
};

impl O3DFile {
    pub fn get_vif_text_file(&self) -> Vec<u8> {
        let mut out = Vec::new();

        for (_obf_idx, wrapped_obf) in self.obfs.iter().enumerate() {
            let txt = wrapped_obf.obf.vif_to_text_bytes();
            out.extend_from_slice(&txt);
        }

        out
    }
}

impl ConvertableAsset for O3DFile {
    fn get_converted_assets(&self, file_name: &str) -> Vec<ConvertedAsset> {
        let mut assets = Vec::new();

        for (obf_idx, wrapped_obf) in self.obfs.iter().enumerate() {
            assets.push(wrapped_obf.obf.to_asset(file_name, obf_idx));
        }

        assets.push(ConvertedAsset {
            file_name: file_name.into(),
            file_extension: "vif.dat".into(),
            file_bytes: self.get_vif_text_file(),
        });

        assets
    }
}

impl Obf {
    pub fn to_asset(&self, file_name: &str, obf_idx: usize) -> ConvertedAsset {
        let mut out_lines: Vec<String> = vec!["# Exported from O3D".to_string()];

        let relevant_vif = self.unpack_relevant_vif();

        let mut global_v = 0usize;
        let mut global_vt = 0usize;
        let mut global_vn = 0usize;

        for (e, elda) in relevant_vif.eldas.iter().enumerate() {
            for (seg, segment) in elda.segments.iter().enumerate() {
                let mut lines: Vec<String> = vec![
                    format!("# start elda {} segment {}", e, seg),
                    format!("o elda_{}_segment_{}", e, seg),
                ];

                let mut positions = Vec::new();
                let mut normals = Vec::new();
                let mut uvs = Vec::new();
                let mut faces = Vec::new();

                for vif_command_triple in segment.groups.iter() {
                    match &vif_command_triple.commands {
                        [
                            VifCommand::UNPACK(UnpackedData::V3_32(norms)),
                            VifCommand::UNPACK(UnpackedData::V3_32(verts)),
                            VifCommand::UNPACK(UnpackedData::V2_32(uvs_data)),
                        ] => {
                            let base_v = global_v;
                            let base_vt = global_vt;
                            let base_vn = global_vn;

                            positions.extend(
                                verts
                                    .0
                                    .iter()
                                    .enumerate()
                                    .map(|(i, v)| (v.0, v.1, v.2, base_v + i + 1)),
                            );

                            normals.extend(
                                norms
                                    .0
                                    .iter()
                                    .enumerate()
                                    .map(|(i, n)| (n.0, n.1, n.2, base_vn + i + 1)),
                            );

                            uvs.extend(
                                uvs_data
                                    .0
                                    .iter()
                                    .enumerate()
                                    .map(|(i, u)| (u.0, u.1, base_vt + i + 1)),
                            );

                            for j in 0..verts.0.len().saturating_sub(2) {
                                let (i0, i1, i2) = if j % 2 == 0 {
                                    (j, j + 1, j + 2)
                                } else {
                                    (j, j + 2, j + 1)
                                };

                                faces.push([
                                    [base_v + i0 + 1, base_vt + i0 + 1, base_vn + i0 + 1],
                                    [base_v + i1 + 1, base_vt + i1 + 1, base_vn + i1 + 1],
                                    [base_v + i2 + 1, base_vt + i2 + 1, base_vn + i2 + 1],
                                ]);
                            }

                            global_v += verts.0.len();
                            global_vt += uvs_data.0.len();
                            global_vn += norms.0.len();
                        }

                        [
                            VifCommand::UNPACK(UnpackedData::V3_32(verts)),
                            VifCommand::UNPACK(UnpackedData::V2_32(uvs_data)),
                            VifCommand::UNPACK(UnpackedData::V4_8(maybe_normals)),
                        ] => {
                            let base_v = global_v;
                            let base_vt = global_vt;
                            let base_vn = global_vn;

                            positions.extend(
                                verts
                                    .0
                                    .iter()
                                    .enumerate()
                                    .map(|(i, v)| (v.0, v.1, v.2, base_v + i + 1)),
                            );

                            normals.extend(maybe_normals.0.iter().enumerate().map(|(i, n)| {
                                (
                                    n.0 as f32 / 127.0,
                                    n.1 as f32 / 127.0,
                                    n.2 as f32 / 127.0,
                                    base_vn + i + 1,
                                )
                            }));

                            uvs.extend(
                                uvs_data
                                    .0
                                    .iter()
                                    .enumerate()
                                    .map(|(i, u)| (u.0, u.1, base_vt + i + 1)),
                            );

                            for j in 0..verts.0.len().saturating_sub(2) {
                                let (i0, i1, i2) = if j % 2 == 0 {
                                    (j, j + 1, j + 2)
                                } else {
                                    (j, j + 2, j + 1)
                                };

                                faces.push([
                                    [base_v + i0 + 1, base_vt + i0 + 1, base_vn + i0 + 1],
                                    [base_v + i1 + 1, base_vt + i1 + 1, base_vn + i1 + 1],
                                    [base_v + i2 + 1, base_vt + i2 + 1, base_vn + i2 + 1],
                                ]);
                            }

                            global_v += verts.0.len();
                            global_vt += uvs_data.0.len();
                            global_vn += maybe_normals.0.len();
                        }

                        _ => {}
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
                        lines.push(format!("vt {} {} # {}", u, 1.0 - v, pos));
                    }
                    lines.push(String::new());

                    for (x, y, z, pos) in normals {
                        // lines.push(format!("vn {} {} {} # {}", x, y, z, pos));
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

                out_lines.extend(lines);
            }
        }

        ConvertedAsset {
            file_name: format!("{}_obf_{}", file_name, obf_idx),
            file_extension: "obj".into(),
            file_bytes: out_lines.join("\n").into_bytes(),
        }
    }
}
