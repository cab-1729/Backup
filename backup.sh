#!/bin/bash
cd $(dirname $0) #working directory=file directory
mkdir root #store state of root
#mirror relevant files in root
cp -r /boot root/boot
echo copied boot
cp -r /etc root/etc
echo copied etc
mkdir root/usr
cp -r /usr/bin root/usr/bin
echo copied usr/bin
cp -r /usr/include root/usr/include
echo copied usr/include
cp -r /usr/lib root/usr/lib
echo copied usr/lib
cp -r /usr/lib32 root/usr/lib32
echo copied usr/lib32
cp -r /usr/local root/usr/local
echo copied usr/local
#cp -r /usr/share root/usr/share
#echo copied usr/share
echo copied relevant files in usr
mkdir root/var
cp -r /var/lib root/var/lib
echo copied var/lib
mkdir root/var/spool
cp -r /var/spool/anacron root/var/anacron
echo copied var/spool/anacron
cp -r /var/spool/cron root/var/cron
echo copied var/spool/cron
cp -r /var/tmp root/var/tmp
echo copied var/tmp
: '
Yes, I could have used rsync to make it faster, but...
In order to gain the speed advantages from rsync I would have to keep root mirror the on my computer at all times.
I do not wish to do so because I intend to implement a backup solution that does not occupy memory on my computer long term. (which is why I am using gofile in the first place).
Hence I delete the mirror once the zip file has been made
Backup is not something I want to think about unless things have gone wrong.
'
filename=$(date +"%d-%m-%YT%T.zip")
zip -r $filename root
echo zipped file
source ./vars.sh
#wait for connection
echo waiting for connection ...
while [[ "$(nmcli | sed '1q;d')" == "wlp0s20f0u10u3: disconnected" ]]
do
	sleep 30
done
#uploading backup
echo uploading ...
curl -F token=$accountToken -F folderId=$folderId -F file=@$filename  "https://$(curl "https://api.gofile.io/getServer" | cut -d \" -f 10).gofile.io/uploadFile"
echo removing temporary files
rm -rf root
rm $filename
echo done
