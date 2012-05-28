#!/bin/bash
make -j2 ARCH=arm CROSS_COMPILE=arm-eabi-
cd ../compat-wireless-2012-04-26/
./make.sh
cd ../sgs2-skyrocket-kernel
./package.sh
