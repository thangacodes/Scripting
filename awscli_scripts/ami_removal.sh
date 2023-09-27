#!/bin/bash
echo "Script starts at :" $(date '+%Y-%m-%d %H:%M:%S')
read -p "Enter the environment you wanted to perform:" ENVIRON
echo "You are working Environment is: " ${ENVIRON}
read -p "Enter the application server like APACHE or WEBLOGIC or DBM:" SERVICE
echo "You wanted to work on service is: " ${SERVICE}
echo -e "Checking conditional statements to proceed further"
read -p "would like to proceed with this operation, say YES or NO :" ANS
ami=("ami-0drty" "ami-0tred")
echo "You've entered input as: " $ANS
if [[ $ANS = [Yy][Ee][Ss] ]];
then
echo ${ami[@]}
for i in ${ami[@]};
do
echo "De-registering ami is: " $i
aws ec2 deregister-image --image-id $i
done
elif [[ $ANS = [Nn][Oo] ]];
then
echo "You chosen option as NO.Nothing can't be tried.."
else
echo "exit from the script"
fi

