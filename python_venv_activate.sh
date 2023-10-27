#!/bin/bash

get_date(){
        echo $(date '+%Y-%m-%d %H:%M:%S')
}
prRed(){
  echo -e "\033[91m$1..."
}
prGreen(){
  echo -e "\033[92m$1..."
}
prYellow(){
  echo -e "\033[93m$1..."
}
prBlue(){
  echo -e "\033[94m$1..."
}
prPink(){
  echo -e "\033[95m$1..."
}

prRed
  echo "The script executed at:" $(get_date)

prGreen
  echo "Script is to Activate/Deactivte Python Virtual environment..."

prYellow
echo "Checking pip verson..."
pip --version
prBlue
echo "Virtual Environment creation in progres..."
python3 -m venv project-git
python3 -m venv project-jira
prPink
echo "Activating Venv in this machine..."
source project-jira/bin/activate
prRed
echo "On the fly writing a script..."
cat << EOF > hello.py
print("This is called advance concept in Python function. We use input, return, output in Python Functions...")
print("This is called advance concept in Python Function. We use input, return, output")
def plus(num1, num2):
    add = num1 + num2
    return(add)
def minus(num1, num2):
    sub = num1 - num2
    return(sub)
def multipl(num1, num2):
    mul = num1 * num2
    return(mul)

print(f"The addition of two number is:", plus(5,10))
print(f"The substraction of two number is:", minus(5,10))
print(f"The multiplication of two number is:", multipl(5,10))
EOF
sleep 2
ls -lrt
prGreen
echo "Executing python script..."
ls -lrt
python3 hello.py
prYellow
echo "Jira package Is exist or not"
pip list | grep jira
prBlue
echo "Jira package installation in progress..."
pip install jira
prPink
echo "greping Jira package"
pip list | grep jira
prRed
echo "Deactivating Venv in this machine ********"
deactivate
exit

