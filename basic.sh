
#!/bin/bash

echo "This is thangadurai,Murugan"

sleep 2

echo "starting the second script"

echo -e  "Today's date is $(date +%x)"

sleep 2

echo "Starting the next script"

echo "Number of connected users are $(who | wc -l)"

sleep 2

echo "Value from the command line is $1"
echo "Value from the command line is $2"
echo "Value from the command line is $3"

## Note: It's a just basics on bash
