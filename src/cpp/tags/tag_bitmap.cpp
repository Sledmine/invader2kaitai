// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "tag_bitmap.h"

tag_bitmap_t::tag_bitmap_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, tag_bitmap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_header = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void tag_bitmap_t::_read() {
    m_header = new tag_header_t(m__io);
    m_bitmap_data_type = static_cast<tag_bitmap_t::bitmap_data_type_t>(m__io->read_u2be());
    m_bitmap_data_format = static_cast<tag_bitmap_t::bitmap_data_format_t>(m__io->read_u2be());
    m_bitmap_type = static_cast<tag_bitmap_t::bitmap_type_t>(m__io->read_u2be());
    m_bitmap_format = static_cast<tag_bitmap_t::bitmap_format_t>(m__io->read_u2be());
    m_bitmap_usage = static_cast<tag_bitmap_t::bitmap_usage_t>(m__io->read_u2be());
    m_bitmap_sprite_budget_size = static_cast<tag_bitmap_t::bitmap_sprite_budget_size_t>(m__io->read_u2be());
    m_bitmap_sprite_usage = static_cast<tag_bitmap_t::bitmap_sprite_usage_t>(m__io->read_u2be());
    m_bitmap_data_flags = m__io->read_bits_int_be(16);
    m_bitmap_flags = m__io->read_bits_int_be(16);
}

tag_bitmap_t::~tag_bitmap_t() {
    _clean_up();
}

void tag_bitmap_t::_clean_up() {
    if (m_header) {
        delete m_header; m_header = 0;
    }
}
