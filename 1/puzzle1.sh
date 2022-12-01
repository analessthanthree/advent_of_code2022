#! /bin/bash

#######################################
# START PUZZLE 1
#######################################

source ./functions.sh

STARTLINE=1
ENDLINE=$(wc -l input)
NUMOFELVES=$(($(grep -n "^$" input | wc -l)+1))
STACKED_ELF=1
STACKED_CALORIES=0

ENDPOINTS=( ${STARTLINE} $(grep -n "^$" input | awk -F ":" '{print $1}') ${ENDLINE} )

for ELF in $(seq 0 $(( NUMOFELVES-1 )));
do
    LEFT=${ENDPOINTS[$(( ELF ))]}
    RIGHT=${ENDPOINTS[$(( ELF+1 ))]}
    CALS=$(add_nums $(sed -n -e "$LEFT,$RIGHT p" input))
    echo $ELF $CALS
done | sort -r -k 2
