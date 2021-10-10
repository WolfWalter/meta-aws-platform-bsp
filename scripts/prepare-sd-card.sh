#! /bin/sh

if [ $# -ne 1 ]; then
  echo "Usage: $0 <drive>"
  exit 1;
fi

DRIVE=$1
PARTITION1=${DRIVE}1
PARTITION2=${DRIVE}2

umount ${PARTITION1}
umount ${PARTITION2}

SIZE=$(fdisk -l ${DRIVE} | grep Disk | grep bytes | awk '{print $5}')

echo DISK SIZE - ${SIZE} bytes

CYLINDERS=$(echo ${SIZE}/255/63/512 | bc)

echo CYLINDERS - ${CYLINDERS}

echo "Now make partitions on ${DRIVE}..."

{
echo ,9,0x0C,*
echo ,,,-
} | sfdisk -D -H 255 -S 63 -C $CYLINDERS $DRIVE

echo "Formating ${DRIVE}..."

# Formating SD-Card:
# - Partition 1: FAT32 - boot.
# - Partition 2: EXT4 - rootfs.
if [ -b ${PARTITION1} ]; then
  mkfs.vfat -F 32 -n "boot" ${PARTITION1}
else
  echo "Cant find ${PARTITION1} partition in /dev"
fi

if [ -b ${PARITION2} ]; then
  mkfs.ext4 -L "rootfs" ${PARTITION2}
else
  echo "Cant find ${PARTITION2} partition in /dev"
fi
