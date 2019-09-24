LOCAL_PATH := vendor/teamone/mod
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay/common/

# Themed bootanimation
TARGET_MISC_BLOCK_OFFSET ?= 0
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.misc.block.offset=$(TARGET_MISC_BLOCK_OFFSET)
PRODUCT_PACKAGES += \
    misc_writer_system \
    themed_bootanimation
