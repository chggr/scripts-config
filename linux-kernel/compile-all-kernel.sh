#! /bin/bash

# This script can be used to compile all Linux kernel source files from
# scratch. It requires one input argument, which is the path to the Linux
# sources. It will clean up the sources directory, generate an all-yes kernel
# configuration and compile the source files. Standard output and error are
# captured in make.out and make.err files respectively for inspection later.

if [ "$#" -ne 1 ] || ! [ -d "$1" ]
then
    echo "Usage $0 <LINUX_SOURCE_DIRECTORY>"
    exit 1
fi

pushd . > /dev/null
cd $1
mkdir ../compiled
make distclean
make allyesconfig O=../compiled
make all -j2 O=../compiled W=12 1>../make.out 2>../make.err
popd > /dev/null

