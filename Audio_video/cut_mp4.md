ffmpeg -acodec copy -vcodec copy -ss START -t LENGTH -i ORIGINALFILE.mp4 OUTFILE.mp4

ffmpeg -acodec copy -vcodec copy -ss 0 -t 00:15:00 -i ORIGINALFILE.mp4 OUTFILE-1.mp4

ffmpeg -acodec copy -vcodec copy -ss 00:15:00 -t 00:15:00 -i ORIGINALFILE.mp4 OUTFILE-2.mp4

ffmpeg -acodec copy -vcodec copy -ss 00:30:00 -t 00:15:00 -i ORIGINALFILE.mp4 OUTFILE-3.mp4

**Io l'ho usato cosi'**

Voglio dividere il file coltelleria.mp4 e prendermi i primi 5 minuti

ffmpeg -acodec copy -vcodec copy -ss 0 -t 00:05:00 -i coltelleria.mp4 OUTFILE.mp4

coltelleria.mp4 rimarra' inalterato e OUTFILE.mp4 sara' solo i primi 5 minuti del file coltelleria.mp4
