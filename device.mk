#
# Copyright (C) 2011 The Android Open-Source Project
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


PRODUCT_COPY_FILES := \
	device/ti/beaglebone/init.am335xevm.rc:root/init.am335xevm.rc \
	device/ti/beaglebone/init.am335xevm.usb.rc:root/init.am335xevm.usb.rc \
	device/ti/beaglebone/vold.fstab:system/etc/vold.fstab \
	device/ti/beaglebone/fstab.am335xevm:root/fstab.am335xevm \
	device/ti/beaglebone/ueventd.am335xevm.rc:root/ueventd.am335xevm.rc \
	device/ti/beaglebone/media_codecs.xml:system/etc/media_codecs.xml \
	device/ti/beaglebone/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_COPY_FILES += \
	device/ti/beaglebone/apns-full-conf.xml:system/etc/apns-conf.xml

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

PRODUCT_COPY_FILES += \
	device/ti/beaglebone/ppp/ip-up-datakey:system/etc/ppp/ip-up-datakey \
	device/ti/beaglebone/ppp/ip-down-datakey:system/etc/ppp/ip-down-datakey \
	device/ti/beaglebone/usbmodeswitch.conf:system/etc/usbmodeswitch.conf

# KeyPads
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/ti-tsc.idc:system/usr/idc/ti-tsc.idc

PRODUCT_PROPERTY_OVERRIDES := \
       hwui.render_dirty_regions=false

# Explicitly specify dpi, otherwise the icons don't show up correctly with SGX enabled
PRODUCT_PROPERTY_OVERRIDES += \
       ro.sf.lcd_density=160

PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.strictmode.visual=0 \
	persist.sys.strictmode.disable=1

PRODUCT_CHARACTERISTICS := tablet,nosdcard

DEVICE_PACKAGE_OVERLAYS := \
    device/ti/beaglebone/overlay

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PACKAGES += \
	librs_jni \
	com.android.future.usb.accessory

PRODUCT_PACKAGES += \
	libaudioutils

PRODUCT_PACKAGES += \
        audio.primary.beaglebone \
        tinycap \
        tinymix \
        tinyplay

PRODUCT_PACKAGES += \
	dhcpcd.conf

# Filesystem management tools
PRODUCT_PACKAGES += \
	make_ext4fs

# Backlight HAL (liblights)
PRODUCT_PACKAGES += \
	lights.beaglebone

PRODUCT_PACKAGES += \
	FileManager-1.1.6

PRODUCT_PACKAGES += \
	androidvncserver

PRODUCT_PACKAGES += \
	camera.omap3

PRODUCT_PACKAGES += \
	rild

$(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)
$(call inherit-product-if-exists, external/tslib/tslib.mk)
