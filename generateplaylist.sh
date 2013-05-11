#!/bin/sh


loopCnt=0

rm -rf playlist.pls

rowcount=`wc -l playlistdownload.txt | cut -f1 -d\ ` 


echo "[playlist]" >> playlist.pls
echo "NumberOfEntries=$rowcount" >> playlist.pls


cat playlistdownload.txt | cut -f2 -d\= | while read i

do
	loopCnt=`expr $loopCnt + 1`
        i=`ls | grep -e $i`
	echo "File$loopCnt=$i" >> playlist.pls


done

