#!/bin/bash


unlink ~/bin/python
unlink ~/bin/python-config

ln -s /usr/bin/python2 ~/bin/python
ln -s /usr/bin/python2-config ~/bin/python-config

export PATH=~/bin:$PATH
