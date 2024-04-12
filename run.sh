#!/bin/sh

if [ -z "$1" ]; then
    set map_openwrt_location=-v openwrt_builder:/home/user/openwrt
else
    set map_openwrt_location=-v $1:/home/user/openwrt
fi


docker build -t openwrt_builder .

docker run $map_openwrt_location -t openwrt_builder bash build.sh
