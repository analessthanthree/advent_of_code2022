#! /bin/bash

INPUT=input

STREAM=$(cat $INPUT)
NUMCHARS=$(wc -m $INPUT | awk '{print $1}')

# Uncomment to test sequences
# STREAM="nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg"
# NUMCHARS=$(echo $STREAM | wc -m | awk '{print $1}')

# Length of marker
LENGTH=4

# Comment for part 1
# Uncomment for part 2
LENGTH=14

for N in $(seq 0 $(( NUMCHARS-1 )));
do
    SEQ=${STREAM:$N:$LENGTH};
    let SUM=0
    # Count the total number of times each $CHAR appears in each sequence
    for CHAR in $(echo $SEQ | sed -E -e 's|(.)|\1\n|g')
    do
        let SUM+=$(echo $SEQ | sed -E -e 's|(.)|\1\n|g' | grep -c -e "$CHAR")
    done
    # If SUM != LENGTH, that means there was at least 1 repeated character, or we are
    # at the "edge" of the sequence
    # If SUM = LENGTH, that means each character appeared only once, and we break the
    # loop
    # We actually start on the first full LENGTH char sequence, so we add LENGTH to
    # whatever value of N we're on
    [ "$SUM" -eq "$LENGTH" ] && echo $((N+LENGTH)) && break
done
