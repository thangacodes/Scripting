#!/bin/bash

echo "The script is executed at:" $(date)
basic_check(){
    terraform fmt
    terraform validate
}
dev_plan(){
    terraform plan --var-file modules/dev/${ENV}.tfvars
}
prd_plan(){
    terraform plan --var-file modules/prd/${ENV}.tfvars
}
dev_apply(){
    terraform apply --var-file modules/dev/${ENV}.tfvars -auto-approve
}
prd_apply(){
    terraform apply --var-file modules/dev/${ENV}.tfvars -auto-approve
}
read -p "Enter the env in which you'd like to provision services:" ENV
echo "You have entered the environment is:" $ENV
if [[ $ENV == "dev" ]];
then
basic_check
dev_plan
dev_apply
elif [[ $ENV == "prd" ]];
then
basic_check
prd_plan
prd_apply
else
echo "You need to choose the right environment:"
fi
