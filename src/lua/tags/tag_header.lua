-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")

TagHeader = class.class(KaitaiStruct)

function TagHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TagHeader:_read()
  self.id = self._io:read_u4be()
  self.name = self._io:read_bytes(32)
  self.class = self._io:read_bytes(4)
  self.crc32 = self._io:read_u4be()
  self.size = self._io:read_u4be()
  self._unnamed5 = self._io:read_u4be()
  self._unnamed6 = self._io:read_u4be()
  self.version = self._io:read_u2be()
  self.something_255 = self._io:read_u2be()
  self.engine = self._io:read_bytes(4)
  if not(self.engine == "\098\108\097\109") then
    error("not equal, expected " ..  "\098\108\097\109" .. ", but got " .. self.engine)
  end
end


