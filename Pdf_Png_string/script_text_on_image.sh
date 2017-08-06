#for d in $(find ./ -maxdepth 2 -type d); do
#    #echo $d
#    for i in $d/*.png; do
#    echo $i
#    done
#done


#i=sciame_elettromagnetico.png

function text_adder {
i=$1
dest=${i%.png}_textAdded.png
echo $dest
x=$2
y=$3 #0 is top left
testo="CMS Internal"

pixel_dim=$(identify $1 | awk -F" " '{print $3}')
##echo $pixel_dim
x_size=$(echo $pixel_dim | awk -F"x" '{print $1}')
y_size=$(echo $pixel_dim | awk -F"x" '{print $2}')
x_size=`echo $x*$x_size | bc -l`
y_size=`echo $y*$y_size | bc -l`
#echo $x_size
#echo $y_size
#echo $i
#echo $dest
#
#
convert -pointsize 20 -fill black -draw "text $x_size,$y_size \"$testo\"" $i $dest
}

text_adder $1 $2 $3 
