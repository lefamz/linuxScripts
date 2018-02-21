#!/bin/bash


unlink ~/bin/gcc
unlink ~/bin/g++

ln -s /usr/bin/gcc-4.9 ~/bin/gcc
ln -s /usr/bin/g++-4.9 ~/bin/g++

export PATH=~/bin:$PATH
