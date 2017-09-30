#!/bin/bash

# This script uploads all file chunks into AWS Glacier as part of a multi
# part upload that should have already been initialized using init-upload.sh.
# The upload id returned by init-upload needs to be given to this script as
# input. Some chunks might fail to upload due to bad network conditions or
# other issues, in which case it is fine to rerun this script as many times
# as required until all chunks have been successfully uploaded.

if [ "$#" -ne 2 ]
then
    echo "Usage $0 <VAULT> <UPLOAD_ID>"
    exit 1
fi

VAULT=$1
UPLOAD_ID=$2
CHUNK_SIZE=8388608

for file in chunk*;
do
    FILE_NUMBER=$((10#${file:5}))
    BYTE_START=$((FILE_NUMBER * CHUNK_SIZE))
    BYTE_END=$((BYTE_START + `stat --printf="%s" $file` - 1))
    RANGE="bytes $BYTE_START-$BYTE_END/*"

    echo "`date` - Uploading file $file"
    aws glacier upload-multipart-part --upload-id $UPLOAD_ID --body $file \
                                      --range "$RANGE" --account-id - --vault-name $VAULT
    if [ $? -eq 0 ]
    then
        rm -rf $file
    fi
done
exit 0

