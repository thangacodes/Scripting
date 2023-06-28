#!/bin/sh

log(){
    echo $(date) "$@"
}

while true; do
echo "Checking number of open ports...."

log " Number of open connections: " $(netstat -tlnp | wc -l)
sleep 2
done

