largestFile=`find . -maxdepth 1 -type f -exec basename {} \; | sort -n | head -1`

smallestFile=`find . -maxdepth 1 -type f -exec basename {} \; | sort -n --reverse | head -1`

echo "wait while the files are moving..."
BASEDIR=$(pwd)
 echo "largest file moving"
 mv  "$BASEDIR/$largestFile" "$BASEDIR/"largest/
 echo "smallest file moving"
 mv  "$BASEDIR/$smallestFile" "$BASEDIR/"smallest/
 echo "$BASEDIR" 
 echo "Largest ->  $largestFile"
 echo "Smallest -> $smallestFile"
echo ""
echo ""


