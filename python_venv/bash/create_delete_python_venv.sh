#!/bin/bash
show_date() {
    echo "Script execution time is: $(date '+%d-%m-%Y %H:%M:%S')"
    echo "Script is to create a virtual environment using Python3"
}
executor_detail() {
    USER=$(whoami)
    echo "Who is the executor of this job:" $USER
}
check_python_is_exist() {
    echo "Checking if 'Python3' is installed or not:"
    python3 --version &>/dev/null
    if [[ $? -ne 0 ]]; then
       echo "Python 3 is not installed. Installing Python3..."
       if command -v apt-get &>/dev/null; then
            sudo apt-get update && sudo apt-get install -y python3
            echo "Python 3 installation complete!"
        elif command -v yum &>/dev/null; then
            sudo yum install -y python3
            echo "Python 3 installation complete!"
        elif command -v dnf &>/dev/null; then
            sudo dnf install -y python3
            echo "Python 3 installation complete!"
        elif command -v brew &>/dev/null; then
            brew install python3
            echo "Python 3 installation complete!"
        else
            echo "Package manager not supported. Please install Python 3 manually."
            exit 1
        fi
    else
       echo "Python 3 is already installed."
    fi
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
    echo "Looks good, as all the files exist in the directory:" $(pwd)
    echo 
    elif [[ $USER_INPUT == "no" ]]; then
    echo "Please abort, since user input is 'no'.."
    else 
    echo "Please choose ONLY 'yes' or 'no' as an option.."
    fi 
}
show_date
executor_detail
check_python_is_exist
pyenv_creation
deactivate_and_remove_venv
exit 0
