#!bin/bash

df -H | awk '{ print $1 " " $2}' | while read output;
do
  usage = $(echo output | awk '{ print $1}' | cut -d '%' -f1)
  file = $(echo output | awk '{ print $2}')
  if [$usage -ge 90]
  then 
    echo "CRITICAL $file"
  fi  
done
