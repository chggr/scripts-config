#!/bin/bash

# This script is used to submit a job to AWS Glacier to retrieve the inventory
# of a given vault. It returns the id of the job created and its location. The
# job will typically take multiple hours to complete. Its current status and
# the final output can be obtained via other scripts.

if [ "$#" -ne 1 ]
then
    echo "Usage $0 <VAULT>"
    exit 1
fi

VAULT=$1

aws glacier initiate-job --account-id - --vault-name "$VAULT" \
                         --job-parameters "{\"Type\": \"inventory-retrieval\"}"

exit 0

