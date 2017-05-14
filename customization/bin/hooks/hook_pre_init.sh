#!/bin/sh

# Setting up a few things during BootUp.
#    - Enable content folder on /opt/piratebox/share/content
#    - Swap WWW folder with LibraryBox ones
#    

# Hook for modifcation stuff before 
#          piratebox/bin/install  ... part2 
# is run.

if [ !  -f $1 ] ; then
  echo "Config-File $1 not found..."
  exit 255
fi

#Load config
. $1

# You can uncommend this line to see when hook is starting:
 echo "------------------ Running $0 ------------------"


## Exchange WWWW
echo "Doing www folder exchange..."
mv    $WWW_FOLDER $PIRATEBOX_FOLDER/www_old
mv    $PIRATEBOX_FOLDER/www_librarybox $WWW_FOLDER
cp -rv  $PIRATEBOX_FOLDER/www_old/cgi-bin $WWW_FOLDER/cgi-bin


$PIRATEBOX_FOLDER/bin/ftp_enable.sh generate

