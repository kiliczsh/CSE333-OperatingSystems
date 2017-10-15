#get argument
input="$1"
#remove zeros if exist at the beginning
number=$(echo $input | sed 's/^0*//')
#if the number is one digit case
if [ $number -lt 10 ] 
then
	echo "$number=$number"
	exit 1
fi
#get the length of input 
len=`echo ${#number}`
i=0
arrayOfDigits=""
#get the digits of input
while [ $number -gt 0 ]
do
	arrayOfDigits[$i]=$(( $number % 10 ))
	number=$(( $number / 10 ))
	i=$((i+1))
done
#variables to keep index
first=1
second=0
limit=$(($len-1))
sum=0
#print all of the new numbers and print numbers
while [ "$first" -lt "$len" ]
do
	if [ "$first" -lt "$limit" ]
	then
    		echo -ne "${arrayOfDigits[$second]}""${arrayOfDigits[$first]}+"
	else
		echo -ne "${arrayOfDigits[$second]}""${arrayOfDigits[$first]}"
	fi
		let sum=$((sum+(($((${arrayOfDigits[$second]}*10))+$((${arrayOfDigits[$first]}))))))
	        first=$(($first + 1))
	       	second=$(($second + 1))
done
#print sum of numbers	
echo "=$sum"
