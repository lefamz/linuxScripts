#!/bin/bash

#usage ./multiVolumetar.sh source-file-or-folder my-archive volume_size-100MB
#where the volume size in bytes (i.e. 1024^2*100=100 Mib)

function printhelp(){
 echo Usage: $0 source-file-or-folder archive-name volume_size
 echo where volume_size is the size of one archive volume in 100MB units 
 echo Example: ./$0 ./myFolder my-archived-folder 5
 echo Example result: multiple files my-archived-folder-X.tar with size of 500 MB each
}

if [[ ! $3 ]] || [[ ! $2 ]] || [[ ! $1 ]]; then
	printhelp
	exit 1
fi	

vol_size=$(($3*1024*1024*100))

src_len=$(du -sb $1|cut -f1)
vol_count=$(($src_len/$vol_size+1))
printf "n $2-%d.tar\n" `seq 2 ${vol_count}` | tar -ML $(($vol_size/1024)) -zcvf $2-1.tar $1
