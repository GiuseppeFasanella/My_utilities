##
##H.264 encoder (libx264) e' necessario
##sudo apt-get install libavcodec-extra-54 on Ubuntu 14.04 

##ffmpeg -i input.webm -c:v libx264 -crf 20 -c:a aac -strict experimental out.mp4
##The CRF controls the quality, where 18–28 are sensible choices. Lower is better, and 23 is default. 

###Questo ha funzionato correttamente e il lettore piu' cretino che ho e' riuscito a leggerlo
ffmpeg -i 07_Nenia_prima.webm -r 10 -cpu-used 5 -c:v libx264 -crf 20 -c:a aac -strict experimental -loglevel error 07_Nenia_prima.mp4

##C'e' un comando molto piu' semplice Ma per quel lettore cretino il file non e' letto correttamente (va a scatti)
ffmpeg -i input.webm -qscale 0 out.mp4
