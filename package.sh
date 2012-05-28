#!/bin/bash
mkdir -p package_tree/system/etc/awmon_modules
rm -f initramfs/lib/modules/*
rm -f package_tree/system/etc/awmon_modules/*
rm -f package_tree/boot.img
find . -name "*.ko" -exec cp {} initramfs/lib/modules \;
./mkbootfs initramfs | gzip > ramdisk.gz
rm -f package_tree/system/etc/awmon_modules/*
cp arch/arm/boot/zImage .
./mkbootimg-sg2x --kernel zImage --ramdisk ramdisk.gz --cmdline "androidboot.hardware=qcom msm_watchdog.appsbark=0 msm_watchdog.enable=1 loglevel=4" -o boot.img --base 0x40400000 --pagesize 2048
cp boot.img package_tree
rm zImage
find ../compat-wireless-2012-04-26/ -name "*.ko" -exec cp {} package_tree/system/etc/awmon_modules/ \;
cd package_tree
zip -r ../sgs2_awmon.zip *
cd ../
