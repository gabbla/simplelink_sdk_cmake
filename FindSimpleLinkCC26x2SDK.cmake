##
## Find TI's SimpleLink CC26x2 SDK
##

include(FindPackageHandleStandardArgs)

if(NOT SLSDK_PATH)
    set(SLSDK_PATH "~/ti/simplelink_cc13x2_26x2_sdk_3_40_00_02")
    message(STATUS "Using default SLSDK_PATH: ${SLSDK_PATH}")
endif()

find_path(SimpleLinkCC26x2SDK_DEVICES_DIR
    NAMES "DeviceFamily.h"
    PATH_SUFFIXES "source/ti/devices"
    PATHS "${SLSDK_PATH}"
    NO_CMAKE_FIND_ROOT_PATH
)

#message("================================================================================")
#message("SimpleLinkCC26x2SDK_DEVICES_DIR: ${SimpleLinkCC26x2SDK_DEVICES_DIR}")

# Add suffix when looking for libraries
list(APPEND CMAKE_FIND_LIBRARY_SUFFIXES "am4fg" "lib")

# Find TI's drivers lib
find_library(SimpleLinkCC26x2SDK_drivers_cc26x2_LIBRARY
    NAMES "drivers_cc26x2.am4fg"
    PATH_SUFFIXES "source/ti/drivers/lib"
    PATHS "${SLSDK_PATH}"
    HINTS "${SimpleLinkCC26x2SDK_DEVICES_DIR}/../../../"
    NO_CMAKE_FIND_ROOT_PATH
)
#message(">>>>>>>>> SimpleLinkCC26x2SDK_drivers_cc26x2_LIBRARY: ${SimpleLinkCC26x2SDK_drivers_cc26x2_LIBRARY}")

# Find driver porting layer (FreeRTOS/TIRTOS) lib
find_library(SimpleLinkCC26x2SDK_dpl_cc26x2_LIBRARY
    NAMES "dpl_cc26x2.am4fg"
    PATH_SUFFIXES "kernel/tirtos/packages/ti/dpl/lib"
    PATHS "${SLSDK_PATH}"
    HINTS "${SimpleLinkCC26x2SDK_DEVICES_DIR}/../../../"
    NO_CMAKE_FIND_ROOT_PATH
)
#message(">>>>>>>>> SimpleLinkCC26x2SDK_dpl_cc26x2_LIBRARY: ${SimpleLinkCC26x2SDK_dpl_cc26x2_LIBRARY}")

# Find Driverlib
find_library(SimpleLinkCC26x2SDK_driverlib_LIBRARY
    NAMES driverlib.lib
    PATH_SUFFIXES "source/ti/devices/cc13x2_cc26x2/driverlib/bin/gcc"
    PATHS "${SLSDK_PATH}"
    HINTS "${SimpleLinkCC26x2SDK_DEVICES_DIR}/../../../"
    NO_CMAKE_FIND_ROOT_PATH
)
#message(">>>>>>>>> SimpleLinkCC26x2SDK_driverlib_LIBRARY: ${SimpleLinkCC26x2SDK_driverlib_LIBRARY}")
#message("================================================================================")

set(SimpleLinkCC26x2SDK_INCLUDE_DIRS
    "${SimpleLinkCC26x2SDK_DEVICES_DIR}/../.."
    "${SimpleLinkCC26x2SDK_DEVICES_DIR}/../../../kernel/tirtos/packages/ti/sysbios/posix"
    "${SimpleLinkCC26x2SDK_DEVICES_DIR}/../../../kernel/tirtos/packages"
)
#message("Content of SimpleLinkCC26x2SDK_INCLUDE_DIRS " ${SimpleLinkCC26x2SDK_INCLUDE_DIRS})

# Handle arguments and set SimpleLinkCC26x2SDK_FOUND to TRUE if all listed variables are TRUE
find_package_handle_standard_args(SimpleLinkCC26x2SDK  DEFAULT_MSG
    SimpleLinkCC26x2SDK_drivers_cc26x2_LIBRARY
    SimpleLinkCC26x2SDK_dpl_cc26x2_LIBRARY
    SimpleLinkCC26x2SDK_driverlib_LIBRARY
    SimpleLinkCC26x2SDK_INCLUDE_DIRS
)

set(SimpleLinkCC26x2SDK_LIBRARIES
    ${SimpleLinkCC26x2SDK_drivers_cc26x2_LIBRARY}
    ${SimpleLinkCC26x2SDK_dpl_cc26x2_LIBRARY}
    ${SimpleLinkCC26x2SDK_driverlib_LIBRARY}
)
