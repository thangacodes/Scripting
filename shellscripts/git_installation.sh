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
prPurple(){
  echo -e "\033[95m$1..."
}
prCyan(){
  echo -e "\033[96m$1..."
}

prRed 
   echo "The script is executed at:" $(get_date)
prGreen
   echo "Git installation in progress.."
   sudo yum install -y git
prYellow
   echo "Starting service.."
   sudo systemctl start git
prCyan
   echo "Checking git service status.."
   sudo systemctl status git


