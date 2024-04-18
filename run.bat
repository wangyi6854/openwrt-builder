@echo off

IF not [%1]==[] (
    docker volume create --driver local --name openwrt_builder --opt type=none --opt device="%1" --opt o=uid=root,gid=root --opt o=bind
)

docker build -t openwrt_builder .

docker run -v openwrt_builder:/home/user/openwrt -it openwrt_builder bash build.sh
