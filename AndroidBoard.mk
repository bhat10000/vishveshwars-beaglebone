LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_PREBUILT_KERNEL),)
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel
endif

file := $(INSTALLED_KERNEL_TARGET)
ALL_PREBUILT += $(file)
$(file): $(TARGET_PREBUILT_KERNEL) | $(ACP)
	$(transform-prebuilt-to-target)

ifeq ($(TARGET_PROVIDES_INIT_RC),true)
file := $(TARGET_ROOT_OUT)/init.rc
$(file): $(LOCAL_PATH)/init.rc | $(ACP)
	$(transform-prebuilt-to-target)
ALL_PREBUILT += $(file)
endif

# keyboard
#PRODUCT_COPY_FILES += \
#	$(LOCAL_PATH)/TWL4030_Keypad.kl:system/usr/keylayout/TWL4030_Keypad.kl

#include $(CLEAR_VARS)
#LOCAL_MODULE_TAGS := optional
#LOCAL_SRC_FILES := TWL4030_Keypad.kcm
#include $(BUILD_KEY_CHAR_MAP)

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/vold.fstab:system/etc/vold.fstab

# Bootsound
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/boot.wav:system/media/audio/ui/boot.wav

# initlogo
PRODUCT_COPY_FILES += \
$(LOCAL_PATH)/../../rowboat/generic/initlogo/android-robot-on-black-480x640.rle:root/initlogo.rle.bak

include frameworks/base/data/sounds/OriginalAudio.mk
