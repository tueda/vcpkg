set(CUBA_VERSION "4.2.1")

vcpkg_download_distfile(ARCHIVE
    URLS "http://www.feynarts.de/cuba/Cuba-${CUBA_VERSION}.tar.gz"
    FILENAME "Cuba-${CUBA_VERSION}.tar.gz"
    SHA512 624c9ab3521be38330a37e98318b076d6a3612f9b4e6856478151eb76705177a18bc0b1ae0a606c7751ceb1334df9c967861063b4b13e7040c8005c0c8ab1288
)

vcpkg_extract_source_archive_ex(
    OUT_SOURCE_PATH SOURCE_PATH
    ARCHIVE ${ARCHIVE}
)

vcpkg_configure_make(
    SOURCE_PATH ${SOURCE_PATH}
    COPY_SOURCE
)

vcpkg_build_make(
    BUILD_TARGET install
    MAKEFILE makefile
    DISABLE_PARALLEL
)

# Handle copyright
file(INSTALL ${SOURCE_PATH}/COPYING DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
