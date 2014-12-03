# configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/init.d/01zram:system/etc/init.d/01zram

# Touchscreen
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/usr/idc/synaptics.idc:system/usr/idc/synaptics.idc \
    $(LOCAL_PATH)/prebuilt/usr/idc/7k_handset.idc:system/usr/idc/7k_handset.idc \
    $(LOCAL_PATH)/prebuilt/usr/idc/kp_test_input.idc:system/usr/idc/kp_test_input.idc \
    $(LOCAL_PATH)/prebuilt/usr/idc/sensors.idc:system/usr/idc/sensors.idc \
    $(LOCAL_PATH)/prebuilt/usr/idc/surf_keypad.idc:system/usr/idc/surf_keypad.idc \
    $(LOCAL_PATH)/prebuilt/usr/idc/ts_test_input.idc:system/usr/idc/ts_test_input.idc

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml


# Ramdisk
PRODUCT_PACKAGES += \
    init.qcom.rc \
    init.qcom.usb.rc \
    ueventd.qcom.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    $(LOCAL_PATH)/prebuilt/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    $(LOCAL_PATH)/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/prebuilt/etc/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio_policy.conf:system/etc/audio_policy.conf
#     $(LOCAL_PATH)/prebuilt/etc/gps.conf:system/etc/gps.conf

# Wi-Fi releated
PRODUCT_COPY_FILES += \
    device/huawei/msm7x27-common/prebuilt/etc/wifi/nvram.txt:system/etc/wifi/nvram.txt \
    device/huawei/msm7x27-common/prebuilt/etc/dhcpcd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/huawei/msm7x27-common/prebuilt/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

#    $(LOCAL_PATH)/configs/CHANGELOG-CM.txt:system/etc/CHANGELOG-CM.txt \
#    $(LOCAL_PATH)/configs/adreno_config.txt:system/etc/adreno_config.txt \


#PRODUCT_PROPERTY_OVERRIDES += \
#    wifi.ap.interface=wl0.1

PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.camera=msm7x27 \
    debug.camcorder.disablemeta=1 \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=2.3_r6 \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    ro.telephony.call_ring.multiple=false \
    ro.vold.umsdirtyratio=20 \
    ro.config.hw_proximitySensor=true \
    ro.config.hw_proximity=true \
    ro.config.hw_GSensorOptimize=true \
    ro.config.notification_sound=CyanPing.ogg \
    ro.config.alarm_alert=Cesium.ogg \
    ro.config.ringtone=Aquila.ogg \
    ro.setupwizard.mode=OPTIONAL

# Battery life hacks
PRODUCT_PROPERTY_OVERRIDES += \
    # Turn off RIL when not needed \
    ro.ril.disable.power.collapse=1 \
    # Better sleep system \
    pm.sleep_mode=1 \
    # Scan for WiFi less often to increase batery life \
    wifi.supplicant_scan_interval=180

PRODUCT_PROPERTY_OVERRIDES += \
    com.qc.hardware=true \
    com.qc.hdmi_out=false \
    debug.sf.hw=1 \
    debug.enabletr=false \
    debug.hwui.render_dirty_regions=false \
    debug.composition.type=mdp \
    debug.gr.numframebuffers=2 \
    debug.qctwa.statusbar=1 \
    debug.qctwa.preservebuf=1 \
    hwui.render_dirty_regions=false \
    hwui.disable_vsync=true \
    hwui.print_config=choice \
    persist.sys.strictmode.visual=false

PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.enable-player=true \
    media.stagefright.enable-meta=false \
    media.stagefright.enable-scan=false \
    media.stagefright.enable-http=true \
    media.stagefright.enable-aac=true \
    media.stagefright.enable-qcp=true

# Audio
PRODUCT_PACKAGES += \
    audio_policy.msm7x27 \
    audio.primary.msm7x27

# Graphics & Media
PRODUCT_PACKAGES += \
    libdivxdrmdecrypt

# Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory \
    lights.msm7x27 \
    fw_bcm4329.bin \
    fw_bcm4329_apsta.bin

# GPS
PRODUCT_PACKAGES += \
    gps.default \
    librpc

# Build sim toolkit
PRODUCT_PACKAGES += \
    Stk

# Camera
PRODUCT_PACKAGES += \
    camera.msm7x27

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

# Bluedroid: rc
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/bluetooth/init.qcom.bluedroid.rc:root/init.qcom.bluetooth.rc

# SELinux - we're not ready for enforcing mode yet
PRODUCT_PROPERTY_OVERRIDES += \
    ro.boot.selinux=permissive

BOARD_SEPOLICY_DIRS += device/huawei/msm7x27-common/sepolicy
BOARD_SEPOLICY_UNION += \
    file_contexts \
    genfs_contexts

# Development settings
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.debuggable=1 \
    ro.secure=0 \
    ro.allow.mock.location=0 \
    persist.service.adb.enable=1

# set default USB configuration
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mass_storage

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.strictmode.visual=0 \
    persist.sys.strictmode.disable=1

# Inherit qcom/msm7x27
$(call inherit-product, device/qcom/msm7x27/msm7x27.mk)

# Install/Uninstall google apps
$(call inherit-product, vendor/google/gapps_armv6_tiny.mk)

# Dalvik
PRODUCT_TAGS += dalvik.gc.type-precise
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.checkjni=false \
    dalvik.vm.dexopt-data-only=1

$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Common assets
PRODUCT_AAPT_CONFIG := normal mdpi hdpi
PRODUCT_LOCALES := en_US en_IN fr_FR it_IT es_ES et_EE de_DE nl_NL cs_CZ \
    pl_PL ja_JP zh_TW zh_CN zh_HK ru_RU ko_KR nb_NO es_US da_DK el_GR tr_TR \
    pt_PT pt_BR rm_CH sv_SE bg_BG ca_ES en_GB fi_FI hr_HR hu_HU in_ID iw_IL \
    lt_LT lv_LV ro_RO sk_SK sl_SI sr_RS uk_UA vi_VN tl_PH ar_EG fa_IR sw_TZ \
    ms_MY af_ZA zu_ZA en_XA ar_XB fr_CA mn_MN hy_AM az_AZ ka_GE

# huawei msm7x27-common overlays
DEVICE_PACKAGE_OVERLAYS += device/huawei/msm7x27-common/overlay
