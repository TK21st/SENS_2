#!/bin/bash

echo "The Script Starts Now"

function bike_data {
	COUNTER=0
	FNUM=0
	Y=""
	while [ $COUNTER -lt 1 ]
	do
		DATE=$(date +"%m.%d.%Y")
		TIME=$(date +"%T")
		FNAME="bdata_$FNUM.csv"
		FNUM=$((FNUM+1))
		echo $DATE > "$FNAME"
		echo $TIME >> "$FNAME"
		echo Executing BIKE_DATA
		sudo bash run.sh >> "$FNAME"
		echo "Finished Executing"
		echo $TIME >> "$FNAME"
		echo Executing Python POST
		sudo python upload.py "$FNAME"
	done
}

bike_data
