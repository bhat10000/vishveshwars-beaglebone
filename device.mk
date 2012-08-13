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
	device/ti/beaglebone/media_codecs.xml:system/etc/media_codecs.xml


PRODUCT_PROPERTY_OVERRIDES := \
	hwui.render_dirty_regions=false \
	ro.sf.lcd_density=120

PRODUCT_CHARACTERISTICS := tablet

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

$(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)
$(call inherit-product-if-exists, external/tslib/tslib.mk)
