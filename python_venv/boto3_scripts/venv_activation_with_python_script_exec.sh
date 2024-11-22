#!/bin/bash

echo 
echo "Bash script to invoke a Python script after creating a virtual environment..."
echo 
read -r -p "Enter the name of the folder you want to use for the virtual environment: " FOLDER
echo "Your input for the folder name is: " $FOLDER
echo 
python3 -m venv $FOLDER
if [ -d "$FOLDER" ]; then
echo "virtual environment folder $FOLDER is exist..."
else
echo "virtual environment folder $FOLDER does not exist.."
exit 1
fi
source "$FOLDER/bin/activate"
echo "Installing required pip packages like boto3, pytz..."
echo "Upgrading the pip package: "
pip install --upgrade pip
echo "Installing the boto3 pip package: "
pip3 install boto3
echo "Installing the pytz pip package: "
pip3 install pytz
echo "Invoking the Python script simple.py now: "
python3 simple.py
echo "Deactivating the virtual environment after script execution: "
deactivate
echo "Remove the folder we created for the virtual environment: " $FOLDER
rm -rf $FOLDER
exit 0
