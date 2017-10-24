#!/bin/bash

# Author: Mehmet Cumali Demir <150114048>
# Author: Muhammed Kılıç <150115048>
# 
# cd 150114048_150115048_Pro1/menu/
# Make this file executable:
# chmod +x myProgram.sh
#
# Run as
# ./myProgram.sh
# follow instructions

#print the menu interface
BASEDIR=$(pwd)
PS3='Please select an option: '
options=("Print asterisks" "Delete files" "Substitute words" "Organize directory" "Print sum of numbers"  "Exit")
select opt in "${options[@]}" #take option and evaluate
do
    case $opt in
        "Print asterisks")
		cd ..
		cd Q1/
		chmod +x *.*
		printf "\nEnter a file:\n"
		read var
		./q1.sh  $var
		;;
        "Delete files")
		cd ..
                cd Q2/
                chmod +x *.*
		printf "\nEnter a file location:\n"
                read var
                ./q2.sh $var
                ;;

        "Substitute words")
		echo "you chose choice 3"
                cd ..
                cd Q3/
                chmod +x *.*
		printf "\nEnter a file to select:\n"
		read var1
		printf "\nEnter a word to be replaced:\n"
		read var2
		printf "\nEnter a word to replace:\n"
		read var3
                ./q3.sh $var1 $var2 $var3
                ;;
	"Organize directory")
		cd ..
                cd Q4/
                chmod +x *.*
		printf "\nEnter a directory:\n"
		read currentDirectory
                ./q4.sh currentDirectory
                ;;
        "Print sum of numbers")
                cd ..
                cd Q5/
                chmod +x *.*
		printf "\nEnter a number to make calculations:\n"
		read var
                ./q5.sh $var
                ;;
        "Exit")
		seq 1 15000 | while read i; do echo -en "\r$i"; done
		echo -en "\rSee you next time..."
		echo ""
            break
            ;;
        *) echo invalid option;;
    esac
done
