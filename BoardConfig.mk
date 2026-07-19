#
# Copyright (C) 2024 The Android Open Source Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/tecno/LI9

# -----------------------------------------------------------------------------
# Build
# -----------------------------------------------------------------------------

TW_FORCE_SELINUX_PERMISSIVE := true

ALLOW_MISSING_DEPENDENCIES := true
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# -----------------------------------------------------------------------------
# Architecture
# -----------------------------------------------------------------------------

TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a55

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

TARGET_USES_64_BIT_BINDER := true

# -----------------------------------------------------------------------------
# Device
# -----------------------------------------------------------------------------

TARGET_BOOTLOADER_BOARD_NAME := LI9
TARGET_OTA_ASSERT_DEVICE := LI9,TECNO-LI9

# -----------------------------------------------------------------------------
# Platform
# -----------------------------------------------------------------------------

TARGET_BOARD_PLATFORM := mt6833

# -----------------------------------------------------------------------------
# Kernel
# -----------------------------------------------------------------------------

TARGET_NO_KERNEL := true

BOARD_BOOT_HEADER_VERSION := 4
BOARD_USES_VENDOR_BOOT := true
BOARD_USES_INIT_BOOT := true
BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_USES_GENERIC_KERNEL_IMAGE := true

BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x11088000
BOARD_TAGS_OFFSET := 0x07c08000
BOARD_DTB_OFFSET := 0x07c08000
BOARD_PAGE_SIZE := 4096

BOARD_VENDOR_CMDLINE := bootopt=64S3,32N2,64N2

TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img

BOARD_MKBOOTIMG_ARGS += \
    --header_version $(BOARD_BOOT_HEADER_VERSION) \
    --pagesize $(BOARD_PAGE_SIZE) \
    --board "" \
    --kernel_offset $(BOARD_KERNEL_OFFSET) \
    --ramdisk_offset $(BOARD_RAMDISK_OFFSET) \
    --tags_offset $(BOARD_TAGS_OFFSET) \
    --dtb_offset $(BOARD_DTB_OFFSET) \
    --vendor_cmdline "$(BOARD_VENDOR_CMDLINE)" \
    --dtb $(TARGET_PREBUILT_DTB)

# -----------------------------------------------------------------------------
# Hardware
# -----------------------------------------------------------------------------

BOARD_USES_MTK_HARDWARE := true

# -----------------------------------------------------------------------------
# Partitions
# -----------------------------------------------------------------------------

BOARD_FLASH_BLOCK_SIZE := 262144

BOARD_BOOTIMAGE_PARTITION_SIZE := 41943040
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 67108864

BOARD_HAS_LARGE_FILESYSTEM := true

BOARD_SUPER_PARTITION_SIZE := 9126805504

BOARD_SUPER_PARTITION_GROUPS := mtk_dynamic_partitions

BOARD_MTK_DYNAMIC_PARTITIONS_PARTITION_LIST := \
    system \
    system_ext \
    product \
    vendor \
    vendor_dlkm \
    system_dlkm \
    odm_dlkm

BOARD_MTK_DYNAMIC_PARTITIONS_SIZE := 9122611200

# -----------------------------------------------------------------------------
# Filesystems
# -----------------------------------------------------------------------------

BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_EXT := system_ext

# -----------------------------------------------------------------------------
# Recovery
# -----------------------------------------------------------------------------

TARGET_NO_RECOVERY := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab

BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_SUPPRESS_SECURE_ERASE := true

BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE := true
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true

# -----------------------------------------------------------------------------
# Debug
# -----------------------------------------------------------------------------

TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true

# -----------------------------------------------------------------------------
# Properties
# -----------------------------------------------------------------------------

TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# -----------------------------------------------------------------------------
# VNDK
# -----------------------------------------------------------------------------

BOARD_VNDK_VERSION := current

# -----------------------------------------------------------------------------
# Crypto
# -----------------------------------------------------------------------------

BOARD_USES_METADATA_PARTITION := true

TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
TW_INCLUDE_FBE_VOLD_DECRYPT := true

TW_USE_FSCRYPT_POLICY := 2
TW_USE_KEYMASTER := 1
TW_FORCE_KEYMASTER_VER := true

# -----------------------------------------------------------------------------
# AVB
# -----------------------------------------------------------------------------

BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

BOARD_AVB_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)

# -----------------------------------------------------------------------------
# Display
# -----------------------------------------------------------------------------

TARGET_SCREEN_WIDTH := 1080
TARGET_SCREEN_HEIGHT := 2436
TARGET_SCREEN_DENSITY := 480

TW_FRAMERATE := 60

TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 150
TW_DEFAULT_BRIGHTNESS := 60
TW_NO_SCREEN_BLANK := true

TW_CUSTOM_CPU_TEMP_PATH := "/sys/class/thermal/thermal_zone0/temp"

# -----------------------------------------------------------------------------
# TWRP
# -----------------------------------------------------------------------------

TW_EXTRA_LANGUAGES := true

TARGET_USES_MKE2FS := true

TW_INCLUDE_FB2PNG := true
TW_INCLUDE_NTFS_3G := true
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_LIBRESETPROP := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_LPTOOLS := true

TW_HAS_NO_RECOVERY_PARTITION := true

TW_STATUS_ICONS_ALIGN := center
TW_CUSTOM_CPU_POS := "300"
TW_CUSTOM_CLOCK_POS := "70"
TW_CUSTOM_BATTERY_POS := "790"

TW_INCLUDE_FASTBOOTD := true

# -----------------------------------------------------------------------------
# USB / MTP
# -----------------------------------------------------------------------------

TW_EXCLUDE_DEFAULT_USB_INIT := true

TW_USB_STORAGE := true

TW_HAS_MTP := true
TW_MTP_DEVICE := "/dev/usb-ffs/mtp"
TW_INCLUDE_LIBUSB := true

# -----------------------------------------------------------------------------
# Init
# -----------------------------------------------------------------------------

TARGET_INIT_VENDOR_LIB := libinit_LI9
TARGET_RECOVERY_DEVICE_MODULES := libinit_LI9

# -----------------------------------------------------------------------------
# Vendor Modules
# -----------------------------------------------------------------------------

TW_LOAD_VENDOR_BOOT_MODULES := true

# -----------------------------------------------------------------------------
# OrangeFox
# -----------------------------------------------------------------------------

FOX_MAINTAINER_PATCH_VERSION := Shah_qufi

FOX_USE_BASH_SHELL := 1
FOX_DELETE_AROMAFM := 1

FOX_USE_UPDATED_MAGISKBOOT := 1

OF_FLASHLIGHT_ENABLE := 1

OF_WIPE_METADATA_AFTER_DATAFORMAT := 1

OF_UNMOUNT_SDCARDS_BEFORE_REBOOT := 1

OF_NO_SPLASH_CHANGE := 1
