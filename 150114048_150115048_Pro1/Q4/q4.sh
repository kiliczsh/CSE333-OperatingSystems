#du -k * | sort -n
#du -k * | sort -n --reverse

#find the files just in the current directory and get the largest file
largestFile=`find . -maxdepth 1 -type f -exec basename {} \; | sort -n | head -1` 
#find the files just in the current directory and get the smallest file
smallestFile=`find . -maxdepth 1 -type f -exec basename {} \; | sort -n --reverse | head -1`
#get the current directory
BASEDIR=$(pwd)
echo -en "\r"
#check if the directories exist
mkdir -p "$BASEDIR/"largest/
mkdir -p "$BASEDIR/"smallest/
#move the files to given directories
mv  "$BASEDIR/$largestFile" "$BASEDIR/"largest/
mv  "$BASEDIR/$smallestFile" "$BASEDIR/"smallest/
#echo the movements
echo "$largestFile is moved to the directory largest"
echo "$smallestFile is moved to the directory smallest"
#du -k * | sort -n
#du -k * | sort -n --reverse
