#!/bin/bash
echo "Mounting MTP phone"
jmtpfs /mnt/phone
echo "Running sync"
rsync -avu --delete /mnt/phone/Internal\ shared\ storage/DCIM/Camera/ /mnt/data/Pictures/foto_mobil    
