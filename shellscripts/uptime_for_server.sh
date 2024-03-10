#!/bin/bash
showuptime(){
    Red=$'\e[1:31m'
    Green=$'\e[1:32m'
    Blue=$'\e[1:33m'
    up=$(uptime -p | cut -c4-)
    since=$(uptime -s)

echo " $Blue This machine has been up for $up "
echo " $Red It has been running since $since "
}
showuptime
