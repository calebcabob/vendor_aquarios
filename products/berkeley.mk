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

# Include aquarios phone config
include vendor/aquarios/configs/aquarios_phone.mk

# Call some device specific files for taimen
$(call inherit-product, device/huawei/berkeley/aquarios.mk)

# Override Product Name for DirtyUnicorns
PRODUCT_NAME := berkeley
PRODUCT_DEVICE := berkeley
PRODUCT_BRAND := Huawei
PRODUCT_MODEL := Honor View 10
PRODUCT_MANUFACTURER := Huawei

BUILD_FINGERPRINT := kirin970/kirin970/kirin970:8.1.0/OPM1.171019.011/jslave01241654:user/test-keys
