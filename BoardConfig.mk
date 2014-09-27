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

MTK_PLATFORM := MT6592
MTK_PLATFORM_OPTIMIZE := yes


# blob hacks
COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK -DNEEDS_VECTORIMPL_SYMBOLS
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
TARGET_RECOVERY_FSTAB := $(DEVICE_FOLDER)/root/fstab.mt6592
BOARD_HAS_NO_SELECT_BUTTON := true


# base system
# enable MTK-specific UIDs globally as suggested in commit 8bfc510 of repo
# android_system_core
COMMON_GLOBAL_CFLAGS += -DMTK_UIDS


# graphics
BOARD_EGL_CFG := $(DEVICE_FOLDER)/egl.cfg


# wifi
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mtk

# dummy FW paths to trigger libhardware_legacy/wifi FW switch throuh hald
WIFI_DRIVER_FW_PATH_AP := "AP"
WIFI_DRIVER_FW_PATH_STA := "STA"
WIFI_DRIVER_FW_PATH_P2P := "STA+P2P"


# telephony
BOARD_RIL_CLASS := ../../../device/lenovo/a808t/ril/


# audio
BOARD_USE_MTK_AUDIO := true
BOARD_USES_MTK_AUDIO := true
BOARD_USES_LIBMEDIA_WITH_AUDIOPARAMETER := true
TARGET_ENABLE_AV_ENHANCEMENTS := true
TARGET_ENABLE_OFFLOAD_ENHANCEMENTS := true

MTK_AUDIO=yes
MTK_AUDIOPROFILE_SELECT_MMS_RINGTONE_SUPPORT=no
MTK_AUDIO_ADPCM_SUPPORT=yes
MTK_AUDIO_APE_SUPPORT=yes
MTK_AUDIO_BLOUDCUSTOMPARAMETER_REV=MTK_AUDIO_BLOUD_CUSTOMPARAMETER_V4
MTK_AUDIO_CHANGE_SUPPORT=no
MTK_AUDIO_DDPLUS_SUPPORT=no
MTK_AUDIO_EXTCODEC_SUPPORT=no
MTK_AUDIO_HD_REC_SUPPORT=yes
MTK_AUDIO_PROFILES=yes
MTK_AUDIO_RAW_SUPPORT=yes
MTK_FM_RX_AUDIO=FM_DIGITAL_INPUT
MTK_FM_TX_AUDIO=FM_DIGITAL_OUTPUT
MTK_HIGH_RESOLUTION_AUDIO_SUPPORT=yes
MTK_USB_AUDIO_SUPPORT=yes
NATIVE_AUDIO_PREPROCESS_ENABLE=yes

COMMON_GLOBAL_CFLAGS += -DMTK_AUDIO
