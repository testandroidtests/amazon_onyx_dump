#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/bootdevice/by-name/recovery:14614528:411c002063f2fbd8331dc6db61d6d2deeeb2b5a9; then
  applypatch  EMMC:/dev/block/platform/bootdevice/by-name/boot:9203712:fad033defa858808e9da16165f1e0f91b9fc7b20 EMMC:/dev/block/platform/bootdevice/by-name/recovery 56a57a8f99d15b89e97c6dcea8d47185cf665488 14612480 fad033defa858808e9da16165f1e0f91b9fc7b20:/system/recovery-from-boot.p && installed=1 && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  [ -n "$installed" ] && dd if=/system/recovery-sig of=/dev/block/platform/bootdevice/by-name/recovery bs=1 seek=14612480 && sync && log -t recovery "Install new recovery signature: succeeded" || log -t recovery "Installing new recovery signature: failed"
else
  log -t recovery "Recovery image already installed"
fi
