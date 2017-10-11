ARG1_MISSING_ERROR=55
ARG2_MISSING_ERROR=56
ARG3_MISSING_ERROR=57
NOFILE=58
if [ -z "$1" ] 
  then
    echo "3 arguments are missing"
exit $ARG1_MISSING_ERROR
fi

if [ -z "$2" ]
  then
    echo "2 arguments are missing"
exit $ARG2_MISSING_ERROR
fi

if [ -z "$3" ]
  then
    echo "1 arguments are missing"
exit $ARG1_MISSING_ERROR
fi

if [ ! -f "$1" ]       # Check if file exists.
then
  echo "File \"$1\" does not exist."
  exit $E_NOFILE
fi


sed -i -e "s/$2/$3/g" $1

 number_Of_Common=$(grep -o '\<'$3'\>' $1 | wc -l)

echo "All $number_Of_Common occurrences of '$2' in '$1' has changed with '$3' "

