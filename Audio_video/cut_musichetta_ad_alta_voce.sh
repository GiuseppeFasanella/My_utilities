for f in *.mp3; do
    #La musichetta iniziale orribile finisce al 21-mo secondo
    #La musichetta finale orribile inizia a 31 secondi dalla fine del brano

    #echo "`ffprobe -v 0 -show_entries format=duration -of compact=p=0:nk=1 $f`" #-->total length
    #echo "`ffprobe -v 0 -show_entries format=duration -of compact=p=0:nk=1 $f` -31" | bc --> total length meno 31 secondi
    reduced_length=$(echo "`ffprobe -v 0 -show_entries format=duration -of compact=p=0:nk=1 $f` -31" | bc)
    #echo $reduced_length
    ffmpeg -i $f -ss 00:21 -to $reduced_length -c copy ${f%.mp3}_reduced.mp3 

done

#Quando sei sicuro che hai tagliato bene i tuoi file, rinominali togliendo il _reduced.mp3 alla fine
#for f in *.mp3; do
#    mv $f ${f%_reduced.mp3}.mp3
#done
