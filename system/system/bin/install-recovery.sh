#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/bootdevice/by-name/recovery:14759936:8d82fad7da9a1981514541000c5d63aee3afa3b7; then
  applypatch  EMMC:/dev/block/platform/bootdevice/by-name/boot:9359360:92ab5061cd13ed93f5648f294fee40751854dcf0 EMMC:/dev/block/platform/bootdevice/by-name/recovery 32b9ac5aa949828e2100883b6eb144924c4b5d81 14757888 92ab5061cd13ed93f5648f294fee40751854dcf0:/system/recovery-from-boot.p && installed=1 && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  [ -n "$installed" ] && dd if=/system/recovery-sig of=/dev/block/platform/bootdevice/by-name/recovery bs=1 seek=14757888 && sync && log -t recovery "Install new recovery signature: succeeded" || log -t recovery "Installing new recovery signature: failed"
else
  log -t recovery "Recovery image already installed"
fi
