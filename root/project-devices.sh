#!/system/bin/sh

# mknod is not present in stock Android, let's use busybox
PATH=/system/xbin


# Create char device file for WMT, GPS, BT, FM, WIFI
mknod /dev/stpwmt c 190 0
mknod /dev/stpgps c 191 0
mknod /dev/stpbt  c 192 0
mknod /dev/wmtWifi c 153 0

chmod 0660 /dev/stpwmt
chown system:system /dev/stpwmt

chmod 0660 /dev/wmtdetect
chown system:system /dev/wmtdetect

chmod 0660 /dev/wmtWifi
chown system:system /dev/wmtWifi

#lenovo-sw yexm1 add 20140324, for lenovo fm radio app  do not support RDS begin
setprop persist.lenovo.fmradio.rds off
#lenovo-sw yexm1 add 20140324, for lenovo fm radio app  do not support RDS end

#/dev/ttyMT2 for Connectivity BT/FM/GPS usage
chmod 0660 /dev/ttyMT2
chown system:system /dev/ttyMT2


# STP, WMT, GPS, FM and BT Driver
#insmod /system/lib/modules/mtk_hif_sdio.ko
#insmod /system/lib/modules/mtk_stp_wmt.ko
#insmod /system/lib/modules/mtk_stp_uart.ko
#insmod /system/lib/modules/mtk_stp_gps.ko
#insmod /system/lib/modules/mtk_stp_bt.ko
#insmod /system/lib/modules/mtk_fm_drv.ko
#insmod /system/lib/modules/mtk_wmt_wifi.ko

#insmod /system/lib/modules/mtk_wmt_detect.ko

#Camera
chmod 0660 /dev/LC898122AF
chown system camera /dev/LC898122AF
# BT
chmod 0660 /dev/stpbt
chown bluetooth radio /dev/stpbt

# GPS
chown gps gps /dev/stpgps
chown gps gps /sys/class/gpsdrv/gps/pwrctl
chown gps gps /sys/class/gpsdrv/gps/suspend
chown gps gps /sys/class/gpsdrv/gps/state
chown gps gps /sys/class/gpsdrv/gps/pwrsave
chown gps gps /sys/class/gpsdrv/gps/status
chmod 0660 /dev/stpgps

# WiFi
mkdir /data/misc/wifi 0770 wifi wifi
mkdir /data/misc/wifi/sockets 0770 wifi wifi
mkdir /data/misc/wpa_supplicant 0770 wifi wifi
chown wifi wifi /data/misc/wifi

#Disable for one Single loader
# Load WiFi Driver
#insmod /system/lib/modules/wlan.ko

