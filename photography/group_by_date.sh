#!/bin/bash

# This script will attempt to group all jpg photographs in the current directory
# by the year they have originally been taken and place them into a sparate
# sub-directory. It can be easily modified to group by year and/or month and/or
# day.
#
# Many people do not frequently empty their memory cards, thus often ending up
# with a card containing photographs taken across several months or years. This
# script can be used to group them by date before the images can be archived.

for jpg_file in $(ls *.JPG *.jpg); do

    date_taken="$(identify -verbose $jpg_file | grep DateTimeOriginal |\
         awk '{print $2 }' | sed 's/://g')"
    year_taken="${date_taken:0:4}"
    directory=$year_taken

    if [ ! -z "$directory" ]; then
        if [ ! -d "$directory" ]; then
            mkdir -pv "$directory"
        fi
        mv -v $jpg_file $directory
    fi
done
