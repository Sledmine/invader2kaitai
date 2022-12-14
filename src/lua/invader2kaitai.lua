package.path = "src/lua/?.lua;lua_modules/?.lua;" .. package.path
local argparse = require "argparse"
local glue = require "glue"
local json = require "json"
local inspect = require "inspect"
local convert = require "convert"

local parser = argparse("invader2kaitai", "Convert Invader tags to Kaitai Struct")
parser:argument("input", "Input file"):args(1)
-- parser:flag("-r --runtime", "Generate runtime structure")
parser:flag("-c --code", "Generate language code")
parser:flag("-s --struct", "Dump KSY result to a C struct")

local args = parser:parse()

local defFile = json.decode(glue.readfile(args.input))
local fileName = args.input:match("([^/]+)$")
local defFileName = "tag_" .. fileName
local defName = defFileName:match("^(.+)%..+$")
local defLabel = fileName:match("^(.+)%..+$")

local ksy = {
    meta = {id = defName, endian = "be", imports = {"tag_header"}},
    seq = {{id = "header", type = "tag_header"}},
    enums = {},
    types = {
        tag_id = {
            seq = {
                {id = "index", type = "u2"},
                {id = "id", type = "u2"},
            }
        },
        tag_reflexive = {
            seq = {
                {
                    id = "count",
                    type = "u4"
                    -- doc = "Number of elements"
                },
                {
                    id = "offset",
                    type = "u4"
                    -- doc = "Offset to elements"
                },
                {size = 4}
            }
        },
        point2_d = {seq = {{id = "x", type = "f4"}, {id = "y", type = "f4"}}},
        point2_d_int = {seq = {{id = "x", type = "s2"}, {id = "y", type = "s2"}}},
        rectangle2_d = {
            seq = {
                {id = "top", type = "s2"},
                {id = "left", type = "s2"},
                {id = "bottom", type = "s2"},
                {id = "right", type = "s2"}
            }
        },
        color_a_r_g_b = {
            seq = {
                {id = "alpha", type = "f4"},
                {id = "red", type = "f4"},
                {id = "green", type = "f4"},
                {id = "blue", type = "f4"}
            }
        },
        color_a_r_g_b_int = {
            seq = {
                {id = "blue", type = "u1"},
                {id = "green", type = "u1"},
                {id = "red", type = "u1"},
                {id = "alpha", type = "u1"}
            }
        },
        tag_data_offset = {
            seq = {
                {id = "size", type = "u4"},
                {id = "external", type = "u4"},
                {id = "file_offset", type = "u4"},
                {id = "pointer", type = "u4"},
                {size = 4}
            }
        },
        tag_dependency = {
            seq = {
                {id = "tag_fourcc", type = "u4"},
                {id = "path_pointer", type = "u4"},
                {id = "path_size", type = "u4"},
                {id = "tag_id", type = "u4"}
            }
        }
    }
}

local types = {}
for typeName, type in pairs(ksy.types) do
    types[#types + 1] = {id = typeName, seq = type.seq}
end
--convert.toCStruct("types", types)

local structs = {}
local flags = {}

local function elementToSequence(element)
    local fieldName = convert.normalToSnakeCase(convert.camelCaseToSnakeCase(element.name))
    local fieldType = convert.normalToSnakeCase(convert.camelCaseToSnakeCase(element.type))
    if element.type == "pad" then
        -- return {type = "str", size = element.size, encoding = "ASCII"}
        return {size = element.size}
    elseif element.type == "enum" then
        if element.options then
            ksy.enums[fieldName] = {}
            for index, value in pairs(element.options) do
                local value = convert.dashAndSentenceToSnakeCase(value)
                if value:match("^%d") then
                    value = "e_" .. value
                end
                ksy.enums[fieldName][tostring(index - 1)] = value
            end
        end
        local sequence = {type = "u2"}
    elseif element.type == "bitfield" then
        element.width = element.width or 8
        local sequence = {id = fieldName, type = "b" .. element.width, doc = element.description}
        -- structs[#structs + 1] = {id = fieldName, seq = sequence, fields = element.fields}

        ksy.types[fieldName] = {
            seq = {{id = fieldName, type = "b" .. element.width, doc = element.description}}
        }
        return sequence
    elseif element.type == "float" or element.type == "Angle" or element.type == "Fraction" then
        if element.bounds then
            return {id = fieldName, type = "f4", size = 2}
        end
        return {id = fieldName, type = "f4"}
    elseif element.type == "int16" then
        return {id = fieldName, type = "s2"}
    elseif element.type == "uint16" then
        return {id = fieldName, type = "u2"}
    elseif element.type == "uint32" then
        return {id = fieldName, type = "u4"}
    elseif element.type == "int32" then
        return {id = fieldName, type = "s4"}
    elseif element.type == "Index" or element.type == "TagEnum" then
        return {id = fieldName, type = "u2"}
    elseif element.type == "TagString" then
        return {id = fieldName, type = "str", size = 32, encoding = "ASCII"}
    elseif element.type == "TagFourCC" then
        return {id = "tag_fourcc", type = "str", size = 4, encoding = "ASCII"}
    elseif element.type == "TagID" then
        return {id = fieldName, type = "u4"}
    elseif element.type == "Pointer" then
        return {id = fieldName, type = "u4"}
    elseif element.type == "struct" then
        local sequence = {}
        for _, field in pairs(element.fields) do
            table.insert(sequence, elementToSequence(field))
        end
        ksy.types[fieldName] = {seq = sequence}
        structs[#structs + 1] = {id = fieldName, seq = sequence}
        return sequence
    elseif element.type == "TagReflexive" then
        -- FIXME We need to remove the scrupt property from this
        --return {id = fieldName, type = "tag_reflexive", struct = element.struct}
        return {id = fieldName, type = "tag_reflexive"}
    elseif ksy.enums[fieldType] then
        return {id = fieldName, type = "u2", doc = element.description, enum = fieldType}
    elseif ksy.types[fieldType] then
        return {id = fieldName, type = fieldType}
    else
        print(fieldType)
        error(
            "Unknown element type: " .. element.type .. " for: " .. element.name .. " with name: " ..
                fieldName)
    end
end

local function tagBodyToSequence()
    for _, element in pairs(defFile) do
        print(element.name, element.type)
        local sequence = elementToSequence(element)
        if sequence and _ == #defFile then
            for _, sequenceElement in ipairs(sequence) do
                local seq = glue.deepcopy(sequenceElement)
                if seq.struct then
                    seq.struct = nil
                end
                table.insert(ksy.seq, seq)
            end
        end
    end
    ksy.enums = nil
end

tagBodyToSequence()

--convert.toCStruct(defLabel, structs, glue.map(ksy.types, function(k, v)
--    return {id = k, seq = v.seq}
--end))

if args.code then
    local savedAsJson = glue.writefile("src/defs/" .. defFileName, json.encode(ksy))
    if savedAsJson then
        print("- Saved as JSON")
    end
    local convertedToYml = os.execute("cat src/defs/" .. defFileName .. " | yq -P > src/defs/" ..
                                          defName .. ".ksy")
    if convertedToYml then
        print("- JSON to KSY")
        os.remove("src/defs/" .. defFileName)
    end

    local kaitaiToLua =
        os.execute("ksc -t lua --outdir src/lua/tags src/defs/" .. defName .. ".ksy")
    if kaitaiToLua then
        print("- Converted to Lua")
    end
end

print("Done")
