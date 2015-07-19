ffmpeg -acodec copy -vcodec copy -ss START -t LENGTH -i ORIGINALFILE.mp4 OUTFILE.mp4

ffmpeg -acodec copy -vcodec copy -ss 0 -t 00:15:00 -i ORIGINALFILE.mp4 OUTFILE-1.mp4

ffmpeg -acodec copy -vcodec copy -ss 00:15:00 -t 00:15:00 -i ORIGINALFILE.mp4 OUTFILE-2.mp4

ffmpeg -acodec copy -vcodec copy -ss 00:30:00 -t 00:15:00 -i ORIGINALFILE.mp4 OUTFILE-3.mp4
