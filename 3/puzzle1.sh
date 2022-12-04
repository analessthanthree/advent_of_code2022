#! /bin/bash

source ./functions.sh

for SACK in $(cat input)
do
    NUMITEMS=${#SACK}
    COMP1=${SACK:0:$(( NUMITEMS/2 ))}
    COMP2=${SACK:$(( NUMITEMS/2 )):$NUMITEMS}
    for ITEM in $(echo $COMP1 | sed -e "s/./& /g")
    do
        { echo $COMP2 | grep -q -e "$ITEM"; } \
            && echo $ITEM $(get_priority $ITEM) && break
    done
done > output.tmp

add_nums $(awk '{print $2}' output.tmp)
