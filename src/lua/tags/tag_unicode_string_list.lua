-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")

require("tag_header")
TagUnicodeStringList = class.class(KaitaiStruct)

function TagUnicodeStringList:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagUnicodeStringList:_read()
  self.header = TagHeader(self._io)
  self.strings = TagUnicodeStringList.TagReflexive(self._io, self, self._root)
end


TagUnicodeStringList.Point2DInt = class.class(KaitaiStruct)

function TagUnicodeStringList.Point2DInt:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagUnicodeStringList.Point2DInt:_read()
  self.x = self._io:read_s2be()
  self.y = self._io:read_s2be()
end


TagUnicodeStringList.UnicodeStringList = class.class(KaitaiStruct)

function TagUnicodeStringList.UnicodeStringList:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagUnicodeStringList.UnicodeStringList:_read()
  self.strings = TagUnicodeStringList.TagReflexive(self._io, self, self._root)
end


TagUnicodeStringList.Rectangle2D = class.class(KaitaiStruct)

function TagUnicodeStringList.Rectangle2D:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagUnicodeStringList.Rectangle2D:_read()
  self.top = self._io:read_s2be()
  self.left = self._io:read_s2be()
  self.bottom = self._io:read_s2be()
  self.right = self._io:read_s2be()
end


TagUnicodeStringList.TagDependency = class.class(KaitaiStruct)

function TagUnicodeStringList.TagDependency:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagUnicodeStringList.TagDependency:_read()
  self.tag_fourcc = self._io:read_u4be()
  self.path_pointer = self._io:read_u4be()
  self.path_size = self._io:read_u4be()
  self.tag_id = self._io:read_u4be()
end


TagUnicodeStringList.UnicodeStringListString = class.class(KaitaiStruct)

function TagUnicodeStringList.UnicodeStringListString:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagUnicodeStringList.UnicodeStringListString:_read()
  self.string = TagUnicodeStringList.TagDataOffset(self._io, self, self._root)
end


TagUnicodeStringList.ColorARGBInt = class.class(KaitaiStruct)

function TagUnicodeStringList.ColorARGBInt:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagUnicodeStringList.ColorARGBInt:_read()
  self.blue = self._io:read_u1()
  self.green = self._io:read_u1()
  self.red = self._io:read_u1()
  self.alpha = self._io:read_u1()
end


TagUnicodeStringList.TagDataOffset = class.class(KaitaiStruct)

function TagUnicodeStringList.TagDataOffset:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagUnicodeStringList.TagDataOffset:_read()
  self.size = self._io:read_u4be()
  self.external = self._io:read_u4be()
  self.file_offset = self._io:read_u4be()
  self.pointer = self._io:read_u4be()
  self._unnamed4 = self._io:read_bytes(4)
end


TagUnicodeStringList.Point2D = class.class(KaitaiStruct)

function TagUnicodeStringList.Point2D:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagUnicodeStringList.Point2D:_read()
  self.x = self._io:read_f4be()
  self.y = self._io:read_f4be()
end


TagUnicodeStringList.TagId = class.class(KaitaiStruct)

function TagUnicodeStringList.TagId:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagUnicodeStringList.TagId:_read()
  self.index = self._io:read_u2be()
  self.id = self._io:read_u2be()
end


TagUnicodeStringList.ColorARGB = class.class(KaitaiStruct)

function TagUnicodeStringList.ColorARGB:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagUnicodeStringList.ColorARGB:_read()
  self.alpha = self._io:read_f4be()
  self.red = self._io:read_f4be()
  self.green = self._io:read_f4be()
  self.blue = self._io:read_f4be()
end


TagUnicodeStringList.TagReflexive = class.class(KaitaiStruct)

function TagUnicodeStringList.TagReflexive:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagUnicodeStringList.TagReflexive:_read()
  self.count = self._io:read_u4be()
  self.offset = self._io:read_u4be()
  self._unnamed2 = self._io:read_bytes(4)
end


