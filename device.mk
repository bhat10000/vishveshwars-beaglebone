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
	device/ti/beaglebone/init.rc:root/init.rc \
	device/ti/beaglebone/init.am335xevm.rc:root/init.am335xevm.rc \
	device/ti/beaglebone/init.am335xevm.usb.rc:root/init.am335xevm.usb.rc \
	device/ti/beaglebone/vold.fstab:system/etc/vold.fstab \
	device/ti/beaglebone/fstab.am335xevm:root/fstab.am335xevm \
	device/ti/beaglebone/ueventd.am335xevm.rc:root/ueventd.am335xevm.rc \
	device/ti/beaglebone/media_codecs.xml:system/etc/media_codecs.xml \
	device/ti/beaglebone/media_profiles.xml:system/etc/media_profiles.xml

# KeyPads
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/ti-tsc.idc:system/usr/idc/ti-tsc.idc

PRODUCT_PROPERTY_OVERRIDES := \
       hwui.render_dirty_regions=false

# Explicitly specify dpi, otherwise the icons don't show up correctly with SGX enabled
PRODUCT_PROPERTY_OVERRIDES += \
       ro.sf.lcd_density=160

# This device has 'only' 512MB of RAM
PRODUCT_PROPERTY_OVERRIDES += \
       ro.config.low_ram=true

# HACK: get surfaceflinger working in absence of SGX libraries
PRODUCT_PROPERTY_OVERRIDES += \
       ro.kernel.qemu=1 \
       ro.kernel.qemu.gles=0
PRODUCT_PACKAGES += \
	libGLES_android

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
	dhcpcd.conf

# Filesystem management tools
PRODUCT_PACKAGES += \
	make_ext4fs

# Backlight HAL (liblights)
PRODUCT_PACKAGES += \
	lights.beaglebone

# Beaglebone custom gralloc
PRODUCT_PACKAGES += \
	gralloc.beaglebone

# host package required for making sdcard tarball
PRODUCT_PACKAGES += \
	fs_get_stats

$(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)
