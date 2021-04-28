## Checking in the clients machine, whether the internet is working or not.


############# Script starts here  #########################

#!/bin/bash
ping -c2 8.8.8.8 > /dev/null
if [ $? -eq 0]; then
    echo " server up"
fi

## note: /dev/null (it will go and save in memory and it gets clear. As it's a temporary memory)
