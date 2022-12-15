#!/bin/bash

check_process() {
  [[ "$1" = "" ]]  && return 0
  [[ `pgrep -f $1` ]] && echo " "$1" $(tput setaf 2)STARTED$(tput sgr0)" && return 1 || return 0
}
  echo "$ts Checking Jenkins Service..."
  check_process "jenkins"
  [ $? -eq 0 ] && echo " jenkins     : $(tput setaf 1;tput rev)STOPPED$(tput sgr0)"

exit
