number="$1"
#Initialize the shell variables you are going to use
output=0
i=1
firstIndex=0
secondIndex=1
#Extract the nuber of digits/characters
len=`echo ${#number}`
arrayOfDigits[len]=""
arrayOfNumbers[len-1]=""
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
k=0
while (firstIndex<len-2 && secondIndex<len-1) do
	arrayOfNumber[k] =(($arrayOfDigits[secondIndex]*10)+($arrayOfDigits[firstIndex]))
	k +=1
done

#Display the output 
printf "\n\n"
echo '********************************************'
echo '                  OUTPUT                    '
echo '********************************************'
echo 'Your entered : ' $number
echo 'The output is : ' $output
