#!/bin/bash
echo "The script was executed at:" $(date '+ %d-%m-%Y %H:%M:%S')
echo 
echo "Script is control terraform commands like apply,destroy, plan and validate ...."
echo
## alias setup
alias tfinit='terraform init'
alias tffmt='terraform fmt --recursive'
alias tfvalidate='terraform validate'
alias tfplan='terraform plan'
alias tfapply='terraform apply --auto-approve'
alias tfdestroy='terraform destroy --auto-approve'

# Variables
script_path="/Users/murugat/Desktop/hcv/evidence_identity_s3"

tf_init(){
    echo "terraform init in progress.."
    echo 
    tf_files_location=$script_path
    cd $tf_files_location
    echo "You are on the path:" $(pwd)
    echo
    echo "listing out the files in the current working directory:" $(pwd)
    echo
    ls -ltr
    tfinit
}
tf_fmt(){
    echo "terraform format in progress.."
    echo 
    tf_files_location=$script_path
    cd $tf_files_location
    echo "You are on the path:" $(pwd)
    echo
    echo "listing out the files in the current working directory:" $(pwd)
    echo 
    ls -ltr
    tffmt
}
tf_validate(){
    echo
    echo "terraform validate in progress.."
    echo 
    tf_files_location=$script_path
    cd $tf_files_location
    echo "You are on the path:" $(pwd)
    echo
    echo "listing out the files in the current working directory:" $(pwd)
    echo
    ls -ltr
    tfvalidate
}

tf_plan(){
    echo "terraform plan in progress.."
    echo 
    tf_files_location=$script_path
    cd ${tf_files_location}
    echo "You are on the path:" $(pwd)
    echo
    echo "listing out the files in the current working directory:" $(pwd)
    echo
    tfplan
}
tf_apply(){
    echo "terraform apply in progress.."
    echo
    tf_files_location=$script_path
    read -p "Do you want to proceed? (yes/no):" USER_INPUT
    echo "User entered the input as:" $USER_INPUT
    sleep 2
    if [[ ${USER_INPUT} == "yes" || ${USER_INPUT} == "YES" ]]; then
        echo "You approved, hence tf apply will begin shortly"
    elif [[ ${USER_INPUT} == "no" || ${USER_INPUT} == "NO" ]]; then
        echo "You are declined to proceed further.."
        return 1
    fi
    # check if there any .tf files in the location
    if ls "$tf_files_location"/*.tf 1> /dev/null 2>&1; then
    cd "$tf_files_location"
    echo "You are on the path:" $(pwd)
    echo
    echo "listing out the files in the current working directory:" $(pwd)
    echo
    tfapply
    else 
       echo "terraform apply does not execute"
    fi
}
tf_destroy(){
    echo "terraform destroy in progress.."
    echo 
    tf_files_location=$script_path
    read -p "Do you want to proceed? (yes/no):" USER_INPUT
    echo "User entered the input as:" $USER_INPUT
    sleep 2
    if [[ ${USER_INPUT} == "yes" || ${USER_INPUT} == "YES" ]]; then
        echo "You approved, hence tf destroy will begin shortly"
    elif [[ ${USER_INPUT} == "no" || ${USER_INPUT} == "NO" ]]; then
        echo "You are declined to proceed further.."
        return 1
    fi
    # check if there any .tf files in the location
    if ls "$tf_files_location"/*.tf 1> /dev/null 2>&1; then
    cd "$tf_files_location"
    echo "You are on the path:" $(pwd)
    echo
    echo "listing out the files in the current working directory:" $(pwd)
    echo
    tfdestroy
    else 
       echo "terraform apply does not execute"
    fi
}
echo
read -p "What operation would you like to perform now(tfinit, tffmt, tfvalidate, tfplan, tfapply, tfdestroy): " OPERATION
echo "User want to perform: " $OPERATION
if [[ ${OPERATION} == "tfinit" ]]; then
    echo "Proceeding with terraform Initialization..."
    tf_init
elif [[ ${OPERATION} == "tffmt" ]]; then
    echo "Proceeding with terraform format..."
    tf_fmt
elif [[ ${OPERATION} == "tfvalidate" ]]; then
    echo "Proceeding with terraform validate..."
    tf_validate
elif [[ ${OPERATION} == "tfplan" ]]; then
    echo "Proceeding with terraform plan..."
    tf_plan
elif [[ ${OPERATION} == "tfapply" ]]; then
    echo "Proceeding with terraform apply..."
    tf_apply
elif [[ ${OPERATION} == "tfdestroy" ]]; then
    echo "Proceeding with terraform destroy..."
    tf_destroy
else 
   echo "Invalid option. Please choose one of the following: (tfinit, tffmt, tfvalidate,tfplan, tfapply, tfdestroy)"
fi
