#! /bin/bash

source ./functions.sh

INPUT=input

# Get total number of groups
NUMGROUPS=$(( $(cat $INPUT | wc -l)/3 ))

for GROUP in $(seq 1 $NUMGROUPS )
do
    LEFT=$(( 1+3*(GROUP-1) ))
    RIGHT=$(( 3*GROUP ))
    find_common_priority $(sed -n -e "${LEFT},${RIGHT}"p $INPUT)
done > output2.tmp

add_nums $(awk '{print $2}' output2.tmp)
