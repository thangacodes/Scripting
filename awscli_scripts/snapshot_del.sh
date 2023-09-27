#!/bin/bash
echo "Script starts at :" $(date '+%Y/%m/%d %H:%M:%S')

read -p "Enter the environment you wanted to perform:" ENVIRON
echo "You are working Environment is: " ${ENVIRON}
read -p "Enter the application server like APACHE or WEBLOGIC or DBM:" SERVICE
echo "You wanted to work on service is: " ${SERVICE}

snapshot=("snap-0yzsd" "snap-0huj")
echo -e "Checking conditional statements to proceed further"
read -p "would like to proceed with this operation, say YES or NO :" ANS
echo "You've entered input as: " $ANS
if [[ $ANS == [Yy][Ee][Ss] ]];
then
for s in ${snapshot[@]};
do
echo "Deleting the snapshot is: " $s
aws ec2 delete-snapshot --snapshot-id $s
done
elif [[ $ANS == [Nn][Oo] ]];
then
echo "You chosen as NO option, pls try.."
else
echo "Nothing can't be peformed"
fi
