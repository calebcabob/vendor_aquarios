PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

include vendor/aquarios/config/aosp_fixes.mk

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    keyguard.no_require_sim=true

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.build.selinux=1

# Disable excessive dalvik debug messages
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    dalvik.vm.debug.alloc=0

# Default sounds
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.config.notification_sound=Argon.ogg \
    ro.config.alarm_alert=Hassium.ogg

# Backup Tool
ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    vendor/aquarios/prebuilt/common/bin/backuptool_ab.sh:system/bin/backuptool_ab.sh \
    vendor/aquarios/prebuilt/common/bin/backuptool_ab.functions:system/bin/backuptool_ab.functions \
    vendor/aquarios/prebuilt/common/bin/backuptool_postinstall.sh:system/bin/backuptool_postinstall.sh
endif

PRODUCT_COPY_FILES += \
    vendor/aquarios/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/aquarios/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/aquarios/prebuilt/common/bin/50-aquarios.sh:system/addon.d/50-aquarios.sh

# Signature compatibility validation
PRODUCT_COPY_FILES += \
    vendor/aquarios/prebuilt/common/bin/otasigcheck.sh:install/bin/otasigcheck.sh

# AQUARIOS-specific init file
PRODUCT_COPY_FILES += \
    vendor/aquarios/prebuilt/common/etc/init.aquarios.rc:system/etc/init/init.aquarios.rc

# Copy over added mimetype supported in libcore.net.MimeUtils
PRODUCT_COPY_FILES += \
    vendor/aquarios/prebuilt/common/lib/content-types.properties:system/lib/content-types.properties

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Don't export PS1 in /system/etc/mkshrc.
PRODUCT_COPY_FILES += \
    vendor/aquarios/prebuilt/common/etc/mkshrc:system/etc/mkshrc \
    vendor/aquarios/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf

# debug packages
ifneq ($(TARGET_BUILD_VARIENT),user)
PRODUCT_PACKAGES += \
    Development
endif

# TWRP
ifeq ($(WITH_TWRP),true)
include vendor/aquarios/config/twrp.mk
endif

# Optional packages
PRODUCT_PACKAGES += \
    Basic \
    LiveWallpapersPicker \
    PhaseBeam

# Include explicitly to work around GMS issues
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full \
    librsjni

#SnapdragonGallery
PRODUCT_PACKAGES += \
    SnapdragonGallery

# Extra Optional packages
PRODUCT_PACKAGES += \
    Launcher3 \
    LatinIME \
    BluetoothExt \
    WallpaperPicker \
    PrebuiltDeskClockGoogle \
    OmniJaws \
    OmniStyle

## Don't compile SystemUITests
EXCLUDE_SYSTEMUI_TESTS := true

# Extra tools
PRODUCT_PACKAGES += \
    openvpn \
    e2fsck \
    mke2fs \
    tune2fs \
    mkfs.ntfs \
    fsck.ntfs \
    mount.ntfs

# exFAT tools
PRODUCT_PACKAGES += \
    fsck.exfat \
    mkfs.exfat

# DU Utils Library
PRODUCT_PACKAGES += \
    org.dirtyunicorns.utils

PRODUCT_BOOT_JARS += \
    org.dirtyunicorns.utils

# Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libffmpeg_extractor \
    libffmpeg_omx \
    media_codecs_ffmpeg.xml

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.sf.omx-plugin=libffmpeg_omx.so \
    media.sf.extractor-plugin=libffmpeg_extractor.so

PRODUCT_PACKAGE_OVERLAYS += \
    vendor/aquarios/overlay/common \
    vendor/aquarios/overlay/dictionaries

# Versioning System
# Aquarios version.
PRODUCT_VERSION_MAJOR = $(PLATFORM_VERSION)
PRODUCT_VERSION_MINOR = r
PRODUCT_VERSION_MAINTENANCE = 40
ifdef AQUARIOS_BUILD_EXTRA
    AQUARIOS_POSTFIX := -$(AQUARIOS_BUILD_EXTRA)
endif
ifndef AQUARIOS_BUILD_TYPE
    AQUARIOS_BUILD_TYPE := UNOFFICIAL
endif

ifeq ($(AQUARIOS_BUILD_TYPE),DM)
    AQUARIOS_POSTFIX := -$(shell date +"%Y%m%d")
endif

ifndef AQUARIOS_POSTFIX
    AQUARIOS_POSTFIX := -$(shell date +"%Y%m%d-%H%M")
endif

# Set all versions
AQUARIOS_VERSION := 8.1
AQUARIOS_MOD_VERSION := AquariOS-$(AQUARIOS_BUILD)-$(PRODUCT_VERSION_MAJOR)_$(PRODUCT_VERSION_MINOR)$(PRODUCT_VERSION_MAINTENANCE)-$(AQUARIOS_BUILD_TYPE)$(AQUARIOS_POSTFIX)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    aquarios.ota.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE) \
    ro.aquarios.version=$(AQUARIOS_VERSION) \
    ro.modversion=$(AQUARIOS_MOD_VERSION) \
    ro.aquarios.buildtype=$(AQUARIOS_BUILD_TYPE)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.aquarios.version=$(AQUARIOS_VERSION) \

PRODUCT_EXTRA_RECOVERY_KEYS += \
  vendor/aquarios/build/target/product/security/aquarios

-include vendor/aquarios-priv/keys/keys.mk

ifeq ($(BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE),)
  PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.device.cache_dir=/data/cache
else
  PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.device.cache_dir=/cache
endif

# Clean cache
PRODUCT_COPY_FILES += \
    vendor/aquarios/tools/clean_cache.sh:system/bin/clean_cache.sh

# AquariOS permissions 
-include vendor/aquarios/configs/permissions.mk

# Set AquariOS theme to Aqua (aka Stock)
PRODUCT_PROPERTY_OVERRIDES += \
ro.boot.vendor.overlay.theme=com.google.android.theme.stock

# Prebuilt busybox fstrim command
PRODUCT_COPY_FILES += \
    vendor/aquarios/prebuilt/bin/fstrim:system/bin/fstrim

# Unlimitted photo storage in Google Photos
PRODUCT_COPY_FILES += \
    vendor/aquarios/prebuilt/etc/sysconfig/pixel_2017_exclusive.xml:system/etc/sysconfig/pixel_2017_exclusive.xml

# AquariOS bootanimation 
-include vendor/aquarios/config/bootanimation.mk

# Packages
PRODUCT_PACKAGES += \
    GBoardDarkTheme \
    SystemUIDarkTheme \
    SettingsDarkTheme \
    SystemDarkTheme

# Overlays
PRODUCT_PACKAGES += \
    AmberAccent \
    AquaAccent \
    BlackAccent \
    BlueGreyAccent \
    BrownAccent \
    CyanAccent \
    DarkRedAccent \
    DeepOrangeAccent \
    DeepPurpleAccent \
    GreenAccent \
    GreyAccent \
    IndigoAccent \
    LightBlueAccent \
    LightGreenAccent \
    LimeAccent \
    OrangeAccent \
    PinkAccent \
    PurpleAccent \
    RedAccent \
    YellowAccent \
    WhiteAccent

# Fonts
PRODUCT_PACKAGES += \
    Fonts

# AdBlocking
PRODUCT_COPY_FILES += \
    vendor/aquarios/prebuilt/etc/hosts/hosts:system/etc/hosts

$(call prepend-product-if-exists, vendor/extra/product.mk)
