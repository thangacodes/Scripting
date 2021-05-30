#### While loop script in shell script

#!/bin/bash
echo -n "Enter your name: "
while read name
do
 echo -n "Enter your number: "
 read number
 echo "Your name is $name and your number is $number"
done
