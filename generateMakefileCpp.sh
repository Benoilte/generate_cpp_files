#!/bin/bash

# Check if number of argument is one

if [ $# -gt 3 ]; then
  echo 1>&2 "$0: too many arguments -  (<-i>) <program_name> <string of src file>"
  exit 2
fi

# Exit if Makefile already exist
if test -f "Makefile"; then
  echo "Makefile already exist"
  exit 1
fi

makefile=Makefile
sourceInRoot=~/generate_cpp_files/src_inc_in_root.mk
sourceInFolder=~/generate_cpp_files/src_inc_in_folder.mk

if [[ $1 = "-i" ]]; then
	cp $sourceInFolder $makefile
	if [ $# -eq 3 ]; then
		programName=$2
		sourceFiles=$3
	fi
else
	cp $sourceInRoot $makefile
	if [ $# -eq 2 ]; then
		programName=$1
		sourceFiles=$2
	fi
fi

echo Makefile is create

# If argument is equal to 3 replace the corrresponding value in the makefile
if [ $# -eq 3 ] || ([ $# -eq 2 ] && [ "$1" != "-i" ]); then
	placeholderName="placeholder_name"
	placeholderSourceFile="placeholder_src_file"
	# replace "placeholder_name" by the name of the programme
	sed -i "s/$placeholderName/$programName/" $makefile
	echo "$placeholderName in your Makefile is replace by $programName"
	# replace "placholder_source_file" word by the source file string
	sed -i "s/$placeholderSourceFile/$sourceFiles/" $makefile
	echo "$placeholderSourceFile in your Makefile is replace by '$sourceFiles'"
fi
