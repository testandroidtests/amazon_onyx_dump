#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/bootdevice/by-name/recovery:14766080:a486a80407ee955eca42f2a74823e6c180748769; then
  applypatch  EMMC:/dev/block/platform/bootdevice/by-name/boot:9365504:c46bdf150f8e995fb674e8fa712831f049cc0af8 EMMC:/dev/block/platform/bootdevice/by-name/recovery 0d7b9990056fe5272297a00b8adc1d3844245b12 14764032 c46bdf150f8e995fb674e8fa712831f049cc0af8:/system/recovery-from-boot.p && installed=1 && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  [ -n "$installed" ] && dd if=/system/recovery-sig of=/dev/block/platform/bootdevice/by-name/recovery bs=1 seek=14764032 && sync && log -t recovery "Install new recovery signature: succeeded" || log -t recovery "Installing new recovery signature: failed"
else
  log -t recovery "Recovery image already installed"
fi
