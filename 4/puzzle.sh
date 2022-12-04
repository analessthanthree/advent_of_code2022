#! /bin/bash

INPUT=input

# Fully reduntant pairs
let FRED=0

# Partially reduntant pairs
let PRED=0

for PAIR in $(cat $INPUT)
do
    VALS=( $(echo $PAIR | tr "," " " | tr "-" " ") )
    LEFT1=${VALS[0]}; RIGHT1=${VALS[1]}
    LEFT2=${VALS[2]}; RIGHT2=${VALS[3]}
    # Fully redundant pairs
    { [[ $LEFT1 -le $LEFT2 && $RIGHT1 -ge $RIGHT2 ]] && let FRED+=1; } \
    || \
    { [[ $LEFT2 -le $LEFT1 && $RIGHT2 -ge $RIGHT1 ]] && let FRED+=1; }
    # Partially redundant pairs
    { [[ $LEFT1 -le $LEFT2 && $RIGHT1 -ge $LEFT2 ]] && let PRED+=1; } \
    || \
    { [[ $LEFT2 -le $LEFT1 && $RIGHT2 -ge $LEFT1 ]] && let PRED+=1; }
done

echo "Fully redundant pairs: $FRED"
echo "Partially redundant pairs: $PRED"
