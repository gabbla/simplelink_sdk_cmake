# cmake toolchain file for arm-none-eabi
# Append this directory to the CMAKE_MODULE_PATH
message(STATUS "cmake arm-none-eabi toolchain file")
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR})

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)

set(TOOLCHAIN arm-none-eabi)
set(TOOLCHAIN_PREFIX /usr)
set(TOOLCHAIN_BIN_DIR ${TOOLCHAIN_PREFIX}/bin)
set(TOOLCHAIN_INC_DIR ${TOOLCHAIN_PREFIX}/${TOOLCHAIN}/include)
set(TOOLCHAIN_LIB_DIR ${TOOLCHAIN_PREFIX}/${TOOLCHAIN}/lib)

set(SDK_ROOT "/opt/ti/simplelink_cc13x2_26x2_sdk_3_40_00_02"
    CACHE INTERNAL "SDK path")
set(XDCTOOLS "/opt/ti/xdctools_3_60_02_34_core"
    CACHE INTERNAL "XDCTools path")

################################################################################
# Compiler/Linker flags
################################################################################
# -mthumb               Generat thumb instructions.
# -ffunction-sections   Place each function item into its own section in the
#                       output file.
# -fdata-sections       Place each data item into its own section in the output
#                       file.
# -g                    Produce debugging information in the operating system’s
#                       native format.
# -gstrict-dwarf        Disallow using extensions of later DWARF standard
#                       version than selected with -gdwarf-version.
# -Wall                 Print only standard warnings, for all use Wextra
set(OBJ_GEN_FLAGS "-mthumb  -ffunction-sections -fdata-sections -g \
    -gstrict-dwarf -Wall")
set(CMAKE_C_FLAGS   "${OBJ_GEN_FLAGS} -std=gnu99 "
    CACHE INTERNAL "C Compiler options")
set(CMAKE_CXX_FLAGS "${OBJ_GEN_FLAGS} -std=c++11 "
    CACHE INTERNAL "C++ Compiler options")
set(CMAKE_ASM_FLAGS "${OBJ_GEN_FLAGS} -x assembler-with-cpp "
    CACHE INTERNAL "ASM Compiler options")

# TODO
# -Wl,--gc-sections     Perform the dead code elimination.
# --specs=nano.specs    Link with newlib-nano.
# --specs=nosys.specs   No syscalls, provide empty implementations for the
#                       POSIX system calls.
# -march=armv7e-m

# To set the linker file: (XXX To be tested)
# set_target_properties(${TARGET_NAME} PROPERTIES LINK_DEPENDS ${LINKER_SCRIPT})
set(CMAKE_EXE_LINKER_FLAGS "-Wl,--gc-sections --specs=nano.specs \
    --specs=nosys.specs -march=armv7e-m -mfloat-abi=hard -mthumb -mabi=aapcs \
    -mfpu=fpv4-sp-d16 -nostartfiles -static \
    -Wl,-Map=${CMAKE_PROJECT_NAME}.map"
    CACHE INTERNAL "Linker options")

# TODO
################################################################################
# Debug/Release flags
################################################################################
# Options for DEBUG build
# -Og   Enables optimizations that do not interfere with debugging.
# -g    Produce debugging information in the operating system’s native format.
set(CMAKE_C_FLAGS_DEBUG "-Og -g"
    CACHE INTERNAL "C Compiler options for debug build type")
set(CMAKE_CXX_FLAGS_DEBUG "-Og -g"
    CACHE INTERNAL "C++ Compiler options for debug build type")
set(CMAKE_ASM_FLAGS_DEBUG "-g"
    CACHE INTERNAL "ASM Compiler options for debug build type")
set(CMAKE_EXE_LINKER_FLAGS_DEBUG ""
    CACHE INTERNAL "Linker options for debug build type")

# Options for RELEASE build
# -Os   Optimize for size. -Os enables all -O2 optimizations.
# -flto Runs the standard link-time optimizer.
set(CMAKE_C_FLAGS_RELEASE "-Os -flto"
    CACHE INTERNAL "C Compiler options for release build type")
set(CMAKE_CXX_FLAGS_RELEASE "-Os -flto"
    CACHE INTERNAL "C++ Compiler options for release build type")
set(CMAKE_ASM_FLAGS_RELEASE ""
    CACHE INTERNAL "ASM Compiler options for release build type")
set(CMAKE_EXE_LINKER_FLAGS_RELEASE "-flto"
    CACHE INTERNAL "Linker options for release build type")

# Perform compiler test with static library
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

set(CMAKE_C_COMPILER ${TOOLCHAIN_BIN_DIR}/${TOOLCHAIN}-gcc
    CACHE INTERNAL "C Compiler")
set(CMAKE_CXX_COMPILER ${TOOLCHAIN_BIN_DIR}/${TOOLCHAIN}-g++
    CACHE INTERNAL "C++ Compiler")
set(CMAKE_ASM_COMPILER ${TOOLCHAIN_BIN_DIR}/${TOOLCHAIN}-gcc
    CACHE INTERNAL "ASM Compiler")

set(CMAKE_FIND_ROOT_PATH ${TOOLCHAIN_PREFIX}/${${TOOLCHAIN}}
    ${CMAKE_PREFIX_PATH})

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
