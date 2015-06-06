#! /bin/bash
 
for F in $(ls) #for F in the output of ls
do
    [ ! -f $F ] && continue #This means: if it's not a file: continue
    DT=$(stat $F | grep Accesso | tail -1 | cut -d ":" -f2)
    #stat gives you info about the file (last access etc)
    echo "The file $F is $(du -b $F | cut -f1) bytes and was last accessed $DT"
done
