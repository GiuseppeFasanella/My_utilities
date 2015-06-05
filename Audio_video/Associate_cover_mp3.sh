#! /bin/bash
#This script allows you to make a video, starting from a .mp3 and a .jpg
ffmpeg -loop 1 -i classificazione-voci-big.jpg -i test.mp3 -shortest -vcodec mpeg2video -qscale 1 -acodec copy -y 1.mpg

## Combine more than 1 file
#cat 1.mpg 2.mpg 3.mpg > full.mpg

##Or re-encode them in another format
#ffmpeg -i concat:'1.mpg|2.mpg|3.mpg' -c:v libx264 -preset slow -crf 24 -c:a libfaac -aq 100 full.mp4
