for f in $(ls);
do f=$(echo ${f}| cut -f1 -d ".");
cp ${f}.png ${f}_full.png;
convert ${f}_full.png[1039x777+279+27] ${f}.png;
done

#Prende tutti i file presenti nella cartella.                                                                                                                                   
#Lavora solo sul nome e taglia l'estensione.                                                                                                                                    
#Fai una copia di sicurezza.                                                                                                                                                    
#Taglia il contorno con convert. La sintassi e' widthxheight+x+y (che prendi da gimp, provando a selezionare la parte che ti interessa)
