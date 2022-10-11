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

---@class InvaderElement
---@field name string
---@field options string[]
---@field type string | '"struct"' | '"enum"' | '"pad"' | '"bitfield"' | '"Angle"' | '"Fraction"' | '"TagEnum"' | '"TagString"' | '"TagIndex"' | '"unint8"' | '"unint16"' | '"unint32"' | '"int8"' | '"int16"' | '"int32"' | '"float"'
---@field size number
---@field width number
---@field bounds number
---@field fields InvaderElement[]
---@field struct string
---@field description string

---@class Field
---@field name string
---@field type string
---@field is_pointer boolean
---@field size number
---@field description string
---@field struct string

---@class Type
---@field fields Field[]

---@type table<string, Type>
local types = {
    tag_name = {fields = {{name = "index", type = "u2"}, {name = "id", type = "u2"}}},
    tag_reflexive = {
        fields = {
            {name = "count", type = "u4"},
            {name = "offset", type = "u4", is_pointer = true},
            {size = 4}
        }
    },
    point2_d = {fields = {{name = "x", type = "f4"}, {name = "y", type = "f4"}}},
    point2_d_int = {fields = {{name = "x", type = "s2"}, {name = "y", type = "s2"}}},
    rectangle2_d = {
        fields = {
            {name = "top", type = "s2"},
            {name = "left", type = "s2"},
            {name = "bottom", type = "s2"},
            {name = "right", type = "s2"}
        }
    },
    color_a_r_g_b = {
        fields = {
            {name = "alpha", type = "f4"},
            {name = "red", type = "f4"},
            {name = "green", type = "f4"},
            {name = "blue", type = "f4"}
        }
    },
    color_a_r_g_b_int = {
        fields = {
            {name = "blue", type = "u1"},
            {name = "green", type = "u1"},
            {name = "red", type = "u1"},
            {name = "alpha", type = "u1"}
        }
    },
    tag_data_offset = {
        fields = {
            {name = "size", type = "u4"},
            {name = "external", type = "u4"},
            {name = "file_offset", type = "u4"},
            {name = "pointer", type = "u4"},
            {size = 4}
        }
    },
    tag_dependency = {
        fields = {
            {name = "tag_fourcc", type = "u4"},
            {name = "path_pointer", type = "u4"},
            {name = "path_size", type = "u4"},
            {name = "tag_id", type = "u4"}
        }
    }
}

---@type table<string, table<string>>
local enums = {}

---@type Type[]
local structs = {}

---Convert an Invader element to type definition
---@param element InvaderElement
---@return Type
local function invaderElement2Type(element)
    local fieldName = convert.normalToSnakeCase(convert.camelCaseToSnakeCase(element.name))
    local fieldType = convert.normalToSnakeCase(convert.camelCaseToSnakeCase(element.type))
    if element.type == "pad" then
        return {type = "byte", size = element.size}
    elseif element.type == "enum" then
        if element.options then
            enums[fieldName] = {}
            for index, value in pairs(element.options) do
                local value = convert.dashAndSentenceToSnakeCase(value)
                enums[fieldName][tostring(index - 1)] = value
            end
        end
    elseif element.type == "bitfield" then
        element.width = element.width or 8
        local fieldSequence = {
            name = fieldName,
            type = "b" .. element.width,
            description = element.description
        }
        types[fieldName] = {fields = fieldSequence}
        return fieldSequence
    elseif element.type == "float" or element.type == "Angle" or element.type == "Fraction" then
        if element.bounds then
            return {name = fieldName, type = "f4", size = 2}
        end
        return {name = fieldName, type = "f4"}
    elseif element.type == "int16" then
        return {name = fieldName, type = "s2"}
    elseif element.type == "uint16" then
        return {name = fieldName, type = "u2"}
    elseif element.type == "uint32" then
        return {name = fieldName, type = "u4"}
    elseif element.type == "int32" then
        return {name = fieldName, type = "s4"}
    elseif element.type == "Index" or element.type == "TagEnum" then
        return {name = fieldName, type = "u2"}
    elseif element.type == "TagString" then
        return {name = fieldName, type = "str", size = 32, encoding = "ASCII"}
    elseif element.type == "TagFourCC" then
        return {name = "tag_fourcc", type = "str", size = 4, encoding = "ASCII"}
    elseif element.type == "TagID" then
        return {name = fieldName, type = "u4"}
    elseif element.type == "Pointer" then
        return {name = fieldName, type = "u4"}
    elseif element.type == "struct" then
        local fields = {}
        for _, field in pairs(element.fields) do
            table.insert(fields, invaderElement2Type(field))
        end
        types[fieldName] = {fields = fields}
        structs[#structs+1] = {name = fieldName, fields = fields}
        return fields
    elseif element.type == "TagReflexive" then
        return {name = fieldName, type = "tag_reflexive", struct = element.struct}
    elseif enums[fieldType] then
        return {name = fieldName, type = "u2", doc = element.description, enum = fieldType}
    elseif types[fieldType] then
        return {name = fieldName, type = fieldType}
    else
        print(fieldType)
        error(
            "Unknown element type: " .. element.type .. " for: " .. element.name .. " with name: " ..
                fieldName)
    end
end


local function tagBodyToFieldSequence()
    local fields = {}
    for _, element in pairs(defFile) do
        print(element.name, element.type)
        local fieldSequence = invaderElement2Type(element)
        if fieldSequence and _ == #defFile then
            for _, fieldSequenceElement in ipairs(fieldSequence) do
                table.insert(fields, fieldSequenceElement)
            end
        end
    end
    return fields
end

local tag = tagBodyToFieldSequence()
print(inspect(tag))
convert.toCStruct(defLabel, structs)
