PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

include vendor/aquarios/config/aosp_fixes.mk

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Disable excessive dalvik debug messages
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.debug.alloc=0

# Default sounds
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.config.notification_sound=Argon.ogg \
    ro.config.alarm_alert=Hassium.ogg

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/aquarios/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/aquarios/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/aquarios/prebuilt/common/bin/50-aquarios.sh:system/addon.d/50-aquarios.sh \
    vendor/aquarios/prebuilt/common/bin/clean_cache.sh:system/bin/clean_cache.sh

# Backup services whitelist
PRODUCT_COPY_FILES += \
    vendor/aquarios/config/permissions/backup.xml:system/etc/sysconfig/backup.xml

# Signature compatibility validation
PRODUCT_COPY_FILES += \
    vendor/aquarios/prebuilt/common/bin/otasigcheck.sh:install/bin/otasigcheck.sh

# AQUARIOS-specific init file
PRODUCT_COPY_FILES += \
    vendor/aquarios/prebuilt/common/etc/init.local.rc:root/init.aquarios.rc

# Copy over added mimetype supported in libcore.net.MimeUtils
PRODUCT_COPY_FILES += \
    vendor/aquarios/prebuilt/common/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so

# SELinux filesystem labels
PRODUCT_COPY_FILES += \
    vendor/aquarios/prebuilt/common/etc/init.d/50selinuxrelabel:system/etc/init.d/50selinuxrelabel

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Don't export PS1 in /system/etc/mkshrc.
PRODUCT_COPY_FILES += \
    vendor/aquarios/prebuilt/common/etc/mkshrc:system/etc/mkshrc \
    vendor/aquarios/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf

# Fix Dialer
#PRODUCT_COPY_FILES +=  \
#    vendor/aquarios/prebuilt/common/sysconfig/dialer_experience.xml:system/etc/sysconfig/dialer_experience.xml

# Aquarios-specific startup services
PRODUCT_COPY_FILES += \
    vendor/aquarios/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/aquarios/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit \
    vendor/aquarios/prebuilt/common/bin/sysinit:system/bin/sysinit

# Required packages
PRODUCT_PACKAGES += \
    CellBroadcastReceiver \
    Development \
    SpareParts \
    LockClock \
    su

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
    mkfs.exfat \
    ntfsfix \
    ntfs-3g
PRODUCT_PACKAGES += \
    charger_res_images

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

PRODUCT_PROPERTY_OVERRIDES += \
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
AQUARIOS_POSTFIX := -$(shell date +"%Y%m%d-%H%M")
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
AQUARIOS_VERSION := Aquarios-$(AQUARIOS_BUILD)-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)-$(AQUARIOS_BUILD_TYPE)$(AQUARIOS_POSTFIX)
AQUARIOS_MOD_VERSION := Aquarios-$(AQUARIOS_BUILD)-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)-$(AQUARIOS_BUILD_TYPE)$(AQUARIOS_POSTFIX)

PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    aquarios.ota.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE) \
    ro.aquarios.version=$(AQUARIOS_VERSION) \
    ro.modversion=$(AQUARIOS_MOD_VERSION) \
    ro.aquarios.buildtype=$(AQUARIOS_BUILD_TYPE)

# Google sounds
include vendor/aquarios/google/GoogleAudio.mk

EXTENDED_POST_PROCESS_PROPS := vendor/aquarios/tools/aquarios_process_props.py
