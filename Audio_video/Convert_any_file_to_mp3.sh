mplayer -playlist perchisuonalacampana20.ram -ao pcm:file=stream.wav
#Funaziona, ma chi mette una vita a convertire!
#A questo punto, essendo passati da ram a wav, puoi passare da was a mp3
mv stream.wav file.wav
f=file.wav
lame -V 1 $f ${f%.wav}.mp3; done
rm *.wav
