# Release name
PRODUCT_RELEASE_NAME := chagalllte

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := chagalllte
PRODUCT_MODEL := SM-T805
PRODUCT_NAME := omni_chagalllte
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
