##sudo apt-get install ffmpeg ubuntu-restricted-extras

ffmpeg -acodec copy -vcodec copy -ss START -t LENGTH -i ORIGINALFILE.mp4 OUTFILE.mp4

ffmpeg -acodec copy -vcodec copy -ss 0 -t 00:15:00 -i ORIGINALFILE.mp4 OUTFILE-1.mp4

**Io l'ho usato cosi'**

Voglio dividere il file coltelleria.mp4 e prendermi i primi 5 minuti

ffmpeg -acodec copy -vcodec copy -ss 0 -t 00:05:00 -i coltelleria.mp4 OUTFILE.mp4

coltelleria.mp4 rimarra' inalterato e OUTFILE.mp4 sara' solo i primi 5 minuti del file coltelleria.mp4

**O anche cosi'**

ffmpeg -i scores_quartetto_n14.mp4 -ss 32:31 -to 38:51 -c copy 7.mp4

**Sia chiaro che funziona anche con gli mp3**

ffmpeg -acodec copy -vcodec copy -ss 00:00:14.99 -t 00:30:00 -i 1.mp3 1_new.mp3

Qui ho tagliato l'orribile musichetta iniziale del "Terzo Anello" che introduce i libri letti "Ad alta voce"

**E anche con gli mkv**

ffmpeg -ss 15 -t 30 -i input.mkv -acodec copy -vcodec copy output.mkv
