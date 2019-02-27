#!/bin/bash
imgFile=$1

sectorSize=`fdisk -l ${imgFile} | grep -i "sector size" | cut -d' ' -f 7`
bootSecStart=`fdisk -l ${imgFile} | grep -i img1 | sed 's/ \+/ /g' | cut -d' ' -f 2`
bootSectors=`fdisk -l ${imgFile} | grep -i img1 | sed 's/ \+/ /g' | cut -d' ' -f 4`
rootSecStart=`fdisk -l ${imgFile} | grep -i img2 | sed 's/ \+/ /g' | cut -d' ' -f 2`
rootSectors=`fdisk -l ${imgFile} | grep -i img2 | sed 's/ \+/ /g' | cut -d' ' -f 4`

echo "Mounting boot sector .."
sudo mount -t vfat -o loop,offset=$((${bootSecStart} * ${sectorSize})),sizelimit=$((${bootSectors} * ${sectorSize})) ${imgFile} /mnt/raspi_boot
echo "Mounting root sector .."
sudo mount -t ext4 -o loop,offset=$((${rootSecStart} * ${sectorSize})),sizelimit=$((${rootSectors} * ${sectorSize})) ${imgFile} /mnt/raspi_root
