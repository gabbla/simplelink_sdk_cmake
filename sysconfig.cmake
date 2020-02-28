##
## Helper file to call TI sysconfig
##

find_package(SysConfig REQUIRED)
# Needed to get product.json
find_package(SimpleLinkCC26x2SDK REQUIRED)

function(call_sysconfig config output)
    set(PRODUCT_JSON_PATH ${SimpleLinkCC26x2SDK_DEVICES_DIR}/../../..)
    add_custom_target(sysconfig ALL ${SYSCONFIG}
            --product ${PRODUCT_JSON_PATH}/.metadata/product.json
            --output ${output}
            ${config}
            COMMENT "sysconfig: generating files.."
    )
endfunction(call_sysconfig)
