#! /bin/bash

add_nums () {
    SUM=0
    for NUM in $@; do let SUM+=$NUM; done
    echo $SUM
}

score_result () {
    A=$1
    X=$2
    echo $(( (3*X+A) % 9 ))
}

score_result2 () {
    A=$1
    X=$2
    echo $(( (X/3+A) % 3 ))
}
