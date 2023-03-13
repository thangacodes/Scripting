#!/bin/sh

v1='A'
v2='B'

function localfun(){
	local v1='C'
	v2='D'
	echo "Inside localfun(), v1: $v1, v2: $v2"
}
echo "Before I call the function localfun(), v1: $v1, v2: $v2"
localfun
echo "After I call the function localfun(), v1: $v1, v2: $v2"
