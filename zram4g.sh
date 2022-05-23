#!/bin/bash
modprobe zram4g num_devices=4

totalmem=`free | grep -e "^Mem:" | awk '{print $2}'`
mem=$(( ($totalmem)* 1024))

echo $mem > /sys/block/zram0/disksize

mkswap /dev/zram0

swapon -p 5 /dev/zram0
