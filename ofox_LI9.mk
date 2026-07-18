#
# Copyright (C) 2026 OrangeFox Recovery Project
# SPDX-License-Identifier: Apache-2.0
#

# -----------------------------------------------------------------------------
# Base
# -----------------------------------------------------------------------------

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# -----------------------------------------------------------------------------
# GSI Keys
# -----------------------------------------------------------------------------

$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# -----------------------------------------------------------------------------
# Emulated Storage
# -----------------------------------------------------------------------------

$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# -----------------------------------------------------------------------------
# OrangeFox Common
# -----------------------------------------------------------------------------

$(call inherit-product, vendor/twrp/config/common.mk)

# -----------------------------------------------------------------------------
# Device
# -----------------------------------------------------------------------------

$(call inherit-product, device/tecno/LI9/device.mk)

# -----------------------------------------------------------------------------
# Product
# -----------------------------------------------------------------------------

PRODUCT_DEVICE := LI9
PRODUCT_NAME := twrp_LI9
PRODUCT_BRAND := TECNO
PRODUCT_MODEL := TECNO LI9
PRODUCT_MANUFACTURER := TECNO

PRODUCT_GMS_CLIENTID_BASE := android-tecno

# -----------------------------------------------------------------------------
# Properties
# -----------------------------------------------------------------------------

PRODUCT_PROPERTY_OVERRIDES += \
    ro.twrp.vendor_boot=true \
    persist.sys.fuse.passthrough.enable=true \
    ro.fastbootd.available=true \
    ro.orangefox.boot.flash.enabled=1

# -----------------------------------------------------------------------------
# Shipping API
# -----------------------------------------------------------------------------

PRODUCT_SHIPPING_API_LEVEL := 35
