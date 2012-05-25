#!/bin/bash
make ARCH=arm clean
make ARCH=arm msm8660_celox_usa_att_rev02_defconfig
make -j2 ARCH=arm CROSS_COMPILE=arm-eabi-
cd ../compat-wireless-2012-04-26/
./make.sh
cd ../sgs2-skyrocket-kernel
find . -name "*.ko" -exec cp {} initramfs/lib/modules \;
#./mkbootfs initramfs | gzip > ramdisk.gz
#./mkbootimg-sg2x --kernel zImage --ramdisk ramdisk.gz --cmdline "androidboot.hardware=qcom msm_watchdog.appsbark=0 msm_watchdog.enable=1 loglevel=4" -o boot.img --base 0x40400000 --pagesize 2048
