	if [ "$1" != "" ]; then #if command have argument
   		#baseDir = "$1"
		echo "Script location: ${baseDir}"
	else #if command doesn't have argument
		baseDir=$(dirname $0)
		echo "Script location: ${baseDir}"
	fi
