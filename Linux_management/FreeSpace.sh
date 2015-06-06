#! /bin/bash

SPACE=$(df -h| awk '{print $5}'|grep -v Dispon.|sort -n|tail -1|cut -d % -f1)

case $SPACE in
    [1-6]*|?) #your usage is 1-6 followed by a single caracter or 1 single caracter
	MESSAGE="All is quiet"
	;;
    [7-9]?)
	MESSAGE="You are using $SPACE % of the disk"
	;;
esac

echo $MESSAGE
