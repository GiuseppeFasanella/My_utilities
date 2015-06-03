#! /bin/bash
# nodisp -> no display
# autoexit -> kill ffplay at the end of the audio file
##
#count=2; while ((count>0)); do ffplay Scrivania/Test_intervalli/1.wav -nodisp -autoexit; ((count--)); done
count=$1; while ((count>0)); do ffplay Scrivania/Test_intervalli/$2.wav -nodisp -autoexit; ((count--)); done

# with (( )) I am strictly specifying that I work with integers
