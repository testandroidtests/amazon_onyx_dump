#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/bootdevice/by-name/recovery:14776320:f45cfdcf6b01221e203098c96fae53f00831b436; then
  applypatch  EMMC:/dev/block/platform/bootdevice/by-name/boot:9369600:e0d1adecb848d33295630aeece8a4c70469b0cb4 EMMC:/dev/block/platform/bootdevice/by-name/recovery 4a81084ff68f3af1bea1c73b32136ceb1e3c8863 14774272 e0d1adecb848d33295630aeece8a4c70469b0cb4:/system/recovery-from-boot.p && installed=1 && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  [ -n "$installed" ] && dd if=/system/recovery-sig of=/dev/block/platform/bootdevice/by-name/recovery bs=1 seek=14774272 && sync && log -t recovery "Install new recovery signature: succeeded" || log -t recovery "Installing new recovery signature: failed"
else
  log -t recovery "Recovery image already installed"
fi
