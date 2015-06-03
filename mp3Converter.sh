cd $1
#ASSICURATI CHE I NOMI NON CONTENGANO SPAZI
for f in *; do mv "$f" `echo $f | tr ' ' '_'`; done
for f in *.wav;do lame -V 1 $f ${f%.wav}.mp3; done
rm *.wav
cd ..
#Nell'ordine: sostituisce gli spazi bianchi con _; converte in mp3; rimuove i .wav
##Merge pdf
# pdftk 1.pdf 2.pdf 3.pdf cat output 123.pdf
