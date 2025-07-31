#!/bin/bash

#First we will wait, just in case Esquire is still booting.
sleep $1

# Then we will fetch the XMLTV Listings.
cd /app/work/

echo Saving XMLTV Listings to Disk
curl -o /app/work/xmltv.xml $XMLTV_LOCATION
echo Done saving XMLTV.

cd /app/linux-distribution

# Now we will convert it to CSV
./PrevueCLI convertXMLTVToListings /app/work/xmltv.xml /app/work/ 1000

# Now we will send it to Esquire
echo Sending Listings...
./PrevueCLI send ../dl.prevuecommand
echo Done Sending.

# Cleanup.
rm /app/work/xmltv.xml
rm /app/work/channels.csv
rm /app/work/programs.csv
