#!/bin/bash

if [ $# -lt 1 ]; then
  echo 1>&2 "$0: not enough arguments - Please insert the name of the main file and its include file"
  exit 2
fi

newMain=$1.cpp
index=2;

if [ $# -gt 1 ] && [[ $1 = "-i" ]]; then
	newMain=src/$2.cpp
	index=3;
fi

# Exit if main already exist
if test -f $newMain; then
  echo "$newMain file already exist"
  exit 1
fi

for ((i = $index; i <= $#; i++ )); do
  echo "#include \"${!i}.hpp\"" >> $newMain
done

templateMain=~/generate_cpp_files/template_main.cpp

cat $templateMain >> $newMain

echo "$newMain is created"
