$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

# proprietary side of the device
$(call inherit-product-if-exists, vendor/semc/haida/haida-vendor.mk)


# Discard inherited values and use our own instead.
PRODUCT_NAME := haida
PRODUCT_DEVICE := haida
PRODUCT_MODEL := haida

TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel
PRODUCT_COPY_FILES += \
    $(TARGET_PREBUILT_KERNEL):kernel

-include device/semc/mogami-common/mogami.mk

# These is the hardware-specific overlay, which points to the location
# of hardware-specific resource overrides, typically the frameworks and
# application settings that are stored in resourced.
DEVICE_PACKAGE_OVERLAYS += device/semc/haida/overlay

# These are the hardware-specific configuration files
PRODUCT_COPY_FILES += \
    device/semc/haida/prebuilt/media_profiles.xml:system/etc/media_profiles.xml

# Init files
PRODUCT_COPY_FILES += \
    device/semc/haida/prebuilt/init.semc.usb.rc:root/init.semc.usb.rc \
    device/semc/haida/prebuilt/bootrec-device:root/sbin/bootrec-device \
    device/semc/haida/prebuilt/hw_config.sh:system/etc/hw_config.sh \
    device/semc/haida/prebuilt/pre_hw_config.sh:root/pre_hw_config.sh \
    device/semc/msm7x30-common/prebuilt/logo_H.rle:root/logo.rle \
    device/semc/haida/recovery.fstab:root/recovery.fstab

#device specific features
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/android.hardware.camera.front.xml

# semc msm7x30 uses high-density artwork where available
PRODUCT_LOCALES += hdpi

-include device/semc/msm7x30-common/prebuilt/resources-hdpi.mk

#LCD DENSITY
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240 \
    com.qc.hdmi_out=false
