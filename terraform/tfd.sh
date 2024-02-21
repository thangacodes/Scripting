#!/bin/bash
echo "The script execution time is:" $(date '+%Y-%m-%d %H:%M:%S')
echo "Bash script to execute Terraform commands as an Automation..."
TC="Terraform Command"
TFI="terraform init"
TFT="terraform fmt"
TFV="terraform validate"
TFR="terraform refresh"
TFD="terraform destroy --auto-approve"
echo "Variables are in the script is..."
echo ${TC}
echo ${TFI}
echo ${TFT}
echo ${TFV}
echo ${TFR}
echo ${TFD}
read -p "Enter what operation you'd like to perform now: " OPS
echo "You've entered ${TC} is..." ${OPS}
if [[ ${OPS} == "terraform refresh" ]]; 
then
    echo "Executing ${TC} now...:" ${TFR}
${TFR}
elif [[ ${OPS} == "terraform destroy --auto-approve" ]]; 
then
    echo "Executing...:" ${TFD}
${TFD}
else
echo "None of the ${TC} Executed.."
exit
fi
