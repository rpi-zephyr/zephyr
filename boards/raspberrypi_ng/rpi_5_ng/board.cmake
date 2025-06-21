# SPDX-License-Identifier: Apache-2.0

if(CONFIG_BUILD_WITH_TFA)
  set(TFA_PLAT "rpi5")
endif()

if(CONFIG_BUILD_WITH_UBOOT)
  set(UBOOT_ARCH "arm")
  set(UBOOT_DEFCONFIG "rpi_4_defconfig")
endif()
