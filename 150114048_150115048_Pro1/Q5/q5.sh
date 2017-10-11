number="$1"
len=`echo ${#number}`
i=0
arrayOfDigits=""
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
	echo "=$sum"

