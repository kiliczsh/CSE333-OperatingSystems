number="$1"
#Initialize the shell variables you are going to use
output=0
i=1
firstIndex=0
secondIndex=1
#Extract the nuber of digits/characters
len=`echo ${#number}`
echo ""
arrayOfDigits[len]=""
arrayOfNumbers[len-1]=""
index=0

#if [len<=2 ] then
#	echo "errorrr"
#	exit 0
#fi

#Read the input contents digit by digit
while [ $i -le $len ]
do
#Extract a digit
    digit=`echo $number|cut -c$i`
    arrayOfDigits[index]=$digit
    echo "${arrayOfDigits[@]}"
    index=`expr $index + 1`
#Add it to the output variable
    output=`expr $output + $digit`
    i=`expr $i + 1`
done
k=0
while (firstIndex<len-1 && secondIndex<len-1 ) do
	echo "$k"
	echo "${arrayOfDigits[secondIndex]} is second index"
	echo ""
	echo "${arrayOfDigits[firstIndex]} is first index"
	echo ""	
#arrayOfNumber[k] =(($arrayOfDigits[secondIndex]*10)+($arrayOfDigits[firstIndex]))
	k +=1
	echo $index
	echo ""
done
echo ""
#Display the output 
printf "\n\n"
echo '********************************************'
echo '                  OUTPUT                    '
echo '********************************************'
echo 'Your entered : ' $number
echo 'The output is : ' $output
