#Rip with Mplayer and encode with LAME

for i in *.wma ; do mplayer -vo null -vc dummy -af resample=44100 -ao pcm:waveheader "$i" && lame -m j -h --vbr-new -b 160 audiodump.wav -o "`basename "$i" .wma`.mp3"; done; rm -f audiodump.wav


libavformat version 53.21.1 (external)
Mismatching header version 53.19.0
