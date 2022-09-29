-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local str_decode = require("string_decode")

require("tag_header")
TagBitmap = class.class(KaitaiStruct)

TagBitmap.BitmapFormat = enum.Enum {
  dxt1 = 0,
  dxt3 = 1,
  dxt5 = 2,
  e_16_bit = 3,
  e_32_bit = 4,
  monochrome = 5,
}

TagBitmap.BitmapSpriteUsage = enum.Enum {
  blend_add_subtract_max = 0,
  multiply_min = 1,
  double_multiply = 2,
}

TagBitmap.BitmapSpriteBudgetSize = enum.Enum {
  e_32x32 = 0,
  e_64x64 = 1,
  e_128x128 = 2,
  e_256x256 = 3,
  e_512x512 = 4,
  e_1024x1024 = 5,
}

TagBitmap.BitmapUsage = enum.Enum {
  alpha_blend = 0,
  default = 1,
  height_map = 2,
  detail_map = 3,
  light_map = 4,
  vector_map = 5,
}

TagBitmap.BitmapType = enum.Enum {
  e_2d_textures = 0,
  e_3d_textures = 1,
  cube_maps = 2,
  sprites = 3,
  interface_bitmaps = 4,
}

TagBitmap.BitmapDataType = enum.Enum {
  e_2d_texture = 0,
  e_3d_texture = 1,
  cube_map = 2,
  white = 3,
}

TagBitmap.BitmapDataFormat = enum.Enum {
  a8 = 0,
  y8 = 1,
  ay8 = 2,
  a8y8 = 3,
  unused1 = 4,
  unused2 = 5,
  r5g6b5 = 6,
  unused3 = 7,
  a1r5g5b5 = 8,
  a4r4g4b4 = 9,
  x8r8g8b8 = 10,
  a8r8g8b8 = 11,
  unused4 = 12,
  unused5 = 13,
  dxt1 = 14,
  dxt3 = 15,
  dxt5 = 16,
  p8_bump = 17,
}

function TagBitmap:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagBitmap:_read()
  self.header = TagHeader(self._io)
  self.type = TagBitmap.BitmapType(self._io:read_u2be())
  self.encoding_format = TagBitmap.BitmapFormat(self._io:read_u2be())
  self.usage = TagBitmap.BitmapUsage(self._io:read_u2be())
  self.flags = TagBitmap.BitmapFlags(self._io, self, self._root)
  self.detail_fade_factor = self._io:read_f4be()
  self.sharpen_amount = self._io:read_f4be()
  self.bump_height = self._io:read_f4be()
  self.sprite_budget_size = TagBitmap.BitmapSpriteBudgetSize(self._io:read_u2be())
  self.sprite_budget_count = self._io:read_u2be()
  self.color_plate_width = self._io:read_u2be()
  self.color_plate_height = self._io:read_u2be()
  self.compressed_color_plate_data = TagBitmap.TagDataOffset(self._io, self, self._root)
  self.processed_pixel_data = TagBitmap.TagDataOffset(self._io, self, self._root)
  self.blur_filter_size = self._io:read_f4be()
  self.alpha_bias = self._io:read_f4be()
  self.mipmap_count = self._io:read_u2be()
  self.sprite_usage = TagBitmap.BitmapSpriteUsage(self._io:read_u2be())
  self.sprite_spacing = self._io:read_u2be()
  self._unnamed19 = self._io:read_bytes(2)
  self.bitmap_group_sequence = TagBitmap.TagReflexive(self._io, self, self._root)
  self.bitmap_data = TagBitmap.TagReflexive(self._io, self, self._root)
end


TagBitmap.Point2DInt = class.class(KaitaiStruct)

function TagBitmap.Point2DInt:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagBitmap.Point2DInt:_read()
  self.x = self._io:read_s4be()
  self.y = self._io:read_s4be()
end


TagBitmap.BitmapDataFlags = class.class(KaitaiStruct)

function TagBitmap.BitmapDataFlags:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagBitmap.BitmapDataFlags:_read()
  self.bitmap_data_flags = self._io:read_bits_int_be(16)
end


TagBitmap.Bitmap = class.class(KaitaiStruct)

function TagBitmap.Bitmap:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagBitmap.Bitmap:_read()
  self.type = TagBitmap.BitmapType(self._io:read_u2be())
  self.encoding_format = TagBitmap.BitmapFormat(self._io:read_u2be())
  self.usage = TagBitmap.BitmapUsage(self._io:read_u2be())
  self.flags = TagBitmap.BitmapFlags(self._io, self, self._root)
  self.detail_fade_factor = self._io:read_f4be()
  self.sharpen_amount = self._io:read_f4be()
  self.bump_height = self._io:read_f4be()
  self.sprite_budget_size = TagBitmap.BitmapSpriteBudgetSize(self._io:read_u2be())
  self.sprite_budget_count = self._io:read_u2be()
  self.color_plate_width = self._io:read_u2be()
  self.color_plate_height = self._io:read_u2be()
  self.compressed_color_plate_data = TagBitmap.TagDataOffset(self._io, self, self._root)
  self.processed_pixel_data = TagBitmap.TagDataOffset(self._io, self, self._root)
  self.blur_filter_size = self._io:read_f4be()
  self.alpha_bias = self._io:read_f4be()
  self.mipmap_count = self._io:read_u2be()
  self.sprite_usage = TagBitmap.BitmapSpriteUsage(self._io:read_u2be())
  self.sprite_spacing = self._io:read_u2be()
  self._unnamed18 = self._io:read_bytes(2)
  self.bitmap_group_sequence = TagBitmap.TagReflexive(self._io, self, self._root)
  self.bitmap_data = TagBitmap.TagReflexive(self._io, self, self._root)
end


TagBitmap.BitmapData = class.class(KaitaiStruct)

function TagBitmap.BitmapData:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagBitmap.BitmapData:_read()
  self.class = str_decode.decode(self._io:read_bytes(4), "ASCII")
  self.width = self._io:read_u2be()
  self.height = self._io:read_u2be()
  self.depth = self._io:read_u2be()
  self.type = TagBitmap.BitmapDataType(self._io:read_u2be())
  self.format = TagBitmap.BitmapDataFormat(self._io:read_u2be())
  self.flags = TagBitmap.BitmapDataFlags(self._io, self, self._root)
  self.registration_point = TagBitmap.Point2DInt(self._io, self, self._root)
  self.mipmap_count = self._io:read_u2be()
  self._unnamed9 = self._io:read_bytes(2)
  self.pixel_data_offset = self._io:read_u4be()
  self.pixel_data_size = self._io:read_u4be()
  self.bitmap_tag_id = self._io:read_u4be()
  self.pointer = self._io:read_u4be()
  self._unnamed14 = self._io:read_bytes(4)
  self._unnamed15 = self._io:read_bytes(4)
end


TagBitmap.Rectangle2D = class.class(KaitaiStruct)

function TagBitmap.Rectangle2D:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagBitmap.Rectangle2D:_read()
  self.top = self._io:read_s2be()
  self.left = self._io:read_s2be()
  self.bottom = self._io:read_s2be()
  self.right = self._io:read_s2be()
end


TagBitmap.TagDependency = class.class(KaitaiStruct)

function TagBitmap.TagDependency:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagBitmap.TagDependency:_read()
  self.class = self._io:read_u4be()
  self.path_pointer = self._io:read_u4be()
  self.path_size = self._io:read_u4be()
  self.tag_id = self._io:read_u4be()
end


TagBitmap.ColorARGBInt = class.class(KaitaiStruct)

function TagBitmap.ColorARGBInt:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagBitmap.ColorARGBInt:_read()
  self.blue = self._io:read_u1()
  self.green = self._io:read_u1()
  self.red = self._io:read_u1()
  self.alpha = self._io:read_u1()
end


TagBitmap.TagDataOffset = class.class(KaitaiStruct)

function TagBitmap.TagDataOffset:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagBitmap.TagDataOffset:_read()
  self.size = self._io:read_u4be()
  self.external = self._io:read_u4be()
  self.file_offset = self._io:read_u4be()
  self.pointer = self._io:read_bytes(8)
end


TagBitmap.Point2D = class.class(KaitaiStruct)

function TagBitmap.Point2D:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagBitmap.Point2D:_read()
  self.x = self._io:read_f4be()
  self.y = self._io:read_f4be()
end


TagBitmap.BitmapGroupSprite = class.class(KaitaiStruct)

function TagBitmap.BitmapGroupSprite:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagBitmap.BitmapGroupSprite:_read()
  self.bitmap_index = self._io:read_u2be()
  self._unnamed1 = self._io:read_bytes(2)
  self._unnamed2 = self._io:read_bytes(4)
  self.left = self._io:read_f4be()
  self.right = self._io:read_f4be()
  self.top = self._io:read_f4be()
  self.bottom = self._io:read_f4be()
  self.registration_point = TagBitmap.Point2D(self._io, self, self._root)
end


TagBitmap.BitmapFlags = class.class(KaitaiStruct)

function TagBitmap.BitmapFlags:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagBitmap.BitmapFlags:_read()
  self.bitmap_flags = self._io:read_bits_int_be(16)
end


TagBitmap.ColorARGB = class.class(KaitaiStruct)

function TagBitmap.ColorARGB:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagBitmap.ColorARGB:_read()
  self.alpha = self._io:read_f4be()
  self.red = self._io:read_f4be()
  self.green = self._io:read_f4be()
  self.blue = self._io:read_f4be()
end


TagBitmap.BitmapGroupSequence = class.class(KaitaiStruct)

function TagBitmap.BitmapGroupSequence:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagBitmap.BitmapGroupSequence:_read()
  self.name = str_decode.decode(self._io:read_bytes(32), "ASCII")
  self.first_bitmap_index = self._io:read_u2be()
  self.bitmap_count = self._io:read_u2be()
  self._unnamed3 = self._io:read_bytes(16)
  self.sprites = TagBitmap.TagReflexive(self._io, self, self._root)
end


TagBitmap.TagReflexive = class.class(KaitaiStruct)

function TagBitmap.TagReflexive:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagBitmap.TagReflexive:_read()
  self.count = self._io:read_u4be()
  self.offset = self._io:read_u4be()
end


