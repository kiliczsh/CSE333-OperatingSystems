BASEDIR=$(pwd)
PS3='Please select an option: '
options=("Print asterisks" "Delete files" "Substitute words" "Organize directory" "Print sum of numbers"  "Exit")
select opt in "${options[@]}"
do
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
                ./q3.sh "text3.txt" apple apple
                ;;
	"Organize directory")
		echo "you chose choice 4"
                cd ..
                cd Q4/
                ./q4.sh "text.txt"
                ;;
        "Print sum of numbers")
		echo "you chose choice 5"
                cd ..
                cd Q5/
                ./q5.sh 123456
                ;;
        "Exit")
            break
            ;;
        *) echo invalid option;;
    esac
done
