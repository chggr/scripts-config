#!/bin/bash

# This script is used to retrieve the output of a completed job in AWS Glacier.
# The vault name and job id need to be provided as parameters. The output is
# stored in a file named "job_output.json" in the same directory.

if [ "$#" -ne 2 ]
then
    echo "Usage $0 <VAULT> <JOB_ID>"
    exit 1
fi

VAULT=$1
JOB_ID=$2

aws glacier get-job-output --account-id - --vault-name "$VAULT" \
                           --job-id "$JOB_ID" job_output.json

exit 0

