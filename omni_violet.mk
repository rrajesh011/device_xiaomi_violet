#
# Copyright (C) 2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

VENDOR_EXCEPTION_PATHS += \
    omni \
    xiaomi

VENDOR_EXCEPTION_MODULES += \
    FM2 \
    qcom.fmradio \
    libqcomfm_jni \
    libqcomfm_jni_32

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Get the prebuilt list of APNs
$(call inherit-product, vendor/omni/config/gsm.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# CarrierConfig
DEVICE_PACKAGE_OVERLAYS += vendor/omni/overlay/CarrierConfig

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from violet device
$(call inherit-product, device/xiaomi/violet/device.mk)

# Inherit aosp mainline system configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/mainline_system_arm64.mk)

PRODUCT_SHIPPING_API_LEVEL := 28

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := omni_violet
PRODUCT_DEVICE := violet
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Redmi Note 7 Pro
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="violet-user 9 PKQ1.181203.001 V10.3.9.0.PFHINXM release-keys" \
    PRODUCT_NAME="violet" \
    TARGET_DEVICE="violet"

BUILD_FINGERPRINT := "google/coral/coral:10/QQ2A.200501.001.A3/6353761:user/release-keys"

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
