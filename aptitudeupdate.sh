#!/bin/bash
su -c 'aptitude update && aptitude dist-upgrade -y &&
apt-get install tar=1.26-4ubuntu1 make=3.81-8.1ubuntu1 -y'
