#!/sbin/sh

List=`cat /proc/app_info|grep charge_flag -A1`
set -- $List
if [ x$2 = "x1" ]
then
   mount -o ro -t yaffs2 /dev/block/mtdblock4 /system 
   /sbin/charge
fi

