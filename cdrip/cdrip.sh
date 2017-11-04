#!/bin/bash

# This script reads the audio CD currently in the CD-ROM drive, extracts all
# tracks as wav files in the current folder and subsequently compresses them
# into mp3 files. Tracks that cannot be extracted due to dust or scratches on
# the CD surface will be skipped. The conversion to mp3 is done using variable
# bit rate with best possible quality (average around 240 kbs).

cdparanoia -B -l -X

for wav_file in $(ls *.wav); do
  lame -q 0 -v -V 0 $wav_file ${wav_file%.*}.mp3
done

