#!/bin/bash

# Check if number of argument is one

if [ $# -lt 1 ]; then
  echo 1>&2 "$0: not enough arguments - Please insert one option root or folder"
  exit 2
elif [ $# -gt 1 ]; then
  echo 1>&2 "$0: too many arguments - Please insert one option root or folder"
  exit 2
fi

# Exit if Makefile already exist
if test -f "Makefile"; then
  echo "Makefile already exist"
  exit 1
fi

makefile=Makefile
makefileInRoot=~/generate_cpp_class/src_inc_in_root.mk
makefileInFolder=~/generate_cpp_class/src_inc_in_folder.mk

if [[ $1 = "root" ]]
	then
		cp $makefileInRoot $makefile
        echo Makefile is create
elif [[ $1 = "folder" ]]
	then
		cp $makefileInFolder $makefile
        echo Makefile is create
	else
		echo Error: Wrong argument
		exit 0
fi
