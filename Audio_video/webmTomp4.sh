ffmpeg -i 07_Nenia_prima.webm -r 10 -cpu-used 5 -c:v libx264 -crf 20 -c:a aac -strict experimental -loglevel error 07_Nenia_prima.mp4

##C'e' un comando molto piu' semplice Ma per lettori piu' scemi il file non e' letto correttamente
ffmpeg -i input.webm -qscale 0 out.mp4
