DEVICE_TREE := device/samsung/chagalllte
TARGET_DEVICE := chagalllte

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := universal5420

# Platform
TARGET_BOARD_PLATFORM := exynos5
TARGET_BOARD_PLATFORM_GPU := mali-t628mp6

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a15
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_IS_64_BIT := false

# Flags
COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60 -DNO_SECURE_DISCARD

# Kernel
TARGET_KERNEL_ARCH := arm
TARGET_KERNEL_HEADER_ARCH := arm
TARGET_PREBUILT_KERNEL := $(DEVICE_TREE)/zImage

# Boot image
BOARD_KERNEL_CMDLINE := androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 --tags_offset 0x00000100
BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_TREE)/bootimg.mk

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE     := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760   # Это всего 10 МБ! Критически мало.
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 2506096640
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12608323584
BOARD_CACHEIMAGE_PARTITION_SIZE    := 209715200
BOARD_FLASH_BLOCK_SIZE := 131072

# Stub dynamic partitions flag to prevent compilation abortion in TWRP 11+
BOARD_SUPER_PARTITION_GROUPS :=

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SUPPRESS_SECURE_ERASE := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# TWRP & OrangeFox Display Settings
TW_THEME := portrait_hdpi
BOARD_HAS_FLIPPED_SCREEN := true
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

# Hardware Paths
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/exynos-dwc3.0/exynos-ss-udc.0/gadget/lun%d/file"
TW_BRIGHTNESS_PATH := "/sys/devices/platform/s5p-mipi-dsim.1/backlight/panel/brightness"
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 162

# Samsung Specific Flags
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true
BOARD_HAS_NO_SELECT_BUTTON := true

# File Systems drivers
TW_INCLUDE_NTFS_3G := true
TW_NO_EXFAT_FUSE := true

# Exclude heavy components to fit into 10MB recovery partition
TW_EXCLUDE_SUPERSU := true
TW_INCLUDE_CRYPTO := false
TWRP_INCLUDE_LOGCAT := false
TW_EXCLUDE_APEX := true

# OrangeFox Optimization Flags for Ultra-Low Storage Devices
DISABLE_RECOVERY_PROMO := true
FOX_EMPTY_INITD := true
TW_OUTPUT_STRIP := true

