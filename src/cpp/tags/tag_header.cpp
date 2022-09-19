// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "tag_header.h"
#include "kaitai/exceptions.h"

tag_header_t::tag_header_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, tag_header_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void tag_header_t::_read() {
    m_id = m__io->read_u4be();
    m_name = m__io->read_bytes(32);
    m_class = m__io->read_bytes(4);
    m_crc32 = m__io->read_u4be();
    m_size = m__io->read_u4be();
    m__unnamed5 = m__io->read_u4be();
    m__unnamed6 = m__io->read_u4be();
    m_version = m__io->read_u2be();
    m_something_255 = m__io->read_u2be();
    m_engine = m__io->read_bytes(4);
    if (!(engine() == std::string("\x62\x6C\x61\x6D", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x62\x6C\x61\x6D", 4), engine(), _io(), std::string("/seq/9"));
    }
    m_version_for_tag = m__io->read_u2be();
}

tag_header_t::~tag_header_t() {
    _clean_up();
}

void tag_header_t::_clean_up() {
}
