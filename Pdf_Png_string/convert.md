convert *.png output.pdf # Crea un unico pdf: ogni png occupera' una singola pagina del pdf 

# Puoi anche assemblare un'unica pagina con diverse immagini
convert *.jpg -append output.jpg 

+append li appende in orizzontale 

-background #ffffff (background bianco)

Da pdf a png

convert -density 150 accordo_diminuito-crop.pdf -quality 90 -background white -flatten output.png

```
for f in *.pdf; do f=$(echo $f| sed 's/.pdf//');convert -density 150 $f.pdf -quality 90 -background white -flatten  -trim $f.png; done
```
Aggiungere spazio bianco a png

convert output.png -background white -flatten output2.png
