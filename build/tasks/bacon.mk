# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017 The LineageOS Project
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

# -----------------------------------------------------------------
# Slim OTA update package

# Build colors

ifneq ($(BUILD_WITH_COLORS),0)
eeeeee="\033[38;5;255m"
e4e4e4="\033[38;5;254m"
dadada="\033[38;5;253m"
d0d0d0="\033[38;5;252m"
ff875f="\033[38;5;208m"
005f87="\033[38;5;24m"
0087af="\033[38;5;31m"
5f87af="\033[38;5;67m"
5fafaf="\033[38;5;73m"
5fd7d7="\033[38;5;80m"
00d7d7="\033[38;5;44m"
5fffd7="\033[38;5;86m"
5fffff="\033[38;5;87m"
87ffd7="\033[38;5;122m"
00d7ff="\033[38;5;45m"
endif

AQUARIOS_TARGET_PACKAGE := $(PRODUCT_OUT)/$(AQUARIOS_MOD_VERSION).zip

.PHONY: bacon
bacon: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(AQUARIOS_TARGET_PACKAGE)
	$(hide) $(MD5SUM) $(AQUARIOS_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(AQUARIOS_TARGET_PACKAGE).md5sum
	@echo -e ""
	@echo -e ""
	@echo -e ""
	@echo -e ${5fffff}"	                                   oo                          "${CL_RST}
	@echo -e ${5fffff}"	                                oooo                           "${CL_RST}
	@echo -e ${5fffff}"	                          oooooooooooo                         "${CL_RST}
	@echo -e ${5fffff}"	                          oooooooooooooooooo                   "${CL_RST}
	@echo -e ${5fffff}"	                      oooooooooooooooooooooo                   "${CL_RST}
	@echo -e ${5fffff}"	                      ooooooooooooooooooooooo                  "${CL_RST}
	@echo -e ${5fffd7}"	                     oooooooooooooooooooooooo                  "${CL_RST}
	@echo -e ${5fffd7}"	                   ooooooooooooooooooooooooooo                 "${CL_RST}
	@echo -e ${5fffd7}"	                      ooooooooooooooooooooooooo                "${CL_RST}
	@echo -e ${5fffd7}"	                    ooooooooooooooooooooooooooooo              "${CL_RST}
	@echo -e ${00d7d7}"	                   oooooooooooooooooooooooooooooooo            "${CL_RST}
	@echo -e ${00d7d7}"	                 oooooooooooooooooo ooooooooooooooooo          "${CL_RST}
	@echo -e ${00d7d7}"	                 ooooooooooooooooooo  ooo  oooooooooooo        "${CL_RST}
	@echo -e ${00d7d7}"	                 oooooooooooooooooooooo          ooooo         "${CL_RST}
	@echo -e ${00d7d7}"	                 ooooooooooooooooooooooooo                     "${CL_RST}
	@echo -e ${00d7d7}"	                  ooooooooooooooooooooooooooo                  "${CL_RST}
	@echo -e ${00d7d7}"	                   oooooooooooooooooooooooooooo                "${CL_RST}
	@echo -e ${00d7d7}"	                    oooooooooooooooooooooooooooo               "${CL_RST}
	@echo -e ${5fd7d7}"	                   o  ooooooooooooooooooooooooooo              "${CL_RST}
	@echo -e ${5fd7d7}"	         oo      oooo   oooooooooooooooooooooooooo             "${CL_RST}
	@echo -e ${5fd7d7}"	          ooooooooooo   oooooooooooooooooooooooooo             "${CL_RST}
	@echo -e ${5fd7d7}"	           ooooooooooooooooooooooooooooooooooooooo             "${CL_RST}
	@echo -e ${5fd7d7}"	           oooooooooooooooooooooooooooooooooooooo              "${CL_RST}
	@echo -e ${5fafaf}"	       ooooooooooooooooooooooooooooooooooooooooo               "${CL_RST}
	@echo -e ${5fafaf}"	           oooooooooooooooooooooooooooooooooooo                "${CL_RST}
	@echo -e ${5fafaf}"	          ooooooooooooooooooooooooooooooooooo                  "${CL_RST}
	@echo -e ${5fafaf}"	       ooooooooooooooooooooooooooooooooooo                     "${CL_RST}
	@echo -e ${5f87af}"	            ooooooooooooooooooooooooooo                        "${CL_RST}
	@echo -e ${5f87af}"	          oooooooooooooooooooooooooo                           "${CL_RST}
	@echo -e ${5f87af}"	                 ooooooooooooooo                               "${CL_RST}
	@echo -e ${5f87af}"	                ooooooooooooooo                                "${CL_RST}
	@echo -e ${5f87af}"	                oooooooooooooo                                 "${CL_RST}
	@echo -e ${0087af}"	                oooooooooooooo         ooooooooo               "${CL_RST}
	@echo -e ${0087af}"	                oooooooooooooo       ooooooooooooo             "${CL_RST}
	@echo -e ${0087af}"	                ooooooooooooooo     ooooo  ooooooo             "${CL_RST}
	@echo -e ${0087af}"	                 oooooooooooooo     ooo      oooooo            "${CL_RST}
	@echo -e ${0087af}"	                  oooooooooooooo    oo       oooooo            "${CL_RST}
	@echo -e ${0087af}"	                    ooooooooooooooo  o     ooooooo             "${CL_RST}
	@echo -e ${0087af}"	                     oooooooooooooooooooooooooooo              "${CL_RST}
	@echo -e ${005f87}"	                        oooooooooooooooooooooooo               "${CL_RST}
	@echo -e ${005f87}"	                           oooooooooooooooooooo                "${CL_RST}
	@echo -e ${005f87}"	                                ooooooooooo                    "${CL_RST}
	@echo -e " "
	@echo -e " "${CL_RST}
	@echo -e ${ff875f}"			  Welcome to the age of AquariOS"${CL_RST}
	@echo -e " "
	@echo -e ${CL_BWT}"Package Complete: $(AQUARIOS_TARGET_PACKAGE)"${CL_RST}
	@echo -e "SIZE:"${CL_CYN}" `ls -la --si $(AQUARIOS_TARGET_PACKAGE) | cut -d ' ' -f 5`"${CL_RST}
