#!/bin/bash
z=`ls ../ | grep zip`
for i in $z; do
	unzip -o ../$i
done
echo "done"
