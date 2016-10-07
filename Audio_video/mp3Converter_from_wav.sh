cd $1
#ASSICURATI CHE I NOMI NON CONTENGANO SPAZI
for f in *; do mv "$f" `echo $f | tr ' ' '_'`; done
for f in *.wav;do lame -V 1 $f ${f%.wav}.mp3; done
rm *.wav
cd ..
#Nell'ordine: sostituisce gli spazi bianchi con _; converte in mp3; rimuove i .wav
#NON FUNZIONA CON i .ram e gli inutili .wma (windows media audio)
Nel caso generale usa

https://github.com/GiuseppeFasanella/My_utilities/blob/master/Audio_video/Convert_any_file_to_mp3.sh
