# Copyright (C) 2017 AquariOS
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Include overlays
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/aquarios/overlay/common

# Main Required Packages
PRODUCT_PACKAGES += \
    Launcher3 \
    LiveWallpapersPicker \
    OmniJaws \
    OmniStyle \
    WallpaperPickerGooglePrebuilt

# Copy Magisk zip
# PRODUCT_COPY_FILES += \
#    vendor/aquarios/prebuilt/zip/magisk.zip:system/addon.d/magisk.zip

# AquariOS bootanimation 
-include vendor/aquarios/configs/bootanimation.mk

# init.d script support
PRODUCT_COPY_FILES += \
    vendor/aquarios/prebuilt/bin/sysinit:system/bin/sysinit \
    vendor/aquarios/prebuilt/root/init.aquarios.rc:root/init.aquarios.rc

# AquariOS versioning
ifndef AQUARIOS_BUILD_TYPE
    AQUARIOS_BUILD_TYPE := UNOFFICIAL
endif

AQUARIOS_VERSION := $(PLATFORM_VERSION)-$(AQUARIOS_BUILD_TYPE)-$(shell date +%Y%m%d-%H%M)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.aquarios.version=$(AQUARIOS_VERSION)

# DU Utils Library
PRODUCT_PACKAGES += \
    org.dirtyunicorns.utils

PRODUCT_BOOT_JARS += \
    org.dirtyunicorns.utils

# Include explicitly to work around GMS issues
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full \
    librsjni

# Clean cache
PRODUCT_COPY_FILES += \
    vendor/aquarios/tools/clean_cache.sh:system/bin/clean_cache.sh

# Don't export PS1 in /system/etc/mkshrc.
PRODUCT_COPY_FILES += \
    vendor/aquarios/prebuilt/root/mkshrc:system/etc/mkshrc

# AquariOS permissions 
-include vendor/aquarios/configs/permissions.mk
