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

## Camera
BOARD_USE_NASTY_PTHREAD_CREATE_HACK := true
# COMMON_GLOBAL_CFLAGS += -DBINDER_COMPAT
# BOARD_USES_LEGACY_CAMERA := true
#BOARD_CPU_COLOR_CONVERT := true

## Kernel
TARGET_KERNEL_SOURCE := kernel/huawei/msm7x27
TARGET_SPECIFIC_HEADER_PATH := device/huawei/msm7x27-common/include

## Browser & WebKit
JS_ENGINE := v8
HTTP := chrome
WITH_JIT := true
ENABLE_JSC_JIT := true
ENABLE_WEBGL := true
TARGET_FORCE_CPU_UPLOAD := true

## Boot loader & recovery
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888

## Partition Sizes
# Fix this up by examining /proc/mtd on a running device
BOARD_KERNEL_BASE := 0x12800000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x004400000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x005000000
# Ignore that this is much larger than the 190Mb allowed.
# It's only for resolving build issues with the system.img
# being too big. It will still be only about 100MB MAXIMUM
# because all the useless trash is now in extras
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0xE600000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x0c780000
BOARD_FLASH_BLOCK_SIZE := 131072

## Graphics
BOARD_EGL_NEEDS_LEGACY_FB := true
TARGET_DISABLE_TRIPLE_BUFFERING := true
COMMON_GLOBAL_CFLAGS += -DANCIENT_GL

## GPS
# Enable the GPS HAL & AMSS version to use for GPS
BOARD_USES_QCOM_LIBRPC := true
BOARD_USES_QCOM_GPS := true
#BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := default
#BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

## Lights
TARGET_PROVIDES_LIBLIGHT := true

## Bluetooth
BOARD_HAVE_BLUETOOTH_BCM := true
#BOARD_BLUEDROID_VENDOR_CONF := device/huawei/msm7x27-common/bluetooth/libbt.txt

## Audio, Bluetooth & FM Radio
TARGET_PROVIDES_LIBAUDIO := true
BOARD_USES_AUDIO_LEGACY := false
#BOARD_FM_DEVICE := bcm4325
#BOARD_HAVE_FM_RADIO := true
# Use the second one (QCOM_FM_ENABLED) not the first
# The first breaks the builds and the second is more
# recent and is used in the CM code
# COMMON_GLOBAL_CFLAGS += -DHAVE_FM_RADIO
# COMMON_GLOBAL_CFLAGS += -DQCOM_FM_ENABLED

## RIL
BOARD_PROVIDES_LIBRIL := true

## Mass Storage for Jelly Bean
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/usb_mass_storage/lun0/file
BOARD_UMS_LUNFILE := /sys/devices/platform/usb_mass_storage/lun0/file

## Touch screen compatibility for Jelly Bean
BOARD_USE_LEGACY_TOUCHSCREEN := true

## Wi-Fi & Wi-Fi HotSpot
BOARD_WPA_SUPPLICANT_DRIVER     := WEXT
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wext
BOARD_WLAN_DEVICE                := bcm4329
WIFI_BAND                        := 802_11_ABG
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/dhd.ko"
WIFI_DRIVER_FW_PATH_STA          := "/system/vendor/firmware/fw_bcm4329.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/vendor/firmware/fw_bcm4329_apsta.bin"
WIFI_DRIVER_MODULE_ARG           := "firmware_path=/system/vendor/firmware/fw_bcm4329.bin nvram_path=/system/etc/wifi/nvram.txt"
WIFI_DRIVER_MODULE_NAME          := "dhd"

## OTA script
TARGET_OTA_EXTRAS_FILE := device/huawei/msm7x27-common/releasetools/extras.txt

