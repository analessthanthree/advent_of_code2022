#! /bin/bash

source ./functions.sh

# Transform input file contents into one I can do math on
sed -e "s/A/0/g" -e "s/B/6/g" -e "s/C/12/g" \
    -e "s/X/1/g" -e "s/Y/2/g" -e "s/Z/3/g" input > input.tmp

# Find the score for each round, then add all round results
for pair in $(tr " " "," < input.tmp)
do
    score_result $( echo $pair | tr "," " ")
done > output.tmp

# Score from win/loss/draws
WLD=$(add_nums $(cat output.tmp))

# Score from the hand you played
HAND=$(add_nums $(awk '{print $2}' input.tmp))

TOTAL=$(( WLD + HAND ))
echo $TOTAL
