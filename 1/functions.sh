#! /bin/bash

add_nums () {
    SUM=0
    for NUM in $@; do let SUM+=$NUM; done
    echo $SUM
}
