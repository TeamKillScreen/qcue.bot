#!/bin/bash

while true
do

	NAME=`cat names.txt | awk 'BEGIN { OFS="\t"; srand() } { print rand(), $0 }' | sort -n | cut -f2- | head -1 | awk '{print $1}'`

	NUMBER=$RANDOM
	let "NUMBER %= 99"

	JOIN="http://www.qcue.me/api/incoming_sms?to=447860033153&from=44551234567"$NUMBER"&content=BACN&msg_id=AB_12345"
	REG="http://www.qcue.me/api/incoming_sms?to=447860033153&from=44551234567"$NUMBER"&content=NAME+"$NAME"&msg_id=AB_12345"

	echo "Queing "$NAME" with number "$NUMBER

	`curl $JOIN > /dev/null 2>&1`
	`curl $REG > /dev/null 2>&1`

	SLEEP=$RANDOM
	let "SLEEP %= 25"

	echo "Sleeping for "$SLEEP" seconds"

	`sleep $SLEEP`

done