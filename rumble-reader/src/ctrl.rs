#[derive(Debug, Clone)]
pub struct Ctrl {
    pub unk_short: u16, // piVar6[5] / 0x6000
    pub unk_3: u32,
    pub unk_4: u32,
    pub unk_5: u32,
}
