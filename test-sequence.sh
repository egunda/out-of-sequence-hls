#!/bin/sh

while :
do
	curl -D playlist1.hdr -s 'https://example.tv/playlist360.m3u8' -o playlist1
	curl -D playlist2.hdr -s 'https://example/playlist360.m3u8' -o playlist2

	echo "---------------------";
	MSN1=`cat playlist1 | grep 'EXT-X-MEDIA-SEQUENCE' | awk -F':' '{print $2}'`
	MSN2=`cat playlist2 | grep 'EXT-X-MEDIA-SEQUENCE' | awk -F':' '{print $2}'`

	echo "MSN1 - $MSN1\nMSN2 - $MSN2";

	if [ "$MSN2" -lt "$MSN1" ]
	then
	    echo "MSN went back in time"
	    break;
	fi
	rm playlist1 playlist2
	rm playlist1.hdr playlist2.hdr
done

cat playlist1.hdr
cat playlist2.hdr
