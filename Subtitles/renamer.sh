#The aim is to adapt the name of the .mp4 to the name of the .srt

######PRELIMINARY CHECKS###################
#remove spaces
#for file in *.mp4; do echo "$file" `echo $file | tr ' ' '_'`; done
#for file in *.mp4; do echo "$file"; done
#just print the files' name
#check the replacement pattern. Syntax is ${variable/pattern_to_match/sostitution_to_do}
#for file in *.mp4; do echo "After Replacement:" ${file/Hannibal_S/hannibal_s}; done 
#for file in *.mp4; do echo "After Replacement:" ${file/E/e}; done 
#for file in *.mp4; do echo "After Replacement:" ${file/_BRRip_x264_720p-NPW/}; done 

################GO################################
#for file in *.mp4; do mv "$file" `echo $file | tr ' ' '_'`; done
for file in *.mp4; do mv $file ${file/Hannibal_S/hannibal_s}; done 
for file in *.mp4; do mv $file ${file/E/e}; done 
for file in *.mp4; do mv $file ${file/_BRRip_x264_720p-NPW/}; done

#Praticamente, per ogni file, sostituisce Hannibal_S con hannibal_s ecc...
