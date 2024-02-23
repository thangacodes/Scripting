#!/bin/bash

myfunc(){
echo "Your script name is: $0"
echo "Hello, how are you $1"
echo "you are invoking/calling function name is: $FUNCNAME"
}

myfunc2(){
echo "Your script name is: $0"
echo "Hello, I am shell $2"
echo "you are invoking/calling function name is: $FUNCNAME"
}

myfunc $1
myfunc2 $2

## When you execute this script, scriptname.sh $arg1 $arg2
