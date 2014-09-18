#
# Copyright 2014 The Android Open-Source Project
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

$(call inherit-product-if-exists, vendor/lenovo/a808t/a808t-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay/

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/root/fstab.mt6592:root/fstab.mt6592


PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/root/init.charging.rc:root/init.charging.rc \
    $(LOCAL_PATH)/root/init.fuse.rc:root/init.fuse.rc \
    $(LOCAL_PATH)/root/init.modem.rc:root/init.modem.rc \
    $(LOCAL_PATH)/root/init.protect.rc:root/init.protect.rc \
    $(LOCAL_PATH)/root/init.mt6592.rc:root/init.mt6592.rc \
    $(LOCAL_PATH)/root/init.mt6592.usb.rc:root/init.mt6592.usb.rc \
    $(LOCAL_PATH)/root/init.xlog.rc:root/init.xlog.rc \
    $(LOCAL_PATH)/root/ueventd.mt6592.rc:root/ueventd.mt6592.rc \
    $(LOCAL_PATH)/root/project-devices.sh:root/project-devices.sh \


PRODUCT_DEFAULT_PROPERTY_OVERRIDES := \
    ro.boot.hardware=mt6592 \
    persist.mtk.aee.aed=on


PRODUCT_PROPERTY_OVERRIDES := \
    ro.build.selinux=0 \
    ro.mediatek.version.release=ALPS.KK1.MP3.V3 \
    ro.mediatek.platform=MT6592 \
    ro.mediatek.chip_ver=S01 \
    ro.mediatek.version.branch=KK1.MP3 \
    ro.mediatek.version.sdk=2 \
    ro.opengles.version=131072 \
    ro.sf.lcd_density=320 \
    persist.gemini.sim_num=1 \
    ro.gemini.smart_sim_switch=false \
    ro.gemini.smart_3g_switch=0 \
    ro.mediatek.gemini_support=false \
    persist.mtk.wcn.combo.chipid=-1 \
    fmradio.driver.enable=1 \
    persist.radio.fd.counter=15 \
    persist.radio.fd.off.counter=5 \
    persist.radio.fd.r8.counter=15 \
    persist.radio.fd.off.r8.counter=5

#   ro.camera.sound.forced=0


PRODUCT_TAGS += dalvik.gc.type-precise


# configure Dalvik heap settings for large memory
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)


# hardware configuration and corresponding permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml

#	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
#	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml


# WiFi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

PRODUCT_PACKAGES += \
    lib_driver_cmd_mtk


# telephony
PRODUCT_PACKAGES += \
    gsm0710muxd


# audio
PRODUCT_PACKAGES += \
    audio.r_submix.default \
    libblisrc


# media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media_codecs.xml:system/etc/media_codecs.xml


# general hackery
PRODUCT_PACKAGES += \
    curl


# useful tools
PRODUCT_PACKAGES += \
    Torch


# vim:set ai et ts=4 sw=4 sts=4 fenc=utf-8:
