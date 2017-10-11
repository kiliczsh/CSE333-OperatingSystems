seq 1 10000 | while read i; do echo -en "\r$i"; done
echo -en "\r"
BASEDIR=$(pwd)
PS3='Please select an option: '
options=("Print asterisks" "Delete files" "Substitute words" "Organize directory" "Print sum of numbers"  "Exit")
select opt in "${options[@]}"
do
seq 1 10000 | while read i; do echo -en "\r$i"; done
echo -en "\r"
    case $opt in
        "Print asterisks")
		echo "you chose choice 1"
		cd ..
		cd Q1/
		./q1.sh "text1.txt"
		;;
        "Delete files")
		echo "you chose choice 2"
		cd ..
                cd Q2/
                #./q2.sh
                ;;

        "Substitute words")
		echo "you chose choice 3"
                cd ..
                cd Q3/
		printf "\nEnter a word to be replaced:\n"
		read var1
		printf "\nEnter a word to replace:\n"
		read var2
                ./q3.sh "text3.txt" $var1 $var2
                ;;
	"Organize directory")
		cd ..
                cd Q4/
                ./q4.sh
                ;;
        "Print sum of numbers")
                cd ..
                cd Q5/
		printf "\nEnter a number to make calculations:\n"
		read var
                ./q5.sh $var
                ;;
        "Exit")
		seq 1 10000 | while read i; do echo -en "\r$i"; done
		echo -en "\rSee you next time..."
		echo ""
            break
            ;;
        *) echo invalid option;;
    esac
done
