# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

COMMON_PATH := device/samsung/universal7885-common

BUILD_BROKEN_DUP_RULES := true

# Include
TARGET_SPECIFIC_HEADER_PATH := $(COMMON_PATH)/include

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# Binder
TARGET_USES_64_BIT_BINDER := true

# Apex
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Dexpreopt
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
      WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := true
    endif
  endif
endif

# Treble
BOARD_VNDK_VERSION := current

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Disable Block based zips (makes other versions compatible)
BOARD_DISABLE_BLOCK_BASED_OTA := true

# Firmware
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_NO_RECOVERY   := false
TARGET_NO_KERNEL     := false

# Kernel
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_CUSTOM_DTBTOOL := dtbhtoolExynos

BOARD_KERNEL_CMDLINE := loop.max_part=7
BOARD_CUSTOM_BOOTIMG := true
BOARD_CUSTOM_BOOTIMG_MK := hardware/samsung/mkbootimg.mk
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_SECOND_OFFSET := 0x00f00000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --second_offset $(BOARD_SECOND_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_FLASH_BLOCK_SIZE := 4096 # blockdev --getbsz /dev/block/mmcblk0p9
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_SEPARATED_DT := true

# Device Tree
BOARD_USES_DT := true

# Partitions - Boot
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432

# Partitions - Cache
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

# Partitions - Recovery
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 39845888

# Partitions - System
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3833593856

# Partitions - Userdata (26919043072 - 20480)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 26919043072

# Platform
BOARD_VENDOR := samsung
TARGET_BOARD_PLATFORM := exynos5
TARGET_SLSI_VARIANT := bsp
TARGET_BOARD_PLATFORM_GPU := mali-g71
TARGET_SOC := exynos7885

# Root extra folders
BOARD_ROOT_EXTRA_FOLDERS += /efs /cpefs
TARGET_FS_CONFIG_GEN := $(COMMON_PATH)/config.fs

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(COMMON_PATH)/include/bluetooth

# Charger
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_SHOW_PERCENTAGE := true
CHARGING_ENABLED_PATH := /sys/class/power_supply/battery/batt_lp_charging

# DT2W
TARGET_TAP_TO_WAKE_NODE := /sys/class/sec/tsp/dt2w_enable

# WI-Fi
BOARD_HAVE_SAMSUNG_WIFI 	 := true
BOARD_WLAN_DEVICE                := slsi
WPA_SUPPLICANT_VERSION           := VER_0_8_X
WPA_SUPPLICANT_USE_HIDL          := true
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)

WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
PRODUCT_CFI_INCLUDE_PATHS += hardware/samsung_slsi/scsc_wifibt/wpa_supplicant_lib

# Audio
AUDIOSERVER_MULTILIB := 32

# Graphics
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS := 0x2000U | 0x02000000U | 0x08000000U | 0x40000000000b00U | 0x40000000000200U

# Recovery
BOARD_HAS_DOWNLOAD_MODE := true
TARGET_RECOVERY_PIXEL_FORMAT := "ABGR_8888"

# Renderscript
OVERRIDE_RS_DRIVER := libRSDriverArm.so

# Samsung HALs
TARGET_POWERHAL_VARIANT := samsung

# Fingerprint
TARGET_SEC_FP_CALL_NOTIFY_ON_CANCEL := true
TARGET_SEC_FP_USES_PERCENTAGE_SAMPLES := true

# HIDL Manifest
DEVICE_MANIFEST_FILE := $(COMMON_PATH)/manifest.xml

# VINTF
PRODUCT_ENFORCE_VINTF_MANIFEST_OVERRIDE := true

# Shims
TARGET_LD_SHIM_LIBS := \
    /vendor/lib/libexynoscamera.so|libexynoscamera_shim.so \
    /vendor/lib64/libexynoscamera.so|libexynoscamera_shim.so \
    /vendor/lib/libvideobeauty_interface.so|libvideobeauty_interface_shim.so \
    /system/bin/mediaserver|libstagefright_shim.so

# Seccomp filters
BOARD_SECCOMP_POLICY += $(COMMON_PATH)/seccomp

# SELinux Policies
BOARD_SEPOLICY_TEE_FLAVOR := mobicore
include device/lineage/sepolicy/exynos/sepolicy.mk
include device/samsung_slsi/sepolicy/sepolicy.mk

BOARD_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/vendor
BOARD_SEPOLICY_VERS := $(PLATFORM_SDK_VERSION).0
SELINUX_IGNORE_NEVERALLOWS := true

