number="$1"
#Initialize the shell variables you are going to use
output=0
i=1
#Extract the nuber of digits/characters
len=`echo ${#number}`
arrayOfDigits[len]=""
index=0
#Read the input contents digit by digit
while [ $i -le $len ]
do
#Extract a digit
    digit=`echo $number|cut -c$i`
    arrayOfDigits[index]=$digit
    echo "${arrayOfDigits[@]}"
    let "index++"
#Add it to the output variable
    output=`expr $output + $digit`
    i=`expr $i + 1`
done

while (firstIndex<len-2 && secondIndex<len-1) do
	
done

#Display the output 
printf "\n\n"
echo '********************************************'
echo '                  OUTPUT                    '
echo '********************************************'
echo 'Your entered : ' $number
echo 'The output is : ' $output
