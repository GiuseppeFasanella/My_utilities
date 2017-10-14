#first install all the things:
##sudo apt-get install flac ffmpeg mp3splt libav-tools shntool

# Okay first lets do an MP3:
# input files:
#   --> $1.ape
#   --> $1.cue
# (there are other options, like bitrate, but this is just the bare bones)
avconv -i $1.ape $1.mp3

# Now, split the MP3 file using the CUE file
# this will produce an mp3 file for each track in the same directory
mp3splt -a -c $1.cue $1.mp3

#If you  prefer APE format uncomment this
# Next example: FLAC!
# convert APE to FLAC:
##ffmpeg -i $1.ape $1.flac

# Now, split your FLAC file. Credits for method go to the arch linux wiki:
# https://wiki.archlinux.org/index.php/CUE_Splitting
##shnsplit -f $1.cue -t "%n %t" -o flac $1.flac 

# one more note, you can go directly from APE -> FLAC with shnsplit because that
# tool is fucking awesome, but you need the "mac" encoder. This is a pain in the ass to get
# on ubuntu and ffmeg has the ability to convert APE, so I just show that way here. 
