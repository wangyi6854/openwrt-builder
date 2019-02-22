#!/bin/sh


cd openwrt


# Updating Sources with Git
git pull


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
make download

# save your changes in the text file mydiffconfig
./scripts/diffconfig.sh >mydiffconfig


# Building Images
make V=s 2>&1 | tee build.log


# Cleaning Up
make clean
make dirclean
make distclean


