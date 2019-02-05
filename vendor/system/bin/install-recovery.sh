#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 10991616 ab1c2608201ff280a90ddca91d0e81fb21135f58 8460288 7157095f5cb4ff19c2ecbd9f5c97a929830a498d
fi

if ! applypatch -c EMMC:/dev/block/platform/sdio_emmc/by-name/RECOVERY:10991616:ab1c2608201ff280a90ddca91d0e81fb21135f58; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/sdio_emmc/by-name/KERNEL:8460288:7157095f5cb4ff19c2ecbd9f5c97a929830a498d EMMC:/dev/block/platform/sdio_emmc/by-name/RECOVERY ab1c2608201ff280a90ddca91d0e81fb21135f58 10991616 7157095f5cb4ff19c2ecbd9f5c97a929830a498d:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
