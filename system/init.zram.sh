#!/system/bin/sh
PATH=/sbin:/system/sbin:/system/bin:/system/xbin

# set zram
MemTotalStr=`cat /proc/meminfo | grep MemTotal`
MemTotal=${MemTotalStr:16:8}
swapoff /dev/block/zram0
echo 1 > /sys/block/zram0/reset
# Zram disk - 0.75GB size or 0.5GB size
if [ $MemTotal -gt 2097152 ]; then
    echo 768M > /sys/block/zram0/disksize
else
    echo 512M > /sys/block/zram0/disksize
fi
mkswap /dev/block/zram0
swapon /dev/block/zram0 -p 32758

