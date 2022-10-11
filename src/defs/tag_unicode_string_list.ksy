types:
  point2_d:
    seq:
      - type: f4
        id: x
      - type: f4
        id: "y"
  tag_reflexive:
    seq:
      - type: u4
        id: count
      - type: u4
        id: offset
      - size: 4
  point2_d_int:
    seq:
      - type: s2
        id: x
      - type: s2
        id: "y"
  rectangle2_d:
    seq:
      - type: s2
        id: top
      - type: s2
        id: left
      - type: s2
        id: bottom
      - type: s2
        id: right
  tag_dependency:
    seq:
      - type: u4
        id: tag_fourcc
      - type: u4
        id: path_pointer
      - type: u4
        id: path_size
      - type: u4
        id: tag_id
  color_a_r_g_b_int:
    seq:
      - type: u1
        id: blue
      - type: u1
        id: green
      - type: u1
        id: red
      - type: u1
        id: alpha
  tag_id:
    seq:
      - type: u2
        id: index
      - type: u2
        id: id
  unicode_string_list_string:
    seq:
      - type: tag_data_offset
        id: string
  color_a_r_g_b:
    seq:
      - type: f4
        id: alpha
      - type: f4
        id: red
      - type: f4
        id: green
      - type: f4
        id: blue
  unicode_string_list:
    seq:
      - type: tag_reflexive
        id: strings
  tag_data_offset:
    seq:
      - type: u4
        id: size
      - type: u4
        id: external
      - type: u4
        id: file_offset
      - type: u4
        id: pointer
      - size: 4
meta:
  endian: be
  imports:
    - tag_header
  id: tag_unicode_string_list
seq:
  - type: tag_header
    id: header
  - type: tag_reflexive
    id: strings
