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

# Prebuilt Packages
PRODUCT_PACKAGES += \
    NexusLauncherRelease \
    NexusWallpapersStubPrebuilt2018 \
    SafetyHubPrebuilt \
    SettingsIntelligenceGooglePrebuilt

ifeq ($(TARGET_GAPPS_ARCH),arm64)
PRODUCT_PACKAGES += \
    MatchmakerPrebuiltPixel3
endif

# build.prop entrys
PRODUCT_PROPERTY_OVERRIDES += \
    ro.wallpapers_loc_request_suw=true

# Bootanimation
<<<<<<< HEAD
ifeq ($(TARGET_BOOT_ANIMATION_RES),720)
     PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation_720.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanim$
else ifeq ($(TARGET_BOOT_ANIMATION_RES),1080)
     PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation_1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),1440)
     PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation_1440.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
else
    ifeq ($(TARGET_BOOT_ANIMATION_RES),)
        $(warning "TARGET_BOOT_ANIMATION_RES is undefined, assuming 720p")
    else
        $(warning "Current bootanimation res is not supported, forcing 720p")
    endif
    PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation_720.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
endif

# Files
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH)/etc,$(TARGET_COPY_OUT_PRODUCT)/etc)
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH)/fonts,$(TARGET_COPY_OUT_PRODUCT)/fonts)
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH)/media,$(TARGET_COPY_OUT_PRODUCT)/media)

# Set Pixel blue light theme on Gboard
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.ime.theme_id=5

