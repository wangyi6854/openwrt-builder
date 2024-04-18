#!/bin/sh

if [[ ! -z "$1" ]]; then
    docker volume create --driver local --name openwrt_builder --opt type=none --opt device=$1 --opt o=uid=root,gid=root --opt o=bind
fi


docker build -t openwrt_builder .

docker run -v openwrt_builder:/home/user/openwrt -it openwrt_builder bash build.sh
