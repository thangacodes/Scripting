#!/bin/bash
echo "The script is execute at:" $(date '+%Y.%m.%d %H:%M:%S')
echo "Colorcoding in shell/bash script"
function color_coding() {
    echo "Color Coding"
    echo -e "\e[1;32m Green  color"
    echo -e "\e[1;33m Yellow color"
    echo -e "\e[1;34m Blue   color"
    echo -e "\e[1;35m Violet color"
    echo -e "\e[1;36m Purple color"
    echo -e "\e[1;37m White  color"
}
colorcoding
