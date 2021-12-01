#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/bootdevice/by-name/recovery:14485504:8343bf8ce12e1891be361e09b403dfb351f96a42; then
  applypatch  EMMC:/dev/block/platform/bootdevice/by-name/boot:9072640:afdffda40a7c195a01832c78b484197f0c6a0786 EMMC:/dev/block/platform/bootdevice/by-name/recovery c80da8793de3fb276d022a5ab7e45a314c6522c1 14483456 afdffda40a7c195a01832c78b484197f0c6a0786:/system/recovery-from-boot.p && installed=1 && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  [ -n "$installed" ] && dd if=/system/recovery-sig of=/dev/block/platform/bootdevice/by-name/recovery bs=1 seek=14483456 && sync && log -t recovery "Install new recovery signature: succeeded" || log -t recovery "Installing new recovery signature: failed"
else
  log -t recovery "Recovery image already installed"
fi
