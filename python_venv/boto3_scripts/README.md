This folder contains Python and shell scripts. 
The goal is to enable users to run pip3 packages that are not supported in some situations by certain operating systems like macOS, Linux, or Windows. 
To achieve this, you can create a Python virtual environment, install the required packages within the virtual environment, and then run your Python scripts

# Folder Structure

├── simple.py
└── venv_py_script.sh

# Execution method,
1. Clone the repository
2. Navigate to the folder
3. Change the script file permissions to make it executable by the user:
$ chmod +x venv_py_script.sh
4. Execute the shell script
./venv_py_script.sh
5. During execution, the script will prompt the user to provide inputs. Once the user provides the feedback, the script will continue from there,
   


