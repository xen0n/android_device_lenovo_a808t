## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := a808t

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/lenovo/a808t/device_a808t.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := a808t
PRODUCT_NAME := cm_a808t
PRODUCT_BRAND := lenovo
PRODUCT_MODEL := a808t
PRODUCT_MANUFACTURER := lenovo
