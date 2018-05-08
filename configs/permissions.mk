# Copyright (C) 2018 AquariOS
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

# Assure these are being added
PRODUCT_PACKAGES += \
    privapp-permissions-google.xml

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/aquarios/prebuilt/etc/permissions/backup.xml:system/etc/sysconfig/backup.xml
