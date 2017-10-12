IS_NOT_DIRECTORY=85
ARG1=$1


if [[ -z "$1" ]]; then
    
	echo "$PWD using"
	

elif [[ -d $ARG1 ]]; then
	echo "$ARG1 using"
    directory="$1"
	cd "$directory"
	

else
    echo "$ARG1 is not directory"
    exit $IS_NOT_DIRECTORY
fi





	shopt -s extglob
	rm -f !(*.sh|*.c|"makefile"|"Makefile")






