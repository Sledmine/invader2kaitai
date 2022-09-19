package.path = "src/lua/?.lua;lua_modules/?.lua;src/lua/tags/?.lua;" .. package.path
require "tags.tag_bitmap"

local bitmap = TagBitmap:from_file("tags/test.bitmap")


