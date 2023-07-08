#!/bin/bash

read -p "Enter the environment you wanted to perform: " ENVIRON
echo "You are working Environment is: " ${ENVIRON}
read -p "Enter the service like Apache or Weblogic: " SERVICE
echo "You wanted to work on service is: " ${SERVICE}
echo "SCRIPT TO DE_REGISTER AMI & DELETE SNAPSHOT FOR ${SERVICE} IN ${ENVIRON} "
echo "Script starts at :" $(date '+%Y/%m/%d %H:%M:%S')

echo "Begin with ami de-registration..."
ami=("ami-0cc2c9dbaac6f6a99" "ami-0cd45gv13lki89ert9")
echo "Cross checking array of variables for ${SERVICE} ami's..."
echo ${ami[@]}
for i in ${ami[@]};
do
echo "De-registering ami is: " $i
aws ec2 deregister-image --image-id $i
done
sleep 2
echo "Begin with snapshot deletion..."
snapshot=("snap-0c2b6874f17d85dcb" "snap-0123bgt673ddef789")

echo "Cross checking array of variables snapshot's for ${SERVICE}.."
echo ${snapshot[@]}
for s in ${snapshot[@]};
do
echo "Deleting the snapshot is: " $s
aws ec2 delete-snapshot --snapshot-id $s
done

