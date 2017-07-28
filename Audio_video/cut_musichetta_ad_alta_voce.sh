for f in *.mp3; do
    ffmpeg -i $f -ss 00:21  -c copy ${f%.mp3}_reduced.mp3
    #La musichetta orribile finisce al 21-mo secondo                                                                                                                            
done
