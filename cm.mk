# Inherit AOSP device configuration for primoc.
$(call inherit-product, device/htc/primou/device.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_NAME := cm_primou
PRODUCT_BRAND := htc
PRODUCT_DEVICE := primou
PRODUCT_MODEL := One V
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_primou BUILD_FINGERPRINT=htc_primou/primou:4.4/KRT16M/330937:user/user-debug PRIVATE_BUILD_DESC="4.4 KRT16M 330937 user-debug"

