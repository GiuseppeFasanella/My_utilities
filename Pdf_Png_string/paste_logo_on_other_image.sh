#92.82 x pixel
#17 y pixel
composite -geometry +92.82+17  logo.png to_use.png  newfile.png
#eventualmente se logo.png e' troppo grande
convert -resize 50% logo.png logo_2.png
