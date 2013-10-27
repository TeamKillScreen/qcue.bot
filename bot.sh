#!/bin/bash

while true
do

	NAME=`cat names.txt | awk 'BEGIN { OFS="\t"; srand() } { print rand(), $0 }' | sort -n | cut -f2- | head -1 | awk '{print $1}'`

	NUMBER=$RANDOM
	let "NUMBER %= 99"

	JOIN="http://www.qcue.me/api/incoming_sms?to=447860033153&from=44551234567"$NUMBER"&content=BACN&msg_id=AB_12345"
	REG="http://www.qcue.me/api/incoming_sms?to=447860033153&from=44551234567"$NUMBER"&content=NAME+"$NAME"&msg_id=AB_12345"

	`curl $JOIN`
	`curl $REG`

	SLEEP=$RANDOM
	let "SLEEP %= 30"

	echo "Sleeping for "$SLEEP" seconds"

	`sleep $SLEEP`

done