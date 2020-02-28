##
## Find TI's XDCTools
##

include(FindPackageHandleStandardArgs)

# Find the path to xdc headers
find_path(Xdctools_HEADER_DIR
    NAMES "std.h"
    PATH_SUFFIXES "packages/xdc"
    PATHS "${XDCTOOLS}"
    NO_CMAKE_FIND_ROOT_PATH
)
#message("Content of Xdctools_HEADER_DIR:" ${Xdctools_HEADER_DIR})

# Set according include path
set(Xdctools_INCLUDE_DIR "${Xdctools_HEADER_DIR}/../../packages")

#message("Content of Xdctools_INCLUDE_DIR:" ${Xdctools_INCLUDE_DIR})

find_package_handle_standard_args(Xdctools DEFAULT_MSG
  Xdctools_INCLUDE_DIR)

set(Xdctools_INCLUDE_DIRS ${Xdctools_INCLUDE_DIR})
