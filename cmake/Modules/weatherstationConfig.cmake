INCLUDE(FindPkgConfig)
PKG_CHECK_MODULES(PC_WEATHERSTATION weatherstation)

FIND_PATH(
    WEATHERSTATION_INCLUDE_DIRS
    NAMES weatherstation/api.h
    HINTS $ENV{WEATHERSTATION_DIR}/include
        ${PC_WEATHERSTATION_INCLUDEDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/include
          /usr/local/include
          /usr/include
)

FIND_LIBRARY(
    WEATHERSTATION_LIBRARIES
    NAMES gnuradio-weatherstation
    HINTS $ENV{WEATHERSTATION_DIR}/lib
        ${PC_WEATHERSTATION_LIBDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/lib64
          /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
          )

include("${CMAKE_CURRENT_LIST_DIR}/weatherstationTarget.cmake")

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(WEATHERSTATION DEFAULT_MSG WEATHERSTATION_LIBRARIES WEATHERSTATION_INCLUDE_DIRS)
MARK_AS_ADVANCED(WEATHERSTATION_LIBRARIES WEATHERSTATION_INCLUDE_DIRS)
