Se hai un unico file .flac e il cue associato:
```
sudo apt-get install cuetools shntool flac
cuebreakpoints '<cue file>' | shnsplit -o flac '<audio flac file>'  
```

Se hai un ape file e il cue associato

