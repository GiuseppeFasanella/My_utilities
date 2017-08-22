for f in $(ls);
do f=$(echo ${f}| cut -f1 -d ".");
cp ${f}.png ${f}_full.png;
convert ${f}_full.png[1039x777+279+27] ${f}.png;
done

#Prende tutti i file presenti nella cartella.                                                                                                                                   
#Lavora solo sul nome e taglia l'estensione.                                                                                                                                    
#Fai una copia di sicurezza.                                                                                                                                                    
#Taglia il contorno con convert. La sintassi e' widthxheight+x+y (che prendi da gimp, provando a selezionare la parte che ti interessa)

################### More flexible structure
f=/home/gfasanel/Immagini/test/probe_ptDataMc_icut1_
#.png                                                                                                                                                                           
#pixel_dim=$(identify $1 | awk -F" " '{print $3}')                                                                                                                              
#ls $f                                                                                                                                                                          

pixel_dim=$(identify $f.png | awk -F" " '{print $3}')
x_size=$(echo $pixel_dim | awk -F"x" '{print $1}')
y_size=$(echo $pixel_dim | awk -F"x" '{print $2}')

echo $pixel_dim
width=$2
height=$3
x=$4
y=$5

width=`echo $width*$x_size | bc -l`
height=`echo $height*$y_size | bc -l`
x_size=`echo $x*$x_size | bc -l`
y_size=`echo $y*$y_size | bc -l`
echo $width
echo $height
echo $x_size
echo $y_size
#cp ${f}.png ${f}_full.png;                                                                                                                                                     
convert ${f}.png[${width}x${height}+${x_size}+${y_size}] ${f}_test.png
