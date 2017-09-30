#!/bin/bash

# This script splits a given file into chunks that can subsequently be uploaded
# to Glacier as a multi part upload. Chunk size is set to 8388608 bytes (i.e.
# 8 MB) as a good compromise between fewer chunks but also the ability to
# easily retry uploading a failed chunk.

if [ "$#" -ne 1 ]
then
    echo "Usage $0 <FILE_NAME>"
    exit 1
fi

FILE=$1
CHUNK_SIZE=8388608

split --bytes=$CHUNK_SIZE -d -a 5 --verbose $FILE chunk
exit 0

