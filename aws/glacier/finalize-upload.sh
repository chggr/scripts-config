#!/bin/bash

# This script is used to finalize the multi part upload to AWS Glacier. It
# uses the TreeHashCalculator.java to calculate the SHA-256 tree hash of the
# uploaded file and then sends the output to AWS Glacier to verify the uploaded
# file. The vault, file name and upload id are required as input parameters.

if [ "$#" -ne 3 ]
then
    echo "Usage $0 <VAULT> <FILE_NAME> <UPLOAD_ID>"
    exit 1
fi

VAULT=$1
FILE=$2
UPLOAD_ID=$3

javac TreeHashCalculator.java
TREE_HASH=`java TreeHashCalculator "$FILE"`
ARCHIVE_SIZE=`stat --printf="%s" $FILE`

aws glacier complete-multipart-upload --checksum $TREE_HASH --archive-size $ARCHIVE_SIZE \
                                      --upload-id $UPLOAD_ID --account-id - --vault-name $VAULT
exit 0

