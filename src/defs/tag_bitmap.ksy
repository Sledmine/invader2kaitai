meta:
  endian: be
  id: tag_bitmap
  imports:
    - tag_header
enums:
  bitmap_data_type:
    "3": e_cube_map
    "4": e_white
    "1": e_2d_texture
    "2": e_3d_texture
  bitmap_format:
    "3": e_dxt5
    "4": e_16_bit
    "5": e_32_bit
    "6": e_monochrome
    "1": e_dxt1
    "2": e_dxt3
  bitmap_data_format:
    "18": e_p8_bump
    "17": e_dxt5
    "3": e_ay8
    "4": e_a8y8
    "5": e_unused1
    "6": e_unused2
    "1": e_a8
    "2": e_y8
    "7": e_r5g6b5
    "8": e_unused3
    "9": e_a1r5g5b5
    "12": e_a8r8g8b8
    "11": e_x8r8g8b8
    "10": e_a4r4g4b4
    "16": e_dxt3
    "15": e_dxt1
    "14": e_unused5
    "13": e_unused4
  bitmap_sprite_usage:
    "3": e_double_multiply
    "1": e_blend_add_subtract_max
    "2": e_multiply_min
  bitmap_sprite_budget_size:
    "3": e_128x128
    "4": e_256x256
    "5": e_512x512
    "6": e_1024x1024
    "1": e_32x32
    "2": e_64x64
  bitmap_usage:
    "3": e_height_map
    "4": e_detail_map
    "5": e_light_map
    "6": e_vector_map
    "1": e_alpha_blend
    "2": e_default
  bitmap_type:
    "3": e_cube_maps
    "4": e_sprites
    "5": e_interface_bitmaps
    "1": e_2d_textures
    "2": e_3d_textures
seq:
  - type: tag_header
    id: header
  - id: bitmap_data_type
    type: u2
    enum: bitmap_data_type
  - id: bitmap_data_format
    type: u2
    enum: bitmap_data_format
  - id: bitmap_type
    type: u2
    enum: bitmap_type
  - id: bitmap_format
    type: u2
    enum: bitmap_format
  - id: bitmap_usage
    type: u2
    enum: bitmap_usage
  - id: bitmap_sprite_budget_size
    type: u2
    enum: bitmap_sprite_budget_size
  - id: bitmap_sprite_usage
    type: u2
    enum: bitmap_sprite_usage
  - id: bitmap_data_flags
    type: b16
  - id: bitmap_flags
    type: b16
