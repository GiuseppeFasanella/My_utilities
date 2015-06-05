Sulla webcam
http://www.goodbyemicrosoft.net/news.php?item.674.2
Qui ci sono un paio di soluzioni secondo me intelligenti>

http://ubuntuforums.org/showthread.php?t=1616014
http://www.len.ro/work/xubuntu-microphone-muteunmute-script/
http://ubuntuforums.org/showthread.php?t=1572140
(questo ultimo ti dice pure come creare dei bottoncini su ubuntu)


pacmd list-sources | grep alsa_input (qua ti dice quali sono i tuoi input)
e vedi anche quali sono muted. Mo secondo me, il microfono deve essere mutato

pacmd set-source-mute indice azione(=0 per attivarlo, 1 per mutarlo)

Nel mio caso, l'indice del microfono e' 2:

pacmd set-source-mute 2 0
pacmd set-source-mute 2 1
pacmd list-sources | grep muted

***************************************************************************************************************************
Bello sto scriptino, anche se si puo' migliorare perche' questo muta tutto!
#!/bin/bash
 
ACTION=1 #1 mute, 0 unmute
SCNT=$(pacmd list-sources | grep muted | wc -l)
 
MUTED=$(pacmd list-sources | grep muted | grep yes)
if [ $? == 0 ]; then
    ACTION=0
    notify-send -i microphone-sensitivity-medium "Microphone" "Unmutting $SCNT sources..."
else
    notify-send -i microphone-sensitivity-muted "Microphone" "Mutting $SCNT sources..."
fi
 
#SRC=$(seq $SCNT)
SRC=$(pacmd list-sources | grep index | cut -d':' -f2 | tr -d ' ')
 
for i in $SRC; do
    #let s=$i-1
    pacmd set-source-mute $i $ACTION
done



