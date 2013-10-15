#!/bin/bash

# This script generates the filesystem tarball suitable for flashing to sdcard.
# The filesystem combines the Android '/' and '/system' partitions into one tarball.
# For flashing use 'mkmmc-android.sh' script from external/ti_android_utilities'

# Based on rowboat top-level Makefile

export ANDROID_FS_DIR=$ANDROID_PRODUCT_OUT/android_rootfs

# TODO: Add conditional
echo "ANDROID_FS_DIR: $ANDROID_FS_DIR"
rm -rf $ANDROID_FS_DIR
rm $ANDROID_BUILD_TOP/rootfs.tar.bz2
mkdir $ANDROID_FS_DIR

echo "Copying files..."
cp -r $ANDROID_PRODUCT_OUT/root/* $ANDROID_FS_DIR
cp -r $ANDROID_PRODUCT_OUT/system $ANDROID_FS_DIR
echo "Preparing sdcard tarball..."
 $ANDROID_BUILD_TOP/device/ti/beaglebone/tools/mktarball.sh $ANDROID_HOST_OUT/bin/fs_get_stats $ANDROID_PRODUCT_OUT/android_rootfs . rootfs rootfs.tar.bz2
echo "sdcard tarball at:"
ls $ANDROID_BUILD_TOP/rootfs.tar.bz2

