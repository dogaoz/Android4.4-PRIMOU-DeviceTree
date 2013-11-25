#
# Copyright (C) 2011 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# common msm7x30 configs
$(call inherit-product, device/htc/msm7x30-common/msm7x30.mk)

# GPS config
PRODUCT_COPY_FILES += device/htc/primou/configs/gps.conf:system/etc/gps.conf

# Ramdisk
PRODUCT_COPY_FILES += \
    device/htc/primou/ramdisk/init.primou.rc:root/init.primou.rc \
    device/htc/primou/ramdisk/ueventd.primou.rc:root/ueventd.primou.rc \
    device/htc/primou/ramdisk/fstab.primou:root/fstab.primou

# Vendor
$(call inherit-product-if-exists, vendor/htc/primou/primou-vendor.mk)

# Misc. property overrides
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=2.3_r3 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    ro.sf.lcd_density=240 \
    dalvik.vm.debug.alloc=0
	


# Override /proc/sys/vm/dirty_ratio on UMS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=20

DEVICE_PACKAGE_OVERLAYS += device/htc/primou/overlay


PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml

# GPS / BT / Lights / Sensors
PRODUCT_PACKAGES += \
    libbt-vendor \
    gps.primou \
    librpc \
    lights.primou \
    sensors.primou

# CFX Packages
PRODUCT_PACKAGES += \
    Torch \
    make_ext4fs \
    FileManager \
    e2fsck \
    setup_fs

# Input device config
PRODUCT_COPY_FILES += \
    device/htc/primou/idc/himax-touchscreen.idc:system/usr/idc/himax-touchscreen.idc \
    device/htc/primou/idc/primou-keypad.idc:system/usr/idc/primou-keypad.idc \
    device/htc/primou/idc/qwerty.idc:system/usr/idc/qwerty.idc \
    device/htc/primou/idc/qwerty2.idc:system/usr/idc/qwerty2.idc \
    device/htc/primou/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc

# Keylayouts and keychars
PRODUCT_COPY_FILES += \
    device/htc/primou/keylayout/keychars/Generic.kcm:system/usr/keychars/Generic.kcm \
    device/htc/primou/keylayout/keychars/qwerty.kcm:system/usr/keychars/qwerty.kcm \
    device/htc/primou/keylayout/keychars/qwerty2.kcm:system/usr/keychars/qwerty2.kcm \
    device/htc/primou/keylayout/keychars/Virtual.kcm:system/usr/keychars/Virtual.kcm \
    device/htc/primou/keylayout/keylayout/himax-touchscreen.kl:system/usr/keylayout/himax-touchscreen.kl \
    device/htc/primou/keylayout/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/htc/primou/keylayout/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/primou/keylayout/keylayout/primou-keypad.kl:system/usr/keylayout/primou-keypad.kl \
    device/htc/primou/keylayout/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/htc/primou/keylayout/keylayout/synaptics-rmi-touchscreen.kl:system/usr/keylayout/synaptics-rmi-touchscreen.kl

# Inherit qcom proprietary blobs
$(call inherit-product, vendor/qcom/proprietary/qcom-vendor.mk)

# ACDB
PRODUCT_COPY_FILES += \
    device/htc/primou/configs/default.acdb:system/etc/firmware/default.acdb \
    device/htc/primou/configs/default_org.acdb:system/etc/firmware/default_org.acdb

# Audio DSP Profiles
PRODUCT_COPY_FILES += \
    device/htc/primou/dsp/AdieHWCodec.csv:system/etc/AdieHWCodec.csv \
    device/htc/primou/dsp/AIC3254_REG.csv:system/etc/AIC3254_REG.csv \
    device/htc/primou/dsp/CodecDSPID.txt:system/etc/CodecDSPID.txt \
    device/htc/primou/dsp/TPA2051_CFG.csv:system/etc/TPA2051_CFG.csv 
	

$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)

# BCM4330 firmware
PRODUCT_COPY_FILES += \
    device/htc/primou/firmware/bcm4330.hcd:system/etc/firmware/bcm4330.hcd \
    device/htc/primou/firmware/fw_bcm4330_apsta_b1.bin:system/etc/firmware/fw_bcm4330_apsta_b1.bin \
    device/htc/primou/firmware/fw_bcm4330_apsta_b2.bin:system/etc/firmware/fw_bcm4330_apsta_b2.bin \
    device/htc/primou/firmware/fw_bcm4330_b2.bin:system/etc/firmware/fw_bcm4330_b2.bin \
    device/htc/primou/firmware/fw_bcm4330_b1.bin:system/etc/firmware/fw_bcm4330_b1.bin \
    device/htc/primou/firmware/fw_bcm4330_p2p_b2.bin:system/etc/firmware/fw_bcm4330_p2p_b2.bin \
    device/htc/primou/firmware/fw_bcm4330_p2p_b1.bin:system/etc/firmware/fw_bcm4330_p2p_b1.bin \
    device/htc/primou/firmware/calibration:system/etc/calibration

# Kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
        LOCAL_KERNEL := device/htc/primou/prebuilt/kernel/kernel

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel
endif

# Enable Low Ram Device flag => http://source.android.com/devices/low-ram.html
#PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.low_ram=true
# Disable JIT
#PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.jit.codecachesize=0

# Turn off ZRAM by default
PRODUCT_PROPERTY_OVERRIDES += \
    ro.zram.default=0

# HTC Audio
$(call inherit-product, device/htc/primou/media_a1026.mk)
$(call inherit-product, device/htc/primou/media_htcaudio.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)
