#!/bin/bash


unlink ~/bin/python
unlink ~/bin/python-config

ln -s /usr/bin/python3 ~/bin/python
ln -s /usr/bin/python3-config ~/bin/python-config

export PATH=~/bin:$PATH
