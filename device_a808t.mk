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

$(call inherit-product-if-exists, vendor/lenovo/a808t/device-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay/

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/root/fstab:root/fstab


PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/root/factory_init.project.rc:root/factory_init.project.rc \
    $(LOCAL_PATH)/root/factory_init.rc:root/factory_init.rc \
    $(LOCAL_PATH)/root/init.aee.customer.rc:root/init.aee.customer.rc \
    $(LOCAL_PATH)/root/init.charging.rc:root/init.charging.rc \
    $(LOCAL_PATH)/root/init.environ.rc:root/init.environ.rc \
    $(LOCAL_PATH)/root/init.fuse.rc:root/init.fuse.rc \
    $(LOCAL_PATH)/root/init.modem.rc:root/init.modem.rc \
    $(LOCAL_PATH)/root/init.project.rc:root/init.project.rc \
    $(LOCAL_PATH)/root/init.protect.rc:root/init.protect.rc \
    $(LOCAL_PATH)/root/init.rc:root/init.rc \
    $(LOCAL_PATH)/root/init.trace.rc:root/init.trace.rc \
    $(LOCAL_PATH)/root/init.usb.rc:root/init.usb.rc \
    $(LOCAL_PATH)/root/init.xlog.rc:root/init.xlog.rc \
    $(LOCAL_PATH)/root/meta_init.modem.rc:root/meta_init.modem.rc \
    $(LOCAL_PATH)/root/meta_init.project.rc:root/meta_init.project.rc \
    $(LOCAL_PATH)/root/meta_init.rc:root/meta_init.rc \
    $(LOCAL_PATH)/root/ueventd.rc:root/ueventd.rc


# vim:set ai et ts=4 sw=4 sts=4 fenc=utf-8:
