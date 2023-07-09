#!/bin/bash

echo "This script is to display return values from called function"

function display()
{
	x[5]=60
}
x=(10 20 30 40 50)
display ${x}
echo "value of a is:" ${x[@]}
