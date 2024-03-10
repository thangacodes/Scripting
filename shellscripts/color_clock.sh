#!/bin/bash
echo "Script executed at: $Red $(date '+%Y-%m-%d %H:%M:%S')"
echo "Digital watch"
Red=$'\e[1:31m'
Green=$'\e[1:32m'
Blue=$'\e[1:33m'

while true
do
clear
echo $Red $(date +%T)
sleep 1s
done
