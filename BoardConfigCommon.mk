#
# Copyright (C) 2012 The Android Open-Source Project
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

# Use the Qualcomm common folder
include device/qcom/msm7x27/BoardConfigCommon.mk

# Recovery config for CMW & TWRP
include device/huawei/msm7x27-common/BoardConfigRecovery.mk

## Camera
TARGET_DISABLE_ARM_PIE := true
BOARD_NEEDS_MEMORYHEAPPMEM := true
BOARD_USE_NASTY_PTHREAD_CREATE_HACK := true
BOARD_USES_ECLAIR_LIBCAMERA := true
COMMON_GLOBAL_CFLAGS += -DBINDER_COMPAT
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS

## Kernel
TARGET_KERNEL_SOURCE := kernel/huawei/msm7x27
TARGET_SPECIFIC_HEADER_PATH := device/huawei/msm7x27-common/include

## Boot loader
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

BOARD_KERNEL_BASE := 0x10200000
BOARD_KERNEL_PAGESIZE := 2048

## Partition Sizes: Fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 4456448
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 6291456
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 267386880
BOARD_USERDATAIMAGE_PARTITION_SIZE := 209190912
BOARD_FLASH_BLOCK_SIZE := 0

## Graphics
# Enable OpenGL Hardware Acceleration
USE_OPENGL_RENDERER := true
BOARD_EGL_NEEDS_LEGACY_FB := true
TARGET_DOESNT_USE_FENCE_SYNC := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
COMMON_GLOBAL_CFLAGS += -DANCIENT_GL
COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true


## GPS
BOARD_USES_QCOM_LIBRPC := true
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := default
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

## Audio & FM Radio
TARGET_PROVIDES_LIBAUDIO := true
BOARD_USES_AUDIO_LEGACY := false
BOARD_COMBO_DEVICE_SUPPORTED := true
#BOARD_FM_DEVICE := bcm4325
#BOARD_HAVE_FM_RADIO := true
#BOARD_HAVE_QCOM_FM := true
#COMMON_GLOBAL_CFLAGS += -DHAVE_FM_RADIO
#COMMON_GLOBAL_CFLAGS += -DQCOM_FM_ENABLED

## Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUEDROID_VENDOR_CONF := device/huawei/msm7x27-common/bluetooth/libbt.txt

## RIL
BOARD_PROVIDES_LIBRIL := true

## Mass Storage
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/usb_mass_storage/lun0/file"
BOARD_UMS_LUNFILE := /sys/devices/platform/usb_mass_storage/lun0/file

## Touch screen compatibility
BOARD_USE_LEGACY_TOUCHSCREEN := true

## Wi-Fi & Wi-Fi HotSpot
USE_LEGACY_SOFTAP                := true
BOARD_WPA_SUPPLICANT_DRIVER      := WEXT
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wext
BOARD_WLAN_DEVICE                := bcm4329
BOARD_WEXT_NO_COMBO_SCAN         := true
SOFTAP_NEEDS_RESTART             := true
WIFI_BAND                        := 802_11_BG
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/dhd.ko"
WIFI_DRIVER_FW_PATH_STA          := "/system/vendor/firmware/fw_bcm4329.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/vendor/firmware/fw_bcm4329_apsta.bin"
WIFI_DRIVER_MODULE_ARG           := "firmware_path=/system/vendor/firmware/fw_bcm4329.bin nvram_path=/system/etc/wifi/nvram.txt"
WIFI_DRIVER_MODULE_NAME          := "dhd"



## Override healthd HAL
BOARD_HAL_STATIC_LIBRARIES := libhealthd.msm7x27

## RIL
BOARD_PROVIDES_LIBRIL := true

## Lights
TARGET_PROVIDES_LIBLIGHT := true

## Minimal fonts
SMALLER_FONT_FOOTPRINT := true

## Browser & WebKit
ENABLE_WEBGL := true

## OTA script extras file (build/tools/releasetools)
TARGET_OTA_EXTRAS_FILE := device/huawei/msm7x27-common/releasetools/extras.txt

## TEMPORARY HACK: skip building external/chromium_org/
PRODUCT_PREBUILT_WEBVIEWCHROMIUM := yes

# WITH_DEXPREOPT=true
