@echo off

IF [%1]==[] (
    set map_openwrt_location=-v openwrt_builder:/home/user/openwrt
) ELSE (
    set map_openwrt_location=-v %1:/home/user/openwrt
)

docker build -t openwrt_builder .

docker run %map_openwrt_location% -t openwrt_builder bash build.sh
