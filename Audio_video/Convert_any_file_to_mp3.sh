for f in *.ram; do
  mplayer -playlist $f -ao pcm:file=${f%.ram}.wav
  #Funaziona, ma chi mette una vita a convertire!
  #A questo punto, essendo passati da ram a wav, puoi passare da was a mp3
  lame -V 1 ${f%.ram}.wav ${f%.ram}.mp3
  rm $f
done

