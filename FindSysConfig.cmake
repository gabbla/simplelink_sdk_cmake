##
## Find TI's SysConfig tool
##

include(FindPackageHandleStandardArgs)

# Find the path to xdc headers
find_program(SYSCONFIG
    NAMES "sysconfig_cli.sh"
)

find_package_handle_standard_args(SysConfig DEFAULT_MSG SYSCONFIG)
