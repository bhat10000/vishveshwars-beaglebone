#!/bin/bash

# This script generates the filesystem tarball suitable for flashing to sdcard.
# The filesystem combines the Android '/' and '/system' partitions into one tarball.
# For flashing use 'mkmmc-android.sh' script from external/ti_android_utilities'

# Based on rowboat top-level Makefile

# first check if lunch is done
if [ -z "$ANDROID_BUILD_TOP" ]; then
    echo "ANDROID_BUILD_TOP undefined"
exit 1
fi
if [ -z "$ANDROID_PRODUCT_OUT" ]; then
    echo "ANDROID_PRODUCT_OUT undefined"
exit 1
fi

# Check for beaglebone target
if [ "$TARGET_PRODUCT" != "beaglebone" ]; then
    echo "Only 'TARGET_PRODUCT = beaglebone' is supported for generating rootfs tarball"
exit 1
fi

export ANDROID_FS_DIR=$ANDROID_PRODUCT_OUT/android_rootfs

echo "ANDROID_FS_DIR: $ANDROID_FS_DIR"
if [ -d "$ANDROID_FS_DIR" ]; then
    echo "Deleting old fs tarball"
    rm -rf $ANDROID_FS_DIR
fi
if [ -e "$ANDROID_BUILD_TOP/rootfs.tar.bz2" ]; then
    rm $ANDROID_BUILD_TOP/rootfs.tar.bz2
fi
mkdir $ANDROID_FS_DIR

echo "Copying files..."
cp -r $ANDROID_PRODUCT_OUT/root/* $ANDROID_FS_DIR
cp -r $ANDROID_PRODUCT_OUT/system $ANDROID_FS_DIR
echo "Preparing sdcard tarball..."
 $ANDROID_BUILD_TOP/device/ti/beaglebone/tools/mktarball.sh $ANDROID_HOST_OUT/bin/fs_get_stats $ANDROID_PRODUCT_OUT/android_rootfs . rootfs rootfs.tar.bz2
echo "sdcard tarball at:"
ls $ANDROID_BUILD_TOP/rootfs.tar.bz2

