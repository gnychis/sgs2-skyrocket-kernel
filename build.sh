#!/bin/bash
make ARCH=arm clean
make ARCH=arm msm8660_celox_usa_att_rev02_defconfig
make -j2 ARCH=arm CROSS_COMPILE=arm-eabi-
cd ../compat-wireless-2012-04-26/
./make.sh
cd ../sgs2-skyrocket-kernel
