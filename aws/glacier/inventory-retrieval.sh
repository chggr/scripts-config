#!/bin/bash

# This script is used to submit a job to AWS Glacier to retrieve the inventory
# of a given vault in the specified region. It returns the id of the job
# created and its location. The current status of the job and the final output
# can be obtained via other scripts.

if [ "$#" -ne 2 ]
then
    echo "Usage $0 <VAULT> <REGION>"
    exit 1
fi

VAULT=$1
REGION=$2

aws glacier initiate-job --account-id - --region "$REGION" --vault-name "$VAULT" \
                         --job-parameters "{\"Type\": \"inventory-retrieval\"}"

exit 0

