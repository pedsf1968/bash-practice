#/usr/bin/env bash
# Author: DOS SANTOS FACAO Paul-Emmanuel

# Exit codes
EXIT_NO_WGET=1
EXIT_DOWNLOAD_KO=2
WIDTH=20

#
DOWNLOAD_FILE_NAME="index.html"
DOWNLOAD_URL="https://mirrors.edge.kernel.org/pub/software/scm/git/"

# Verify that wget is present
which wget 1>/dev/null 2>/dev/null

if [[ $? -ne 0 ]]
then
   echo "Please install wget and retry!"
   exit $EXIT_NO_WGET
fi

if [[ -e $DOWNLOAD_FILE_NAME ]]
then
   echo "Remove old $DOWNLOAD_FILE_NAME file"
   rm -rf $DOWNLOAD_FILE_NAME
fi

wget $DOWNLOAD_URL
if [[ $? -ne 0 ]]
then
   echo "Enable to download git info from $DOWNLOAD_URL"
   exit $EXIT_DOWNLOAD_KO

fi

echo "Collecting all Git versions..."

while read line
do
   gitVersions+=( $(echo $line | sed -n '/git-\([0-9]\+\.\)\+tar.gz/p' | awk -F '"' '{ print $2 }' | cut -c 5- | awk -F '.tar.gz' '{ print $1}') )
done < index.html

counter=0
numberOfVersions=${#gitVersions[*]}

echo "The all available git versions are:"
echo $numberOfVersions
for eachVersion in ${gitVersions[*]}
do
   printf "%-*s %-*s %-*s\n" $WIDTH ${gitVersions[$counter]} $WIDTH ${gitVersions[$((counter+1))]} $WIDTH ${gitVersions[$((counter+2))]}
   counter=$((counter+3))
   if [[ $counter -ge $numberOfVersions ]]
   then
      break
   fi
done

