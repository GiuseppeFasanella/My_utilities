#usage: source cropper_pdf.sh ottava_diretta. (the dot is not even necessary, but it comes out when you tab from the terminale)
name=$1
name=${name/./} #Sostituisce un eventuale punto con niente

echo $name
pdfcrop $name.pdf 
cp $name-crop.pdf $name-edit.pdf

#At this point you can use inkscape or Xournal and quickly edit your .pdf adding lines and comments
