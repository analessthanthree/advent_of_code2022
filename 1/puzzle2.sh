# /bin/bash

source ./functions.sh

TOP_N_ELVES=3

add_nums $(./puzzle1.sh | head -n $TOP_N_ELVES | awk '{print $2}')
