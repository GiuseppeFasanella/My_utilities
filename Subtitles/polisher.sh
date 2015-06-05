######PRELIMINARY CHECKS###################

#for file in *.srt; do echo "$file"; done
#just print the files' name
#check the replacement pattern. Syntax is ${variable/pattern_to_match/sostitution_to_do}
#for file in *.srt; do echo "After Replacement:" ${file/.bdrip.x264-demand/}; done 
#for file in *.srt; do echo "After Replacement:" ${file/.s/_s}; done 

################GO################################
for file in *.srt; do mv $file ${file/.bdrip.x264-demand/}; done 
for file in *.srt; do mv $file ${file/.s/_s}; done 
#change bdrip.... -> _english

for file in *.srt; do cp $file ${file/.srt/.txt}; done 
#copy x.srt in x.txt

#remove subtitle things
for file in *.txt; 
do 
    echo $file
    sed -i '/[0-9]/d' $file
    sed -i '/-->/d' $file
    sed -i 's/<i>//' $file
    sed -i 's/<\/i>//' $file
done

#just to let you know: ${variable} is called "parameter expansion" in bash programming
#####COMANDI SED 
#Rimuove le RIGHE che contengono numeri
#Rimuove le RIGHE che contengono -->   
#SOSTITUISCE <i> con niente            
#SOSTITUISCE </i> con niente Nota che siccome / e' un carattere riservato, gli ho messo un backslah prima
#Mi piace questo polisher perche' sintetizza tutte le potenzialita' di sed (almeno quelle che servonoa me)

echo "A questo punto come ultimo tocco inserisci con emacs degli spazi bianchi sul margine sinistro della pagina, in modo da permettere la rilegatura. Per farlo usa questi trucci.
Apri il file con emacs, e incolla un rettangolo di tab sul margine sinistro del foglio. 
Perciò all'atto pratico: apri il file, Ctrl+spazio al margine  sinistro iniziale del foglio. ESC> per andare a fine pagina. 
Per incollare fai: Crtl+x poi rt stringa_da_incollare ENTER
Come stringa io incollo un bel tab (così mi fa un certo numero di spazi)"
