vcpkg_download_distfile(ARCHIVE
    URLS "https://www.ginac.de/CLN/cln-1.3.6.tar.bz2"
    FILENAME "cln-1.3.6.tar.bz2"
    SHA512 a32a1449c5f0edac1444e58f500ef1a72ffab8dad65125082eff0995cc9855b45f38b89c7f754e3d4487756a8cd3f7db1e534865b8d0384fd28246f444ed7d14
)

vcpkg_extract_source_archive_ex(
    OUT_SOURCE_PATH SOURCE_PATH
    ARCHIVE ${ARCHIVE}
)

if(gmp IN_LIST FEATURES)
    set(BUILD_OPTS --with-gmp)
else()
    set(BUILD_OPTS --without-gmp)
endif()

vcpkg_configure_make(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS
        ${BUILD_OPTS}
)

vcpkg_install_make()
vcpkg_fixup_pkgconfig()
vcpkg_copy_pdbs()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

# Handle copyright
file(INSTALL ${SOURCE_PATH}/COPYING DESTINATION ${CURRENT_PACKAGES_DIR}/share/cln RENAME copyright)
