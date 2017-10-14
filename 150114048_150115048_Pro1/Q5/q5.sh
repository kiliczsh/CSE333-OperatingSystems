#get argument
number="$1"
#if the number is one digit case
if [ $number -lt 10 ] 
then
	echo "$number=$number"
	exit 1
fi
#
len=`echo ${#number}`
i=0
arrayOfDigits=""
#get the digits
while [ $number -gt 0 ]
do
	arrayOfDigits[$i]=$(( $number % 10 ))
	number=$(( $number / 10 ))
	i=$((i+1))
done

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
		let sum=$((sum+(($((${arrayOfDigits[$second]}*10))+$((${arrayOfDigits[$first]}))))))
	        first=$(($first + 1))
        	second=$(($second + 1))
	else
		echo -ne "${arrayOfDigits[$second]}""${arrayOfDigits[$first]}"
		let sum=$((sum+(($((${arrayOfDigits[$second]}*10))+$((${arrayOfDigits[$first]}))))))
        	first=$(($first + 1))
        	second=$(($second + 1))
	fi
done
#print sum of numbers	
echo "=$sum"

