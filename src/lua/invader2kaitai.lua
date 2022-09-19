package.path = "src/lua/?.lua;lua_modules/?.lua;" .. package.path
local argparse = require "argparse"
local glue = require "glue"
local json = require "json"
local inspect = require "inspect"
local convert = require "convert"

local parser = argparse("invader2kaitai", "Convert Invader tags to Kaitai Struct")
parser:argument("input", "Input file"):args(1)

local args = parser:parse()

local defFile = json.decode(glue.readfile(args.input))
local defFileName = "tag_" .. args.input:match("([^/]+)$")
local defName = defFileName:match("^(.+)%..+$")

local kataiYml = {
    meta = {
        id = defName,
        endian = "be"
    },
    seq = {},
    enums = {}
}

for _, field in pairs(defFile) do
    --print(field.name, field.type)
    local fieldSnakeCase = convert.camelCaseToSnakeCase(field.name)
    if field.type == "enum" then
        kataiYml.seq[#kataiYml.seq+1] = {
            id = fieldSnakeCase,
            type = "u2",
            doc = field.description,
            enum = fieldSnakeCase
        }
        if field.options then
            kataiYml.enums[fieldSnakeCase] = {}
            for index, value in pairs(field.options) do
                kataiYml.enums[fieldSnakeCase][tostring(index)] = "e_" .. convert.dashAndSentenceToSnakeCase(value)
            end
        end
    elseif field.type == "bitfield" then
        field.width = field.width or 8
        kataiYml.seq[#kataiYml.seq+1] = {
            id = fieldSnakeCase,
            type = "b" .. field.width,
            doc = field.description
        }
    else
        print("Unknown type", field.name, field.type)
    end
end

local savedAsJson = glue.writefile("src/defs/" .. defFileName, json.encode(kataiYml))
if savedAsJson then
    print("- Saved as JSON")
end
local convertedToYml = os.execute("cat src/defs/" .. defFileName .. " | yq -P > src/defs/" .. defName .. ".yml")
if convertedToYml then
    print("- Converted to YML")
    os.remove("src/defs/" .. defFileName)
end
local kaitaiToLua = os.execute("ksc -t lua src/defs/" .. defName .. ".yml")
if kaitaiToLua then
    print("- Converted to Lua")
end

print("Done")
