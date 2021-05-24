#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/bootdevice/by-name/recovery:14804992:a61181a79c65a139f671044179a1981f63a6939b; then
  applypatch  EMMC:/dev/block/platform/bootdevice/by-name/boot:9396224:9bc5dded1b12b0a0d7dd89ec34f2e64ebdb7dade EMMC:/dev/block/platform/bootdevice/by-name/recovery d188c143931f50de6d7544bb28be9bb76b54d41b 14802944 9bc5dded1b12b0a0d7dd89ec34f2e64ebdb7dade:/system/recovery-from-boot.p && installed=1 && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  [ -n "$installed" ] && dd if=/system/recovery-sig of=/dev/block/platform/bootdevice/by-name/recovery bs=1 seek=14802944 && sync && log -t recovery "Install new recovery signature: succeeded" || log -t recovery "Installing new recovery signature: failed"
else
  log -t recovery "Recovery image already installed"
fi
