#usage source RemoveEmptySpace.sh Cartella
cd $1
#Converte gli spazi in _
#Questo perche' altrimenti linux ha problemi a gestire gli spazi
for f in *; do mv "$f" `echo $f | tr ' ' '_'`; done
