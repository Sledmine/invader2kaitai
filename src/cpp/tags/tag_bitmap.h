#ifndef TAG_BITMAP_H_
#define TAG_BITMAP_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include "tag_header.h"

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif
class tag_header_t;

class tag_bitmap_t : public kaitai::kstruct {

public:

    enum bitmap_format_t {
        BITMAP_FORMAT_E_DXT1 = 1,
        BITMAP_FORMAT_E_DXT3 = 2,
        BITMAP_FORMAT_E_DXT5 = 3,
        BITMAP_FORMAT_E_16_BIT = 4,
        BITMAP_FORMAT_E_32_BIT = 5,
        BITMAP_FORMAT_E_MONOCHROME = 6
    };

    enum bitmap_sprite_usage_t {
        BITMAP_SPRITE_USAGE_E_BLEND_ADD_SUBTRACT_MAX = 1,
        BITMAP_SPRITE_USAGE_E_MULTIPLY_MIN = 2,
        BITMAP_SPRITE_USAGE_E_DOUBLE_MULTIPLY = 3
    };

    enum bitmap_sprite_budget_size_t {
        BITMAP_SPRITE_BUDGET_SIZE_E_32X32 = 1,
        BITMAP_SPRITE_BUDGET_SIZE_E_64X64 = 2,
        BITMAP_SPRITE_BUDGET_SIZE_E_128X128 = 3,
        BITMAP_SPRITE_BUDGET_SIZE_E_256X256 = 4,
        BITMAP_SPRITE_BUDGET_SIZE_E_512X512 = 5,
        BITMAP_SPRITE_BUDGET_SIZE_E_1024X1024 = 6
    };

    enum bitmap_usage_t {
        BITMAP_USAGE_E_ALPHA_BLEND = 1,
        BITMAP_USAGE_E_DEFAULT = 2,
        BITMAP_USAGE_E_HEIGHT_MAP = 3,
        BITMAP_USAGE_E_DETAIL_MAP = 4,
        BITMAP_USAGE_E_LIGHT_MAP = 5,
        BITMAP_USAGE_E_VECTOR_MAP = 6
    };

    enum bitmap_type_t {
        BITMAP_TYPE_E_2D_TEXTURES = 1,
        BITMAP_TYPE_E_3D_TEXTURES = 2,
        BITMAP_TYPE_E_CUBE_MAPS = 3,
        BITMAP_TYPE_E_SPRITES = 4,
        BITMAP_TYPE_E_INTERFACE_BITMAPS = 5
    };

    enum bitmap_data_type_t {
        BITMAP_DATA_TYPE_E_2D_TEXTURE = 1,
        BITMAP_DATA_TYPE_E_3D_TEXTURE = 2,
        BITMAP_DATA_TYPE_E_CUBE_MAP = 3,
        BITMAP_DATA_TYPE_E_WHITE = 4
    };

    enum bitmap_data_format_t {
        BITMAP_DATA_FORMAT_E_A8 = 1,
        BITMAP_DATA_FORMAT_E_Y8 = 2,
        BITMAP_DATA_FORMAT_E_AY8 = 3,
        BITMAP_DATA_FORMAT_E_A8Y8 = 4,
        BITMAP_DATA_FORMAT_E_UNUSED1 = 5,
        BITMAP_DATA_FORMAT_E_UNUSED2 = 6,
        BITMAP_DATA_FORMAT_E_R5G6B5 = 7,
        BITMAP_DATA_FORMAT_E_UNUSED3 = 8,
        BITMAP_DATA_FORMAT_E_A1R5G5B5 = 9,
        BITMAP_DATA_FORMAT_E_A4R4G4B4 = 10,
        BITMAP_DATA_FORMAT_E_X8R8G8B8 = 11,
        BITMAP_DATA_FORMAT_E_A8R8G8B8 = 12,
        BITMAP_DATA_FORMAT_E_UNUSED4 = 13,
        BITMAP_DATA_FORMAT_E_UNUSED5 = 14,
        BITMAP_DATA_FORMAT_E_DXT1 = 15,
        BITMAP_DATA_FORMAT_E_DXT3 = 16,
        BITMAP_DATA_FORMAT_E_DXT5 = 17,
        BITMAP_DATA_FORMAT_E_P8_BUMP = 18
    };

    tag_bitmap_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, tag_bitmap_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~tag_bitmap_t();

private:
    tag_header_t* m_header;
    bitmap_data_type_t m_bitmap_data_type;
    bitmap_data_format_t m_bitmap_data_format;
    bitmap_type_t m_bitmap_type;
    bitmap_format_t m_bitmap_format;
    bitmap_usage_t m_bitmap_usage;
    bitmap_sprite_budget_size_t m_bitmap_sprite_budget_size;
    bitmap_sprite_usage_t m_bitmap_sprite_usage;
    uint64_t m_bitmap_data_flags;
    uint64_t m_bitmap_flags;
    tag_bitmap_t* m__root;
    kaitai::kstruct* m__parent;

public:
    tag_header_t* header() const { return m_header; }
    bitmap_data_type_t bitmap_data_type() const { return m_bitmap_data_type; }
    bitmap_data_format_t bitmap_data_format() const { return m_bitmap_data_format; }
    bitmap_type_t bitmap_type() const { return m_bitmap_type; }
    bitmap_format_t bitmap_format() const { return m_bitmap_format; }
    bitmap_usage_t bitmap_usage() const { return m_bitmap_usage; }
    bitmap_sprite_budget_size_t bitmap_sprite_budget_size() const { return m_bitmap_sprite_budget_size; }
    bitmap_sprite_usage_t bitmap_sprite_usage() const { return m_bitmap_sprite_usage; }
    uint64_t bitmap_data_flags() const { return m_bitmap_data_flags; }
    uint64_t bitmap_flags() const { return m_bitmap_flags; }
    tag_bitmap_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // TAG_BITMAP_H_
