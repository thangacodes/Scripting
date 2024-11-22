#!/bin/bash

echo "script to execute shell and python together after venv created..."

read -r -p "Enter the folder name you want to use for the venv: " FOLDER

echo "Your input on creating a folder name is: " $FOLDER

python3 -m venv $FOLDER

if [ -d "$FOLDER" ]; then
echo "Venv folder $FOLDER is exist..."
else
echo "Venv folder $FOLDER does not exist.."
exit 1
fi
source "$FOLDER/bin/activate"
echo "Installing required pip packages like boto3, pytz..."
pip install --upgrade pip
pip3 install boto3
pip3 install pytz
echo "execute python script now..."
python3 simple.py
sleep 5
echo "deactivating venv, post script execution..."
deactivate
sleep 5
echo "remove the folder that we created for venv: " $FOLDER
rm -rf $FOLDER
exit 0
