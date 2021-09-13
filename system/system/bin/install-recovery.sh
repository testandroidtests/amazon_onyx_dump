#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/bootdevice/by-name/recovery:14802944:9cdde0c731646a0a684ad23abc5d3e262ff4f39e; then
  applypatch  EMMC:/dev/block/platform/bootdevice/by-name/boot:9392128:09de3652f06261c6b6eb9b8cff5085d439c70d78 EMMC:/dev/block/platform/bootdevice/by-name/recovery 222709a6e084e2ddc28936bd3759a585457aa298 14800896 09de3652f06261c6b6eb9b8cff5085d439c70d78:/system/recovery-from-boot.p && installed=1 && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  [ -n "$installed" ] && dd if=/system/recovery-sig of=/dev/block/platform/bootdevice/by-name/recovery bs=1 seek=14800896 && sync && log -t recovery "Install new recovery signature: succeeded" || log -t recovery "Installing new recovery signature: failed"
else
  log -t recovery "Recovery image already installed"
fi
