function text_cover {
i=$1
dest=${i%.png}_textCover.png
echo $dest
x1=$2 #top left
y1=$3 #top left
x2=$4 #bottom right
y2=$5 #bottom right

pixel_dim=$(identify $1 | awk -F" " '{print $3}')
##echo $pixel_dim
x_size=$(echo $pixel_dim | awk -F"x" '{print $1}')
y_size=$(echo $pixel_dim | awk -F"x" '{print $2}')
x1=`echo $x1*$x_size | bc -l`
y1=`echo $y1*$y_size | bc -l`
x2=`echo $x2*$x_size | bc -l`
y2=`echo $y2*$y_size | bc -l`

echo $x_size
echo $y_size
#convert $i -strokewidth 0 -fill white -draw "rectangle 66,50 200,150 " $dest 
convert $i -strokewidth 0 -fill white -draw "rectangle $x1,$y1 $x2,$y2 " $dest

if [[ $6 = "--mv" ]] #comparison between string
then 
mv $dest $i
fi
}

text_cover $1 $2 $3 $4 $5 $6 
#convert test.png -strokewidth 0 -fill "rgba( 255, 215, 0 , 0.5 )" -draw "rectangle 66,50 200,150 " test_2.png
#convert test.png -strokewidth 0 -fill white -draw "rectangle 66,50 200,150 " test_2.png
