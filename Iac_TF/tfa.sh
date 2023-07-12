#!/bin/bash
echo "The script execution time is:" $(date '+%Y-%m-%d %H:%M:%S')
echo "Bash script is to execute Terraform commands as an Automation..."
TC="Terraform Command"
TFI="terraform init"
TFT="terraform fmt"
TFV="terraform validate"
TFP="terraform plan"
TFA="terraform apply --auto-approve"
echo "Variables are in the script is..."
echo ${TC}
echo ${TFI}
echo ${TFT}
echo ${TFV}
echo ${TFP}
echo ${TFA}
read -p "Enter what operation you'd like to perform now: " OPS
echo "You've entered ${TC} is..." ${OPS}
if [[ ${OPS} == "terraform validate" ]]; 
then
    echo "Executing ${TC} now...:" ${TFV}
${TFV}
elif [[ ${OPS} == "terraform plan" ]]; 
then
    echo "Executing...:" ${TFP}
${TFP}
else
echo "None of the ${TC} Executed.."
exit
fi
