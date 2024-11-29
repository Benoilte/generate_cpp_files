#!/bin/bash


# Check if number of argument is one or two

if [ $# -lt 1 ]; then
  echo 1>&2 "$0: not enough arguments - Please insert the name of the Class"
  exit 2
elif [ $# -gt 2 ]; then
  echo 1>&2 "$0: too many arguments - Only insert the name of the Class"
  exit 2
fi

# If argument is equal to 2 check the value of the first one 
# Set variable according if arg count is 1 or 2
if [ $# -eq 2 ]
	then
		option=$1
		if [[ $1 = "-i" ]]
			then
				incFolder="inc/"
				srcFolder="src/"
				mkdir -p $incFolder
				mkdir -p $srcFolder
				class=$2
				newHeaderFile=$incFolder$class.hpp
				newSourceFile=$srcFolder$class.cpp
			else
				echo wrong first argument only '-i option exist'
				exit 0
		fi
	else
		class=$1
		newHeaderFile=$class.hpp
		newSourceFile=$class.cpp
fi

# Set variable in order create appropriate class
templateClass="Template"
capitalTemplateClass=${templateClass^^}
capitalClass=${class^^}
templateHeaderFile=~/generate_cpp_class/Template.hpp
templateSourceFile=~/generate_cpp_class/Template.cpp

# Exit if class name already exist
if test -f $newHeaderFile; then
  echo "$newHeaderFile class already exist"
  exit 1
fi

if test -f $newSourceFile; then
  echo "$newSourceFile class already exist"
  exit 1
fi

cp $templateHeaderFile $newHeaderFile
cp $templateSourceFile $newSourceFile


# replace "TEMPLATE" header guard by capitalized name of the class
sed -i s/$capitalTemplateClass/$capitalClass/g $newHeaderFile 

# replace "Template" word by the name of the class
sed -i s/$templateClass/$class/g $newHeaderFile $newSourceFile

# Display Class creation
echo "$newHeaderFile is created"
echo "$newSourceFile is created"
