ARG1_MISSING_ERROR=55 #error code
ARG2_MISSING_ERROR=56 #error code
ARG3_MISSING_ERROR=57 #error code
NOFILE=58 #error code
if [ -z "$1" ] 
  then
    echo "3 arguments are missing" #show error
exit $ARG1_MISSING_ERROR
fi

if [ -z "$2" ]
  then
    echo "2 arguments are missing" #show error
exit $ARG2_MISSING_ERROR #exit with error code
fi

if [ -z "$3" ]
  then
    echo "1 argument are missing" #show erro
exit $ARG1_MISSING_ERROR #exit with error code
fi

if [ ! -f "$1" ]  # Check  file exists.
then
  echo "File \"$1\" does not exist."
  exit $E_NOFILE
fi


sed -i -e "s/$2/$3/g" $1

 number_Of_Common=$(grep -o '\<'$3'\>' $1 | wc -l) #change word according to argument

if [[ $number_Of_Common -eq 0 ]]
then
	echo "there is no '$2' in text file."
exit
fi

echo "All $number_Of_Common occurrences of '$2' in '$1' has changed with '$3' "
