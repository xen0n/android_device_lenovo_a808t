$(call inherit-product, device/lenovo/a808t/full_a808t.mk)
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Release name
PRODUCT_RELEASE_NAME := a808t

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := a808t
PRODUCT_NAME := cm_a808t
PRODUCT_BRAND := Lenovo
PRODUCT_MODEL := A808t
PRODUCT_MANUFACTURER := Lenovo
