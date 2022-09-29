package.path = "src/lua/?.lua;lua_modules/?.lua;src/lua/tags/?.lua;" .. package.path
local inspect = require "inspect"
local convert = require "src.lua.convert"
require "tags.tag_bitmap"
local lu = require "luaunit"

local bitmap = TagBitmap:from_file("tags/bitmaps/2d_texture.bitmap")

test_tag = {}

function test_tag:setup()
end

function test_tag:test_bitmap()
    local tag_version = convert.tag_version(bitmap.header.class)
    lu.assertEquals(bitmap.header.class, "bitm", "class must be \"bitm\"")
    lu.assertIsTrue(bitmap.header.crc32 > 0, "crc32 must be > 0")
    lu.assertIsTrue(bitmap.header.size > 0, "size must be > 0")
    lu.assertEquals(bitmap.header.version, tag_version, "version must be " .. tag_version)
    lu.assertEquals(bitmap.header.something_255, 255)
    lu.assertEquals(bitmap.header.engine, "blam")
    --lu.assertEquals(bitmap.header.version_for_tag, 1)
    lu.assertEquals(bitmap.type.label, "e_2d_textures")
    --lu.assertEquals(bitmap.bitmap_format.label, "dxt1")
end

local runner = lu.LuaUnit.new()
runner:runSuite()