#!bin/bash
# Read from the file file.txt and output the tenth line to stdout.
len=$(cat file.txt | wc -l)
if [ $len > 10 ]; then  
   cat file.txt | head -10 | tail -1
else 
   echo ""
fi
