ARG_MISSING_ERROR=404
#file location for numbers
input="$1"
  if [ -z "$1" ] #check input 
  then
     echo "argument is missing" #show error
  exit $ARG_MISSING_ERROR #exit with error code
  fi
	while IFS= read -r var
	do
		#counting for numbers to print$
  		for (( number = 0 ; number< $var ; number++ )) 
  		do
        		printf "*" #symbol to print 
  		done
        	printf "\n" #new line for next number
	done < "$input" #end of file read
