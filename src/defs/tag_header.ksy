meta:
  id: tag_header
  endian: be
seq:
  - id: id
    type: u4
  - id: name
    size: 32
  - id: class
    size: 4
  - id: crc32
    type: u4
  - id: size
    type: u4
  - type: u4
  - type: u4
  - id: version
    type: u2
  - id: something_255
    type: u2
  - id: engine
    contents: blam
  - id: version_for_tag
    type: u2