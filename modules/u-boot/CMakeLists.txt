# Copyright (c) 2022 Arm Limited (or its affiliates). All rights reserved.
# SPDX-License-Identifier: Apache-2.0

if (CONFIG_BUILD_WITH_UBOOT)
  set(ZEPHYR_TRUSTED_FIRMWARE_A_MODULE_DIR ${CMAKE_CURRENT_LIST_DIR}/../../../bootloader/u-boot)
  set(UBOOT_BINARY_DIR ${CMAKE_BINARY_DIR}/u-boot)
  message(STATUS "UBOOT_BINARY_DIR: ${UBOOT_BINARY_DIR}")
  message(STATUS "UBOOT_BINARY_DIR: ${UBOOT_BINARY_DIR}")
  message(STATUS "UBOOT_BINARY_DIR: ${UBOOT_BINARY_DIR}")
  message(STATUS "UBOOT_BINARY_DIR: ${UBOOT_BINARY_DIR}")

  file(MAKE_DIRECTORY ${UBOOT_BINARY_DIR})

  include(ExternalProject)

  ExternalProject_Add(
    uboot
    SOURCE_DIR ${ZEPHYR_TRUSTED_FIRMWARE_A_MODULE_DIR}
    BINARY_DIR ${UBOOT_BINARY_DIR}
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ""
    BUILD_ALWAYS True
    USES_TERMINAL_BUILD True
  )

  set_property(GLOBAL APPEND PROPERTY extra_post_build_commands
      COMMAND make -C ${ZEPHYR_TRUSTED_FIRMWARE_A_MODULE_DIR} -f Makefile.zephyr
            CROSS_COMPILE=${CROSS_COMPILE}
            ARCH=${UBOOT_ARCH}
            O=${UBOOT_BINARY_DIR}
            DEFCONFIG=${UBOOT_DEFCONFIG}
  )
endif()
