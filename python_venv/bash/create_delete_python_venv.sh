#!/bin/bash
show_date() {
echo "Script execution time is: $(date '+%d-%m-%Y %H:%M:%S')"
echo 
echo "Script is to create a virtual environment using Python3"
echo
}
executor_detail() {
USER=$(whoami)
echo "Executor name is:" $USER
echo
}
pyenv_creation() {
    PYENV_PATH="/Users/td/Desktop/hcv/bash_scripts"
    echo "Python3 'VENV' will be getting created on this path:" ${PYENV_PATH}
    echo 
    read -p "Please provide the name of the virtual env you would like to create: " NAME
    echo "User entered 'VENV' name as: $NAME"
    python3 -m venv ${PYENV_PATH}/${NAME}
    sleep 3
    source ${PYENV_PATH}/${NAME}/bin/activate
    echo "About to install 'boto3' and it's version checking, 'awscli && ansible' and then 'upgrading pip version to the latest'.."
    echo 
    echo "Install 'boto3' package..."
    echo
    pip3 install boto3
    echo
    echo "Checking boto3 version.."
    echo 
    pip3 show boto3
    echo 
    echo "Install 'ansible' package"
    echo
    pip3 install ansible
    echo 
    echo " 'ansible version' checking"
    echo 
    ansible --version
    echo 
    echo "Install 'awscli' package"
    pip3 install awscli
    echo
    echo "Checking 'awscli' version.."
    aws --version
    echo 
    echo "Upgrading pip package"
    echo 
    pip install --upgrade pip
    echo
    echo "Checking 'pip version'"
    pip --version
    echo
}
deactivate_and_remove_venv() {
    read -p "Would you like to deactivate the Python3 venv? (yes/no):" USER_INPUT
    if [[ $USER_INPUT == "yes" ]]; then
    echo "Good to deactivate the virtual env: ${NAME}"
    deactivate
    echo "successfully deactivated the python3 venv.."
    sleep 1
    echo
    echo "Removing folder that was created for 'venv setup':" $NAME 
    echo 
    rm -rf ${PYENV_PATH}/${NAME}
    echo "Listing the files in the dir:" $PYENV_PATH
    echo 
    ls -lrt $PYENV_PATH
    echo 
    echo "looks good.."
    echo 
    elif [[ $USER_INPUT == "no" ]]; then
    echo "Please abort, since user input is 'no'.."
    else 
    echo "Please choose ONLY 'yes' or 'no' as an option.."
    fi 
}
show_date
executor_detail
pyenv_creation
deactivate_and_remove_venv
exit 0
