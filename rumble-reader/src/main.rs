use nom::{
    IResult,
    bytes::complete::{tag, take, take_until},
    combinator::peek,
    multi::many0,
    sequence::tuple,
};

#[derive(Debug)]
struct Chunk<'a> {
    tag: [u8; 4],
    data: &'a [u8],
}

// Recognized top-level FourCCs
const TOP_LEVEL_TAGS: [&[u8; 4]; 3] = [b"CTRL", b"FILL", b"PADD"];

// Parse a single fourcc tag
fn fourcc(input: &[u8]) -> IResult<&[u8], [u8; 4]> {
    let (rest, bytes) = take(4usize)(input)?;
    Ok((rest, [bytes[0], bytes[1], bytes[2], bytes[3]]))
}

// Parse one top-level chunk: tag + data until next tag or EOF
fn parse_chunk(input: &[u8]) -> IResult<&[u8], Chunk<'_>> {
    // Read the tag
    let (input, tag_bytes) = fourcc(input)?;

    // Ensure it's one of the known top-level tags
    if !TOP_LEVEL_TAGS.iter().any(|&t| t == &tag_bytes) {
        return Err(nom::Err::Error(nom::error::Error::new(
            input,
            nom::error::ErrorKind::Tag,
        )));
    }

    // Try to find the next tag ahead (lookahead for CTRL/FILL/PADD)
    // We'll use take_until on any of the possible top-level tags
    let mut next_tag_pos = input.len();
    for t in TOP_LEVEL_TAGS {
        if let Some(pos) = input.windows(4).position(|w| w == *t) {
            if pos < next_tag_pos {
                next_tag_pos = pos;
            }
        }
    }

    // Split at that position
    let (data, rest) = input.split_at(next_tag_pos);
    Ok((
        rest,
        Chunk {
            tag: tag_bytes,
            data,
        },
    ))
}

// Parse the whole file
fn parse_file(input: &[u8]) -> IResult<&[u8], Vec<Chunk<'_>>> {
    many0(parse_chunk)(input)
}

fn main() {
    let data = b"CTRL\x01\x02\x03FILL\xAA\xBB\xCCPADD\x99";
    let (_, chunks) = parse_file(data).unwrap();

    for c in chunks {
        println!("{}: {:?}", std::str::from_utf8(&c.tag).unwrap(), c.data);
    }
}
