#!/bin/bash

# This script is used to package up all images in a given directory and create
# a compressed bundle. It deletes all raw images (*.ARW) in the directory and
# zips it up in a tar.gz archive.

if [ "$#" -ne 1 ]
then
    echo "Usage $0 <DIRECTORY>"
    exit 1
fi

DIRECTORY=$1

find $DIRECTORY -name "*.ARW" -type f -delete
tar -cvf "$DIRECTORY.tar" $DIRECTORY
gzip "$DIRECTORY.tar"
gzip -t "$DIRECTORY.tar.gz"

