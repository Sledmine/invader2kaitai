seq:
  - type: tag_header
    id: header
  - enum: bitmap_type
    type: u2
    id: type
  - enum: bitmap_format
    type: u2
    id: encoding_format
  - enum: bitmap_usage
    type: u2
    id: usage
  - type: bitmap_flags
    id: flags
  - type: f4
    id: detail_fade_factor
  - type: f4
    id: sharpen_amount
  - type: f4
    id: bump_height
  - enum: bitmap_sprite_budget_size
    type: u2
    id: sprite_budget_size
  - type: u2
    id: sprite_budget_count
  - type: u2
    id: color_plate_width
  - type: u2
    id: color_plate_height
  - type: tag_data_offset
    id: compressed_color_plate_data
  - type: tag_data_offset
    id: processed_pixel_data
  - type: f4
    id: blur_filter_size
  - type: f4
    id: alpha_bias
  - type: u2
    id: mipmap_count
  - enum: bitmap_sprite_usage
    type: u2
    id: sprite_usage
  - type: u2
    id: sprite_spacing
  - size: 2
  - type: tag_reflexive
    id: bitmap_group_sequence
  - type: tag_reflexive
    id: bitmap_data
meta:
  imports:
    - tag_header
  endian: be
  id: tag_bitmap
enums:
  bitmap_sprite_usage:
    "0": blend_add_subtract_max
    "2": double_multiply
    "1": multiply_min
  bitmap_type:
    "0": e_2d_textures
    "4": interface_bitmaps
    "3": sprites
    "2": cube_maps
    "1": e_3d_textures
  bitmap_format:
    "0": dxt1
    "5": monochrome
    "4": e_32_bit
    "3": e_16_bit
    "2": dxt5
    "1": dxt3
  bitmap_sprite_budget_size:
    "0": e_32x32
    "5": e_1024x1024
    "4": e_512x512
    "3": e_256x256
    "2": e_128x128
    "1": e_64x64
  bitmap_data_type:
    "0": e_2d_texture
    "3": white
    "2": cube_map
    "1": e_3d_texture
  bitmap_usage:
    "0": alpha_blend
    "5": vector_map
    "4": light_map
    "3": detail_map
    "2": height_map
    "1": default
  bitmap_data_format:
    "0": a8
    "10": x8r8g8b8
    "17": p8_bump
    "16": dxt5
    "15": dxt3
    "14": dxt1
    "11": a8r8g8b8
    "12": unused4
    "13": unused5
    "9": a4r4g4b4
    "8": a1r5g5b5
    "7": unused3
    "6": r5g6b5
    "5": unused2
    "4": unused1
    "3": a8y8
    "2": ay8
    "1": y8
types:
  tag_reflexive:
    seq:
      - type: u4
        id: count
      - type: u4
        id: offset
  bitmap_group_sequence:
    seq:
      - encoding: ASCII
        size: 32
        type: str
        id: name
      - type: u2
        id: first_bitmap_index
      - type: u2
        id: bitmap_count
      - size: 16
      - type: tag_reflexive
        id: sprites
  bitmap_group_sprite:
    seq:
      - type: u2
        id: bitmap_index
      - size: 2
      - size: 4
      - type: f4
        id: left
      - type: f4
        id: right
      - type: f4
        id: top
      - type: f4
        id: bottom
      - type: point2_d
        id: registration_point
  bitmap:
    seq:
      - enum: bitmap_type
        type: u2
        id: type
      - enum: bitmap_format
        type: u2
        id: encoding_format
      - enum: bitmap_usage
        type: u2
        id: usage
      - type: bitmap_flags
        id: flags
      - type: f4
        id: detail_fade_factor
      - type: f4
        id: sharpen_amount
      - type: f4
        id: bump_height
      - enum: bitmap_sprite_budget_size
        type: u2
        id: sprite_budget_size
      - type: u2
        id: sprite_budget_count
      - type: u2
        id: color_plate_width
      - type: u2
        id: color_plate_height
      - type: tag_data_offset
        id: compressed_color_plate_data
      - type: tag_data_offset
        id: processed_pixel_data
      - type: f4
        id: blur_filter_size
      - type: f4
        id: alpha_bias
      - type: u2
        id: mipmap_count
      - enum: bitmap_sprite_usage
        type: u2
        id: sprite_usage
      - type: u2
        id: sprite_spacing
      - size: 2
      - type: tag_reflexive
        id: bitmap_group_sequence
      - type: tag_reflexive
        id: bitmap_data
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
  point2_d:
    seq:
      - type: f4
        id: x
      - type: f4
        id: "y"
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
  bitmap_data:
    seq:
      - encoding: ASCII
        size: 4
        type: str
        id: class
      - type: u2
        id: width
      - type: u2
        id: height
      - type: u2
        id: depth
      - enum: bitmap_data_type
        type: u2
        id: type
      - enum: bitmap_data_format
        type: u2
        id: format
      - type: bitmap_data_flags
        id: flags
      - type: point2_d_int
        id: registration_point
      - type: u2
        id: mipmap_count
      - size: 2
      - type: u4
        id: pixel_data_offset
      - type: u4
        id: pixel_data_size
      - type: u4
        id: bitmap_tag_id
      - type: u4
        id: pointer
      - size: 4
      - size: 4
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
  point2_d_int:
    seq:
      - type: s4
        id: x
      - type: s4
        id: "y"
  tag_data_offset:
    seq:
      - type: u4
        id: size
      - type: u4
        id: external
      - type: u4
        id: file_offset
      - size: 8
        id: pointer
  bitmap_flags:
    seq:
      - type: b16
        id: bitmap_flags
  bitmap_data_flags:
    seq:
      - type: b16
        id: bitmap_data_flags
  tag_dependency:
    seq:
      - type: u4
        id: class
      - type: u4
        id: path_pointer
      - type: u4
        id: path_size
      - type: u4
        id: tag_id
