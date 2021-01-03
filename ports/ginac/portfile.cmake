vcpkg_download_distfile(ARCHIVE
    URLS "https://www.ginac.de/ginac-1.8.0.tar.bz2"
    FILENAME "ginac-1.8.0.tar.bz2"
    SHA512 6cacd0d87ffae24118f2fbaed4d201ee2d3812a751becef1982308e91cf489543db14443439da9333f3620dc5c8b1c32587e1aff0bed69e6e334310dc64edf49
)

vcpkg_extract_source_archive_ex(
    OUT_SOURCE_PATH SOURCE_PATH
    ARCHIVE ${ARCHIVE}
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
#   PREFER_NINJA
)

vcpkg_install_cmake()
vcpkg_fixup_pkgconfig() 
vcpkg_copy_pdbs()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

# Handle copyright
file(INSTALL ${SOURCE_PATH}/COPYING DESTINATION ${CURRENT_PACKAGES_DIR}/share/ginac RENAME copyright)
