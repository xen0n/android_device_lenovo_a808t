#
# Copyright 2013 The Android Open-Source Project
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
#

DEVICE_FOLDER := device/lenovo/a808t

# Use the non-open-source parts, if they're present
-include vendor/lenovo/a808t/BoardConfigVendor.mk

USE_CAMERA_STUB := true


# board
TARGET_BOARD_PLATFORM := mt6592
TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a9

ARCH_ARM_HAVE_TLS_REGISTER := true


# blob hacks
COMMON_GLOBAL_CFLAGS += -DMR1_AUDIO_BLOB -DDISABLE_HW_ID_MATCH_CHECK -DNEEDS_VECTORIMPL_SYMBOLS
BOARD_HAVE_PRE_KITKAT_AUDIO_BLOB := true
BOARD_HAVE_PRE_KITKAT_AUDIO_POLICY_BLOB := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true


# boot
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := a808t
BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_FOLDER)/boot.mk


# kernel
TARGET_PREBUILT_KERNEL := $(DEVICE_FOLDER)/prebuilt/kernel
# BOARD_KERNEL_CMDLINE := console=ttyMT3,921600n1 vmalloc=496M slub_max_order=0 lcm=0-nt35521_hd720_dsi_vdo_boe fps=6163 bootprof.pl_t=696 bootprof.lk_t=1208 printk.disable_uart=1
# BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048


# partition
TARGET_USERIMAGES_USE_EXT4 := true

BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760  # 0x00a00000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760  # 0x00a00000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1577058304  # 0x5e000000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1237319680  # 0x49c00000
BOARD_CACHEIMAGE_PARTITION_SIZE := 134217728  # 0x08000000
BOARD_CACHEIMAGE_TYPE := ext4

BOARD_FLASH_BLOCK_SIZE := 131072


# recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_FOLDER)/root/fstab
BOARD_HAS_NO_SELECT_BUTTON := true


# graphics
BOARD_EGL_CFG := $(DEVICE_FOLDER)/egl.cfg
