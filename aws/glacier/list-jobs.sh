#!/bin/bash

# This script is used to list all jobs that have been submitted against a
# given vault. It returns information such as job type, submission time and
# current status.

if [ "$#" -ne 1 ]
then
    echo "Usage $0 <VAULT>"
    exit 1
fi

VAULT=$1

aws glacier list-jobs --account-id - --vault-name "$VAULT"

exit 0

