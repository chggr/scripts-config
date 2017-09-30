#!/bin/bash

# This script is used to initiate a multi part upload on AWS Glacier. It
# requires the name of the Glacier vault and the name of the file to be
# uploaded in that vault. It returns the upload id. Upload chunk size is set
# to 8388608 bytes (i.e. 8 MB) as a good compromise between fewer chunks but
# also the ability to easily retry uploading a failed chunk.

if [ "$#" -ne 2 ]
then
    echo "Usage $0 <VAULT> <FILE_NAME>"
    exit 1
fi

VAULT=$1
FILE=$2
CHUNK_SIZE=8388608

aws glacier initiate-multipart-upload --account-id - --archive-description "$FILE" \
                                      --part-size $CHUNK_SIZE --vault-name "$VAULT"
exit 0

