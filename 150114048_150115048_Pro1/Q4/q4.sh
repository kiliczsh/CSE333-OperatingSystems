#ls -lh
largestFile=`find . -maxdepth 1 -type f -exec basename {} \; | sort -n | head -1`

smallestFile=`find . -maxdepth 1 -type f -exec basename {} \; | sort -n --reverse | head -1`

 BASEDIR=$(pwd)
 echo -en "\r"
 mkdir -p "$BASEDIR/"largest/
 mkdir -p "$BASEDIR/"smallest/
 mv  "$BASEDIR/$largestFile" "$BASEDIR/"largest/
 mv  "$BASEDIR/$smallestFile" "$BASEDIR/"smallest/
 echo "$largestFile is moved to the directory largest"
 echo "$smallestFile is moved to the directory smallest"

#ls -lh
