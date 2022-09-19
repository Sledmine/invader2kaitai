-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")

require("tag_header")
TagBitmap = class.class(KaitaiStruct)

TagBitmap.BitmapFormat = enum.Enum {
  e_dxt1 = 1,
  e_dxt3 = 2,
  e_dxt5 = 3,
  e_16_bit = 4,
  e_32_bit = 5,
  e_monochrome = 6,
}

TagBitmap.BitmapSpriteUsage = enum.Enum {
  e_blend_add_subtract_max = 1,
  e_multiply_min = 2,
  e_double_multiply = 3,
}

TagBitmap.BitmapSpriteBudgetSize = enum.Enum {
  e_32x32 = 1,
  e_64x64 = 2,
  e_128x128 = 3,
  e_256x256 = 4,
  e_512x512 = 5,
  e_1024x1024 = 6,
}

TagBitmap.BitmapUsage = enum.Enum {
  e_alpha_blend = 1,
  e_default = 2,
  e_height_map = 3,
  e_detail_map = 4,
  e_light_map = 5,
  e_vector_map = 6,
}

TagBitmap.BitmapType = enum.Enum {
  e_2d_textures = 1,
  e_3d_textures = 2,
  e_cube_maps = 3,
  e_sprites = 4,
  e_interface_bitmaps = 5,
}

TagBitmap.BitmapDataType = enum.Enum {
  e_2d_texture = 1,
  e_3d_texture = 2,
  e_cube_map = 3,
  e_white = 4,
}

TagBitmap.BitmapDataFormat = enum.Enum {
  e_a8 = 1,
  e_y8 = 2,
  e_ay8 = 3,
  e_a8y8 = 4,
  e_unused1 = 5,
  e_unused2 = 6,
  e_r5g6b5 = 7,
  e_unused3 = 8,
  e_a1r5g5b5 = 9,
  e_a4r4g4b4 = 10,
  e_x8r8g8b8 = 11,
  e_a8r8g8b8 = 12,
  e_unused4 = 13,
  e_unused5 = 14,
  e_dxt1 = 15,
  e_dxt3 = 16,
  e_dxt5 = 17,
  e_p8_bump = 18,
}

function TagBitmap:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagBitmap:_read()
  self.header = TagHeader(self._io)
  self.bitmap_data_type = TagBitmap.BitmapDataType(self._io:read_u2be())
  self.bitmap_data_format = TagBitmap.BitmapDataFormat(self._io:read_u2be())
  self.bitmap_type = TagBitmap.BitmapType(self._io:read_u2be())
  self.bitmap_format = TagBitmap.BitmapFormat(self._io:read_u2be())
  self.bitmap_usage = TagBitmap.BitmapUsage(self._io:read_u2be())
  self.bitmap_sprite_budget_size = TagBitmap.BitmapSpriteBudgetSize(self._io:read_u2be())
  self.bitmap_sprite_usage = TagBitmap.BitmapSpriteUsage(self._io:read_u2be())
  self.bitmap_data_flags = self._io:read_bits_int_be(16)
  self.bitmap_flags = self._io:read_bits_int_be(16)
end


