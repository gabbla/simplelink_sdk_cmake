##
## Target specific configuration
## Target: TI SimpleLink CC26x2
##

message(STATUS "Target device: SimpleLink CC26x2")

# Target specific flags
# -mcpu=cortex-m4       Secifies the name of the target ARM processor.
# -march=armv7e-m       Specifies the name of the target ARM architecture.
# -mfloat-abi=hard      Specifies which floating-point ABI to use.
# -mfpu=fpv4-sp-d16     Specify the FPU available in hw.
set(OBJ_GEN_FLAGS -mcpu=cortex-m4 -march=armv7e-m -mfloat-abi=hard
    -mfpu=fpv4-sp-d16
    -DDeviceFamily_CC26X2)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${OBJECT_GEN_FLAGS}"
    CACHE INTERNAL "C Compiler options")
set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS} ${OBJECT_GEN_FLAGS}"
    CACHE INTERNAL "C++ Compiler options")
set(CMAKE_ASM_FLAGS "${CMAKE_C_FLAGS} ${OBJECT_GEN_FLAGS}"
    CACHE INTERNAL "ASM Compiler options")
