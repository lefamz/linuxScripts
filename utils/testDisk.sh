#!/bin/bash

# ./testDisk.sh device

function printhelp(){
	echo usage: $0 mount_folder [count]
	echo mount_folder - folder where is mounted tested disk
	echo count - optional parameter for number of 8K blocks, 250000 \~ 2 GB is default
}

nBlocks=250000

if [[ -z $1 ]]; then
	printhelp
	exit
fi

if [[ $2 ]]; then
	nBlocks=$2
fi

time sh -c "dd if=/dev/zero of=$1/ddfile bs=8k count=$nBlocks && sync"; rm $1/ddfile
