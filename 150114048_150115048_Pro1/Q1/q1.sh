#file location for numbers
input="$1"
#while loop to read all of the file lines
while IFS= read -r var
do
  for (( number = 0 ; number< $var ; number++ )) #counting for numbers to print symbol
  do
  	printf "*" #symbol to print 
  done
  	printf "\n" #new line for next number
done < "$input" #end of file read
