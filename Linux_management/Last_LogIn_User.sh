#! /bin/bash

for U in $( lastlog | grep -v "Nessun"| awk '{ print $1 }'| tail -n +2)
do
  NOW=$(date +%s) #current date in seconds
  USR=$(lastlog | grep -v 'Nessun' | awk '{ print $1,":",$4,$5,$8 }'|grep $U)
  USRDATE=$(echo $USR | cut -d":" -f2)
  #86400 seconds make a day
  (( USRDATE = $(date --date "$USRDATE" +%s) / 86400 ))
  (( NOW = NOW / 86400 ))
  (( DAYS = NOW - USRDATE ))
  echo "The user $U: logged in $DAYS days ago"
done
