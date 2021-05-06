### Simple variable values checking using conditional statements


############################## Script starts here ###################
#!/bin/bash
a=10
b=20

if [ $a == $b ]
then

      echo "a is equal to b"
fi

if [ $a != $b ]; then
       echo "a is not equal to b"
fi
