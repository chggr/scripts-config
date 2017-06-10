#!/bin/bash

# This script renames all JPG photographs and associated files (RAW, XMP, etc)
# in the current directory. It uses a simple naming scheme, i.e. 00001.jpg,
# 00002.jpg, etc which can easily be changed to something more elaborate.
#
# Cameras typically store images using the DSC****.jpg pattern and the numbers
# are rarely continuous as some images might have been deleted in camera or
# during post processing. Running this script ensures that images and related
# files follow the same consistent naming pattern before they can be archived.

counter=1

for jpg_file in $(ls *.JPG *.jpg); do

  jpg_filename=${jpg_file%.*}

  for file in $(ls $jpg_filename.*); do
    mv $file `printf "%05d" $counter`.${file#*.}
  done

  let "counter += 1"
done

