* Da png a pdf

In caso di problemi con la policy
<policy domain="coder" rights="read | write" pattern="PDF" />
in /etc/ImageMagick-7/policy.xml
```
convert *.png output.pdf # Crea un unico pdf: ogni png occupera' una singola pagina del pdf 
# Puoi anche assemblare un'unica pagina con diverse immagini
convert *.jpg -append output.jpg 
# +append li appende in orizzontale 
# -background #ffffff (background bianco)
```
* Da pdf a png

```
convert -density 150 accordo_diminuito-crop.pdf -quality 90 -background white -flatten -trim output.png
#trim serve per tagliare lo spazio bianco intorno
#Ora trim e' abbastanza aggressivo e taglia tutto (proporio tutto) lo spazio bianco attorno.
#cosi' metti una piccola cornice bianca di 10x100 pixel attorno alla tua figura
convert $f.png -bordercolor White -border 10x100 $f.png

```

```
for f in *.pdf; do f=$(echo $f| sed 's/.pdf//');convert -density 150 $f.pdf -quality 90 -background white -flatten -trim $f.png; done
```

* Se il pdf ha piu' pagine e tu vuoi convertirle tutte
```
convert -density 150 $file.pdf -quality 90 -background white -flatten -trim ${file}%d.png
```
