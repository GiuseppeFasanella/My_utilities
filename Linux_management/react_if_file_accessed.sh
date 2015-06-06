#!/bin/bash

## you can run a script in the background>
## check_access.sh & (so you have the control of the shell)
ref="$HOME/files/ref"
touch $ref
#It creates a ref file
reftime=$(stat -c %X $ref)
#that gives you the reference time (in seconds from the 1st of January 1970)
while ls $HOME/files/*.log > /dev/null 2>&1 ##What's this 2>&1 ??
do
    for f in $(ls $HOME/files/*.log)
    do
	fileref=$(stat -c %X $f)#it reads the access time 
	if (( fileref > reftime )) ; then
	    rm -f $f
	fi
    done
    sleep 10
done
rm -f $ref
echo -e "All files have been read and now deleted\n"
exit 0
