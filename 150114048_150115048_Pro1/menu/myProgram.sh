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
		./q1.sh "text1.txt"
		;;
        "Delete files")
		cd ..
                cd Q2/
                chmod +x *.*
                ./q2.sh
                ;;

        "Substitute words")
		echo "you chose choice 3"
                cd ..
                cd Q3/
                chmod +x *.*
		printf "\nEnter a word to be replaced:\n"
		read var1
		printf "\nEnter a word to replace:\n"
		read var2
                ./q3.sh "text3.txt" $var1 $var2
                ;;
	"Organize directory")
		cd ..
                cd Q4/
                chmod +x *.*
                ./q4.sh
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
