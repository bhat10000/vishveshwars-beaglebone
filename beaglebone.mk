PRODUCT_PACKAGES := \
	ApiDemos      \
	SoundRecorder \
	GeneralRunner \
	EvilSkull \
	Vase \
	lights.$(TARGET_PRODUCT) \
	alsa.$(TARGET_PRODUCT)


$(call inherit-product, build/target/product/generic.mk)

# Overrides
PRODUCT_BRAND := TI
PRODUCT_NAME := beaglebone
PRODUCT_DEVICE := beaglebone
PRODUCT_PACKAGE_OVERLAYS := device/rowboat/generic
