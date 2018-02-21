#!/bin/bash
echo "1 for little endian"
echo -n I | hexdump -o | awk '{ print substr($2,6,1); exit}'
