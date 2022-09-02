#!/bin/bash
cd ~/scripts/getPrayerTimes
if [ "$button" = "1" ]; then
	st -T FLOATING -g 40x32+790+250 -e /home/abdulwahab/scripts/getPrayerTimes/get-times-this-month.sh
fi
TIME=$(date "+%H:%M" | sed 's/:/;/' | awk '{print $1}' | cut -f1 -d":" | sed 's/;/:/')
ALLPRAYERTIMES=$(grep ^$(date +%d) "$(date "+%B %Y") Little Ferry Prayer Times.txt" | awk '{ for (i=NF; i>1; i--) printf("%s ",$i); print $1; }')
let "namaz = 6"
NEXT="NONE"
GETNEXT="false"
OUTPUT=""
LASTNAMAZFROMBOTTOM=""
OLD_I=""
FINALOUTPUT=""
for i in $(echo $ALLPRAYERTIMES); do
	if [ ! $i == 12 ]
	then
		if [ "$GETNEXT" = "true" ]; then
			OUTPUT="$OUTPUT Next: $LASTNAMAZFROMBOTTOM"
			FINALOUTPUT="$FINALOUTPUT $OUTPUT"
			break
		fi
		let "namaz = $namaz-1"
		STATUS=$(echo $TIME | ./compareTimes.out $i )
		if [ "$STATUS" = "2" ]; then
			#echo piped in is greater if 2, if 3 they are equal
			GETNEXT="true"
			LASTNAMAZFROMBOTTOM="$OUTPUT"
			OUTPUT="$(printf "$(grep ^$namaz allNamazNames.txt | awk '{print $2}') $(echo $i | ./convertArmyToAMorPM2.out) ")"
			let "namaz = $namaz+1"
			OUTPUT="$OUTPUT$(printf " |  $(grep ^$namaz allNamazNames.txt | awk '{print $2}') $(echo $OLD_I | ./convertArmyToAMorPM2.out) ")  "
			FINALOUTPUT="$FINALOUTPUT $OUTPUT"
			break
		fi
	fi
	OLD_I=$i
done
if [ "$FINALOUTPUT" != "$(cat lastNamaz.txt)" ]
then
	echo "$FINALOUTPUT" > lastNamaz.txt
	st -T FLOATING -g 40x5+1000+650 -e ./play-adhan.sh # spawn a floating terminal at the bottom-right corner (pixel position 1000,650 that's 40 columns wide by 5 rows tall), then run the script "play-adhan.sh" (which just plays an .mp3 audio file)
fi
echo "$FINALOUTPUT"
