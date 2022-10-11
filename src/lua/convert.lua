local glue = require "glue"
local convert = {}

function convert.camelCaseToSnakeCase(str)
    if str then
        -- convert camelCase to snake_case but keep numbers
        local new = str:gsub("([A-Z])", function(c)
            return "_" .. c:lower()
        end)
        if new:sub(1, 1) == "_" then
            new = new:sub(2)
        end
        return new
    end
end

function convert.dashAndSentenceToSnakeCase(str)
    -- convert dash-and-sentence to snake_case
    return str:gsub("([A-Z])", function(c)
        return "_" .. c:lower()
    end):gsub("-", "_"):gsub(" ", "_"):gsub("'", "")
end

function convert.normalToSnakeCase(str)
    if str then
        -- convert normal sentence to snake_case
        return str:gsub(" ", "_"):gsub("'", "")
    end
end

function convert.snakeCaseToCamelCase(str)
    if str then
        -- convert snake_case to camelCase
        local new = str:gsub("_([a-z])", function(c)
            return c:upper()
        end)
        -- capitalize first letter
        new = new:sub(1, 1):upper() .. new:sub(2)
        return new
    end
end

-- From Invader
local TAG_FOURCC = {
    ACTOR = 0x61637472,
    ACTOR_VARIANT = 0x61637476,
    ANTENNA = 0x616E7421,
    MODEL_ANIMATIONS = 0x616E7472,
    BIPED = 0x62697064,
    BITMAP = 0x6269746D,
    SPHEROID = 0x626F6F6D,
    CONTINUOUS_DAMAGE_EFFECT = 0x63646D67,
    MODEL_COLLISION_GEOMETRY = 0x636F6C6C,
    COLOR_TABLE = 0x636F6C6F,
    CONTRAIL = 0x636F6E74,
    DEVICE_CONTROL = 0x6374726C,
    DECAL = 0x64656361,
    UI_WIDGET_DEFINITION = 0x44654C61,
    INPUT_DEVICE_DEFAULTS = 0x64657663,
    DEVICE = 0x64657669,
    DETAIL_OBJECT_COLLECTION = 0x646F6263,
    EFFECT = 0x65666665,
    EQUIPMENT = 0x65716970,
    FLAG = 0x666C6167,
    FOG = 0x666F6720,
    FONT = 0x666F6E74,
    MATERIAL_EFFECTS = 0x666F6F74,
    GARBAGE = 0x67617262,
    GLOW = 0x676C7721,
    GRENADE_HUD_INTERFACE = 0x67726869,
    HUD_MESSAGE_TEXT = 0x686D7420,
    HUD_NUMBER = 0x68756423,
    HUD_GLOBALS = 0x68756467,
    ITEM = 0x6974656D,
    ITEM_COLLECTION = 0x69746D63,
    DAMAGE_EFFECT = 0x6A707421,
    LENS_FLARE = 0x6C656E73,
    LIGHTNING = 0x656C6563,
    DEVICE_LIGHT_FIXTURE = 0x6C696669,
    LIGHT = 0x6C696768,
    SOUND_LOOPING = 0x6C736E64,
    DEVICE_MACHINE = 0x6D616368,
    GLOBALS = 0x6D617467,
    METER = 0x6D657472,
    LIGHT_VOLUME = 0x6D677332,
    GBXMODEL = 0x6D6F6432,
    MODEL = 0x6D6F6465,
    MULTIPLAYER_SCENARIO_DESCRIPTION = 0x6D706C79,
    PREFERENCES_NETWORK_GAME = 0x6E677072,
    -- NONE = ~static_cast<std::uint32_t>(0),
    NULL = 0,
    OBJECT = 0x6F626A65,
    PARTICLE = 0x70617274,
    PARTICLE_SYSTEM = 0x7063746C,
    PHYSICS = 0x70687973,
    PLACEHOLDER = 0x706C6163,
    POINT_PHYSICS = 0x70706879,
    PROJECTILE = 0x70726F6A,
    WEATHER_PARTICLE_SYSTEM = 0x7261696E,
    SCENARIO_STRUCTURE_BSP = 0x73627370,
    SCENERY = 0x7363656E,
    SHADER_TRANSPARENT_CHICAGO_EXTENDED = 0x73636578,
    SHADER_TRANSPARENT_CHICAGO = 0x73636869,
    SCENARIO = 0x73636E72,
    SHADER_ENVIRONMENT = 0x73656E76,
    SHADER_TRANSPARENT_GLASS = 0x73676C61,
    SHADER = 0x73686472,
    SKY = 0x736B7920,
    SHADER_TRANSPARENT_METER = 0x736D6574,
    SOUND = 0x736E6421,
    SOUND_ENVIRONMENT = 0x736E6465,
    SHADER_MODEL = 0x736F736F,
    SHADER_TRANSPARENT_GENERIC = 0x736F7472,
    UI_WIDGET_COLLECTION = 0x536F756C,
    SHADER_TRANSPARENT_PLASMA = 0x73706C61,
    SOUND_SCENERY = 0x73736365,
    STRING_LIST = 0x73747223,
    SHADER_TRANSPARENT_WATER = 0x73776174,
    TAG_COLLECTION = 0x74616763,
    CAMERA_TRACK = 0x7472616B,
    DIALOGUE = 0x75646C67,
    UNIT_HUD_INTERFACE = 0x756E6869,
    UNIT = 0x756E6974,
    UNICODE_STRING_LIST = 0x75737472,
    VIRTUAL_KEYBOARD = 0x76636B79,
    VEHICLE = 0x76656869,
    WEAPON = 0x77656170,
    WIND = 0x77696E64,
    WEAPON_HUD_INTERFACE = 0x77706869
}

function convert.tag_version(tag_class)
    tag_class = tonumber(glue.string.tohex(tag_class), 16)
    if tag_class == TAG_FOURCC.ACTOR then
        return 2
    end
    if tag_class == TAG_FOURCC.MODEL_ANIMATIONS then
        return 4
    end
    if tag_class == TAG_FOURCC.BIPED then
        return 3
    end
    if tag_class == TAG_FOURCC.BITMAP then
        return 7
    end
    if tag_class == TAG_FOURCC.CONTRAIL then
        return 3
    end
    if tag_class == TAG_FOURCC.EFFECT then
        return 4
    end
    if tag_class == TAG_FOURCC.EQUIPMENT then
        return 2
    end
    if tag_class == TAG_FOURCC.ITEM then
        return 2
    end
    if tag_class == TAG_FOURCC.ITEM_COLLECTION then
        return 0
    end
    if tag_class == TAG_FOURCC.DAMAGE_EFFECT then
        return 6
    end
    if tag_class == TAG_FOURCC.LENS_FLARE then
        return 2
    end
    if tag_class == TAG_FOURCC.LIGHT then
        return 3
    end
    if tag_class == TAG_FOURCC.SOUND_LOOPING then
        return 3
    end
    if tag_class == TAG_FOURCC.GBXMODEL then
        return 5
    end
    if tag_class == TAG_FOURCC.GLOBALS then
        return 3
    end
    if tag_class == TAG_FOURCC.MODEL then
        return 4
    end
    if tag_class == TAG_FOURCC.MODEL_COLLISION_GEOMETRY then
        return 10
    end
    if tag_class == TAG_FOURCC.PARTICLE then
        return 2
    end
    if tag_class == TAG_FOURCC.PARTICLE_SYSTEM then
        return 4
    end
    if tag_class == TAG_FOURCC.PHYSICS then
        return 4
    end
    if tag_class == TAG_FOURCC.PLACEHOLDER then
        return 2
    end
    if tag_class == TAG_FOURCC.PREFERENCES_NETWORK_GAME then
        return 2
    end
    if tag_class == TAG_FOURCC.PROJECTILE then
        return 5
    end
    if tag_class == TAG_FOURCC.SCENARIO_STRUCTURE_BSP then
        return 5
    end
    if tag_class == TAG_FOURCC.SCENARIO then
        return 2
    end
    if tag_class == TAG_FOURCC.SHADER_ENVIRONMENT then
        return 2
    end
    if tag_class == TAG_FOURCC.SOUND then
        return 4
    end
    if tag_class == TAG_FOURCC.SHADER_MODEL then
        return 2
    end
    if tag_class == TAG_FOURCC.SHADER_TRANSPARENT_WATER then
        return 2
    end
    if tag_class == TAG_FOURCC.CAMERA_TRACK then
        return 2
    end
    if tag_class == TAG_FOURCC.UNIT then
        return 2
    end
    if tag_class == TAG_FOURCC.VIRTUAL_KEYBOARD then
        return 2
    end
    if tag_class == TAG_FOURCC.WEAPON then
        return 2
    end
    if tag_class == TAG_FOURCC.WEAPON_HUD_INTERFACE then
        return 2
    end
    return 1
end

local primitiveTypes = {
    byte = "std::byte",
    u1 = "std::uint8_t",
    u2 = "std::uint16_t",
    u4 = "std::uint32_t",
    u8 = "std::uint64_t",
    s1 = "std::int8_t",
    s2 = "std::int16_t",
    s4 = "std::int32_t",
    s8 = "std::int64_t",
    f4 = "float",
    f8 = "double",
    str = "char",
    -- Careful with this we might need to remove them in order to use a custom type
    b8 = "std::int8_t",
    b16 = "std::int16_t",
    b32 = "std::int32_t",
}

function convert.toCStruct(structName, structElements, members)
    local struct = [[
#include <cstdint>
#include "types.hpp"

namespace Balltze::Engine::TagDefinitions { 
]]
    local function add(text)
        struct = struct .. text
    end
    local function ident(n)
        add(string.rep("\t", n))
    end
    
    for structIndex, struct in pairs(structElements) do
        ident(1)
        add("struct " .. convert.snakeCaseToCamelCase(struct.name) .. " {\n")
        for sequenceIndex, element in ipairs(struct.fields) do
            ident(2)
            if element.name then
                local type = element.type
                if primitiveTypes[type] then
                    type = primitiveTypes[type]
                elseif type then
                    type = convert.snakeCaseToCamelCase(type)
                end
                if type then
                    if type == "TagReflexive" then
                        add(type .. "<" .. element.struct .. "> " .. element.name .. ";\n")
                    else
                        if element.size then
                            add(type .. " " .. element.name .. "[" .. element.size .. "];\n")
                        else
                            add(type .. " " .. element.name .. ";\n")
                        end
                    end
                else
                    add("std::byte " .. element.name .. "[" .. element.size .. "];\n")
                end
            else
                add("std::byte pad_" .. sequenceIndex  .. "[" .. element.size .. "];\n")
            end
        end
        ident(1)
        add("};\n")
    end
    add("}\n")
    glue.writefile("src/include/" .. structName .. ".hpp", struct, "t")
end

return convert
