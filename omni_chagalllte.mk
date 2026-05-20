# Release name
PRODUCT_RELEASE_NAME := chagalllte

$(call inherit-product, vendor/twrp/config/common.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := chagalllte
PRODUCT_NAME := omni_chagalllte
PRODUCT_BRAND := galaxy
PRODUCT_MODEL := galaxy tab
PRODUCT_MANUFACTURER := samsung
