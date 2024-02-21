############# While loop script ###########


# ps -a  ( a- all terminal)

# vim ps.sh
#!/bin/bash
PING_STATE=0
while [ $PING_STATE = 0 ]
do
     ps -a | grep ping > dev/null
     PING_STATE=$?
     sleep 3
done


### This script is checking in a system, whether the ping command value is equal to '0'. If we stopped ping, the script will terminate with number '1'
