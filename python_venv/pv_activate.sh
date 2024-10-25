#!/bin/bash
echo "Script to activate Python3 venv on linux/macOS machine.."

read -p "Please enter the venv name: " venv_name 
echo "you have entered your virutal env name as: " $venv_name
python3 -m venv "$venv_name"
source "$venv_name/bin/activate"
echo "Your Python virtual environment '$venv_name' is activated."
