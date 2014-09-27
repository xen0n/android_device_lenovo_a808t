#!/bin/sh

set -e

VENDOR=lenovo
DEVICE=a808t

extract_blob () {
    local SRC
    local BASE
    local FILE
    local DEST

    SRC=$1
    BASE=$2
    FILE=$3
    DEST=$4

    if [ "$SRC" = "adb" ]; then
        adb pull "/system/$FILE" "$BASE/$DEST"
    else
        cp "$SRC/system/$FILE" "$BASE/$DEST"
    fi
}


if [ $# -eq 1 ]; then
    COPY_FROM=$1
    test ! -d "$COPY_FROM" && echo error reading dir "$COPY_FROM" && exit 1
fi

if [ $# -eq 0 ]; then
    SRC=adb
else
    if [ $# -eq 1 ]; then
        SRC=$1
    else
        echo "$0: bad number of arguments"
        echo ""
        echo "usage: $0 [PATH_TO_EXPANDED_ROM]"
        echo ""
        echo "If PATH_TO_EXPANDED_ROM is not specified, blobs will be extracted from"
        echo "the device using adb pull."
        exit 1
    fi
fi

BASE=../../../vendor/$VENDOR/$DEVICE/proprietary
rm -rf $BASE/*

for FILE in `cat proprietary-blobs.txt | grep -v ^# | grep -v ^$ | grep -v ^-`; do
    DIR=`dirname $FILE`
    if [ ! -d $BASE/$DIR ]; then
        mkdir -p $BASE/$DIR
    fi

    extract_blob "$SRC" "$BASE" "$FILE" "$FILE"
done


# extract audio libraries with nonstandard filenames, renaming along the way
#extract_blob "$SRC" "$BASE" lib/hw/audio_policy.default.so lib/hw/audio_policy.mt6592.so
extract_blob "$SRC" "$BASE" lib/libaudio.primary.default.so lib/hw/audio.primary.mt6592.so
extract_blob "$SRC" "$BASE" lib/hw/libaudio.r_submix.default.so lib/hw/audio.r_submix.mt6592.so
extract_blob "$SRC" "$BASE" lib/hw/libaudio.usb.default.so lib/hw/audio.usb.mt6592.so


./setup-makefiles.sh


# vim:set ai et ts=4 sw=4 sts=4 fenc=utf-8:
