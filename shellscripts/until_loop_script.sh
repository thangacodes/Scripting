#!/bin/sh
i=0
until [ $i -gt 10 ]
do
	echo "The value of 'i' is:" $i
	((i++))
done
