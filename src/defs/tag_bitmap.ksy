seq:
  - id: header
    type: tag_header
  - type: u2
    id: type
    enum: bitmap_type
  - type: u2
    id: encoding_format
    enum: bitmap_format
  - type: u2
    id: usage
    enum: bitmap_usage
  - id: flags
    type: bitmap_flags
  - id: detail_fade_factor
    type: f4
  - id: sharpen_amount
    type: f4
  - id: bump_height
    type: f4
  - type: u2
    id: sprite_budget_size
    enum: bitmap_sprite_budget_size
  - id: sprite_budget_count
    type: u2
  - id: color_plate_width
    type: u2
  - id: color_plate_height
    type: u2
  - id: compressed_color_plate_data
    type: tag_data_offset
  - id: processed_pixel_data
    type: tag_data_offset
  - id: blur_filter_size
    type: f4
  - id: alpha_bias
    type: f4
  - id: mipmap_count
    type: u2
  - type: u2
    id: sprite_usage
    enum: bitmap_sprite_usage
  - id: sprite_spacing
    type: u2
  - size: 2
  - type: tag_reflexive
    id: bitmap_group_sequence
  - type: tag_reflexive
    id: bitmap_data
types:
  point2_d_int:
    seq:
      - id: x
        type: s2
      - id: "y"
        type: s2
  color_a_r_g_b_int:
    seq:
      - id: blue
        type: u1
      - id: green
        type: u1
      - id: red
        type: u1
      - id: alpha
        type: u1
  bitmap_data_flags:
    seq:
      - type: b16
        id: bitmap_data_flags
  point2_d:
    seq:
      - id: x
        type: f4
      - id: "y"
        type: f4
  bitmap:
    seq:
      - type: u2
        id: type
        enum: bitmap_type
      - type: u2
        id: encoding_format
        enum: bitmap_format
      - type: u2
        id: usage
        enum: bitmap_usage
      - id: flags
        type: bitmap_flags
      - id: detail_fade_factor
        type: f4
      - id: sharpen_amount
        type: f4
      - id: bump_height
        type: f4
      - type: u2
        id: sprite_budget_size
        enum: bitmap_sprite_budget_size
      - id: sprite_budget_count
        type: u2
      - id: color_plate_width
        type: u2
      - id: color_plate_height
        type: u2
      - id: compressed_color_plate_data
        type: tag_data_offset
      - id: processed_pixel_data
        type: tag_data_offset
      - id: blur_filter_size
        type: f4
      - id: alpha_bias
        type: f4
      - id: mipmap_count
        type: u2
      - type: u2
        id: sprite_usage
        enum: bitmap_sprite_usage
      - id: sprite_spacing
        type: u2
      - size: 2
      - type: tag_reflexive
        id: bitmap_group_sequence
        struct: BitmapGroupSequence
      - type: tag_reflexive
        id: bitmap_data
        struct: BitmapData
  bitmap_group_sprite:
    seq:
      - id: bitmap_index
        type: u2
      - size: 2
      - size: 4
      - id: left
        type: f4
      - id: right
        type: f4
      - id: top
        type: f4
      - id: bottom
        type: f4
      - id: registration_point
        type: point2_d
  rectangle2_d:
    seq:
      - id: top
        type: s2
      - id: left
        type: s2
      - id: bottom
        type: s2
      - id: right
        type: s2
  color_a_r_g_b:
    seq:
      - id: alpha
        type: f4
      - id: red
        type: f4
      - id: green
        type: f4
      - id: blue
        type: f4
  tag_dependency:
    seq:
      - id: tag_fourcc
        type: u4
      - id: path_pointer
        type: u4
      - id: path_size
        type: u4
      - id: tag_id
        type: u4
  bitmap_group_sequence:
    seq:
      - type: str
        encoding: ASCII
        id: name
        size: 32
      - id: first_bitmap_index
        type: u2
      - id: bitmap_count
        type: u2
      - size: 16
      - type: tag_reflexive
        id: sprites
        struct: BitmapGroupSprite
  bitmap_data:
    seq:
      - type: str
        encoding: ASCII
        id: tag_fourcc
        size: 4
      - id: width
        type: u2
      - id: height
        type: u2
      - id: depth
        type: u2
      - type: u2
        id: type
        enum: bitmap_data_type
      - type: u2
        id: format
        enum: bitmap_data_format
      - id: flags
        type: bitmap_data_flags
      - id: registration_point
        type: point2_d_int
      - id: mipmap_count
        type: u2
      - size: 2
      - id: pixel_data_offset
        type: u4
      - id: pixel_data_size
        type: u4
      - id: bitmap_tag_id
        type: u4
      - id: pointer
        type: u4
      - size: 4
      - size: 4
  tag_reflexive:
    seq:
      - id: count
        type: u4
      - id: offset
        type: u4
      - size: 4
  tag_data_offset:
    seq:
      - id: size
        type: u4
      - id: external
        type: u4
      - id: file_offset
        type: u4
      - id: pointer
        size: 8
  bitmap_flags:
    seq:
      - type: b16
        id: bitmap_flags
enums:
  bitmap_data_format:
    "17": p8_bump
    "11": a8r8g8b8
    "12": unused4
    "10": x8r8g8b8
    "0": a8
    "1": y8
    "2": ay8
    "16": dxt5
    "15": dxt3
    "14": dxt1
    "7": unused3
    "8": a1r5g5b5
    "9": a4r4g4b4
    "13": unused5
    "3": a8y8
    "4": unused1
    "5": unused2
    "6": r5g6b5
  bitmap_data_type:
    "3": white
    "0": e_2d_texture
    "1": e_3d_texture
    "2": cube_map
  bitmap_usage:
    "0": alpha_blend
    "1": default
    "2": height_map
    "3": detail_map
    "4": light_map
    "5": vector_map
  bitmap_format:
    "0": dxt1
    "1": dxt3
    "2": dxt5
    "3": e_16_bit
    "4": e_32_bit
    "5": monochrome
  bitmap_sprite_usage:
    "0": blend_add_subtract_max
    "1": multiply_min
    "2": double_multiply
  bitmap_sprite_budget_size:
    "0": e_32x32
    "1": e_64x64
    "2": e_128x128
    "3": e_256x256
    "4": e_512x512
    "5": e_1024x1024
  bitmap_type:
    "0": e_2d_textures
    "1": e_3d_textures
    "2": cube_maps
    "3": sprites
    "4": interface_bitmaps
meta:
  endian: be
  id: tag_bitmap
  imports:
    - tag_header
