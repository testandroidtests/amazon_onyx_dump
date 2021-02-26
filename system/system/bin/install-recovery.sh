#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/bootdevice/by-name/recovery:14800896:b445e8ad617f750856d490613f48b21c52c7daf0; then
  applypatch  EMMC:/dev/block/platform/bootdevice/by-name/boot:9394176:26107f15825b38a03d5cb3ab93f3ad44277b8fd2 EMMC:/dev/block/platform/bootdevice/by-name/recovery 8b8c465ee7303352ef82a7f38176040a61788c1d 14798848 26107f15825b38a03d5cb3ab93f3ad44277b8fd2:/system/recovery-from-boot.p && installed=1 && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  [ -n "$installed" ] && dd if=/system/recovery-sig of=/dev/block/platform/bootdevice/by-name/recovery bs=1 seek=14798848 && sync && log -t recovery "Install new recovery signature: succeeded" || log -t recovery "Installing new recovery signature: failed"
else
  log -t recovery "Recovery image already installed"
fi
