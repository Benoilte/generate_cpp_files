#!/bin/bash

# Check if number of argument is one or two

if [ $# -lt 1 ]; then
  echo 1>&2 "$0: not enough arguments - Please insert the name of the Class"
  exit 2
fi

if [ $1 = "-i" ]; then
	index=2
	incFolder="inc/"
	srcFolder="src/"
	mkdir -p $incFolder
	mkdir -p $srcFolder
else
	index=1
	incFolder=""
	srcFolder=""
fi

for ((i = $index; i <= $#; i++ )); do
	# Set variable in order create appropriate class
	class="${!i}"
	templateClass="Template"
	capitalTemplateClass=${templateClass^^}
	capitalClass=${class^^}
	templateHeaderFile=~/generate_cpp_files/Template.hpp
	templateSourceFile=~/generate_cpp_files/Template.cpp
	newSourceFile=$srcFolder$class.cpp
	newHeaderFile=$incFolder$class.hpp

	# Exit if class name already exist
	if test -f $newHeaderFile || test -f $newSourceFile; then
		echo "$newHeaderFile or $newSourceFile class already exist"
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
done
