#ifndef TAG_HEADER_H_
#define TAG_HEADER_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

class tag_header_t : public kaitai::kstruct {

public:

    tag_header_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, tag_header_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~tag_header_t();

private:
    uint32_t m_id;
    std::string m_name;
    std::string m_class;
    uint32_t m_crc32;
    uint32_t m_size;
    uint32_t m__unnamed5;
    uint32_t m__unnamed6;
    uint16_t m_version;
    uint16_t m_something_255;
    std::string m_engine;
    uint16_t m_version_for_tag;
    tag_header_t* m__root;
    kaitai::kstruct* m__parent;

public:
    uint32_t id() const { return m_id; }
    std::string name() const { return m_name; }
    std::string class() const { return m_class; }
    uint32_t crc32() const { return m_crc32; }
    uint32_t size() const { return m_size; }
    uint32_t _unnamed5() const { return m__unnamed5; }
    uint32_t _unnamed6() const { return m__unnamed6; }
    uint16_t version() const { return m_version; }
    uint16_t something_255() const { return m_something_255; }
    std::string engine() const { return m_engine; }
    uint16_t version_for_tag() const { return m_version_for_tag; }
    tag_header_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // TAG_HEADER_H_
