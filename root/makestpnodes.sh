#!/system/bin/sh

mknod /dev/stpwmt c 190 0 > /dev/makestp.log 2>&1
mknod /dev/stpgps c 191 0 >> /dev/makestp.log 2>&1
mknod /dev/stpbt  c 192 0 >> /dev/makestp.log 2>&1
