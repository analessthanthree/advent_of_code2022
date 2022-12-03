#! /bin/bash

source ./functions.sh

# Transform input file contents into one I can do math on
sed -e "s/A/3/g" -e "s/B/1/g" -e "s/C/2/g" \
    -e "s/X/0/g" -e "s/Y/3/g" -e "s/Z/6/g" input > input.tmp

# Find the score for each round, then add all round results
for pair in $(tr " " "," < input.tmp)
do
    score_result2 $( echo $pair | tr "," " ")
done > output2.tmp

# Replace any 0's with 3's
sed -e "s/0/3/g" -i output2.tmp

# Score from win/loss/draws
WLD=$(add_nums $(cat output2.tmp))

# Score from the hand you played
HAND=$(add_nums $(awk '{print $2}' input.tmp))

TOTAL=$(( WLD + HAND ))
echo $TOTAL
