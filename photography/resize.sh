#!/bin/bash

# This script resizes all JPG photographs in the current directory by reducing
# each dimension by 50%. The resulting image is 25% the size of the original
# image and will overwrite it. It is pretty easy to change the parameter to
# the 'convert' utility to reduce the size even further if required.
#
# Modern cameras are capable of producing images multiple megabytes in size
# that are difficult to share with other people across the web. This script
# makes resizing and sharing photographs much easier.

for jpg_file in $(ls *.JPG *.jpg); do
  convert $jpg_file -resize 50% $jpg_file
done

