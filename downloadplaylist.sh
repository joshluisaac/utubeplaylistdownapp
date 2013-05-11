#!/bin/bash
# Written by Joshua Uzo Luisaac
# joshluisaac@gmail.com


domainname="http://www.youtube.com"
plsURL="http://www.youtube.com/course?list=EC46F0A159EC02DF82"

if [ -f playlistdownload.txt ]
then fileexist=1
else
curl ${plsURL} | grep "/watch?v=" | cut -d\" -f2 | cut -d\& -f1 | grep "/watch?v=" > playlistdownload.txt
fi

cat playlistdownload.txt | while read videoURL

do
video=`echo $videoURL | cut -d\= -f2`
echo $video

	if [ -f $video.* ]
	   then fileexist=1
	else echo Downloading From "$videoURL".........
	 youtube-dl $domainname"$videoURL"
	fi
done





