#!/bin/sh -x


cd openwrt

make clean

# Updating Sources with Git
git pull || git clone https://github.com/openwrt/openwrt.git .
git checkout $(git tag | grep -v "rc" | sort -V | tail -n 1)
#git checkout master

# Updating Feeds
./scripts/feeds update -a
./scripts/feeds install -a


# Image Configuration

# set target
make menuconfig

# set default config for build system and device
make defconfig

# optional
#make kernel_menuconfig

# modify set of package
make menuconfig

# download all dependency source files before final make, enables multi-core compilation
make -j$(nproc) download

# save your changes in the text file mydiffconfig
./scripts/diffconfig.sh >mydiffconfig


# Building Images
make -j$(nproc) V=s 2>&1 | tee build.log


# Cleaning Up
#make clean
#make dirclean
#make distclean


