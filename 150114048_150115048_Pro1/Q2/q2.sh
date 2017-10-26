IS_NOT_DIRECTORY=85 #error code
ARG1=$1 #first argument


if [[ -z "$1" ]]; then #there is no input use current directory
 
	echo "\nCurrent directory is -> $PWD <- using for deleting files.\n" #echo info

elif [[ -d $ARG1 ]]; then #if there is argument correctly use this
	echo "$ARG1 using"
    directory="$1"
	cd "$directory"

else
    echo "$ARG1 is not directory" #show error and exit with error code
    exit $IS_NOT_DIRECTORY
fi
	shopt -s extglob
	rm -i !(*.h|q2.sh|*.c|"makefile"|"Makefile") #if there are files, remove all except that .c , .sh , makefile or Makefile. 
