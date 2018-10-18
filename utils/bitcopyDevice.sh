#!/bin/bash

printHelp(){
 echo "Usage: $0 operation device target_file block_size"
 echo "operation: tf - grab device to file
           td - burn image to device"
 echo "block_size e.g. 4M for 4 megabytes, default value 1M"
 echo "Example: $0 tf /dev/sdb ~/my_image.img.gz"
}

blockSize=1M

if [[ -z $1 ]] ||  [[ -z $2 ]] || [[ -z $3 ]]; then
	printHelp
	exit
fi

op=$1
device=$2
file=$3

if [[ ! -z $4 ]]; then
	blockSize=$4
fi

if [[ ! $op == "tf" ]] && [[ ! $op == "td" ]]; then
	echo "ERROR: Unknown operation
	"
	printHelp
	exit
fi

if [[ $op == "tf" ]]; then
	echo "Grabbing device $device to file $file"
	dd if=$device conv=fsync status=progress | gzip -c  > $file
fi

if [[ $op == "td" ]]; then
	echo "Burning file $file to device $device with bs $blockSize"
	gunzip -c $file | dd of=$device status=progress bs=$blockSize conv=fsync
fi
