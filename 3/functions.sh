#! /bin/bash

add_nums () {
    SUM=0
    for NUM in $@; do let SUM+=$NUM; done
    echo $SUM
}

get_priority () {
    if [[ "$1" =~ [a-z] ]];
    then
        echo $(( $(printf '%d\n' "'$1") - 96 ));
    elif [[ "$1" =~ [A-Z] ]];
    then
        echo $(( $(printf '%d\n' "'$1") - 38 ));
    fi
}

find_common_priority () {
    ELF1=$1; ELF2=$2; ELF3=$3;
    for ITEM in $(echo $ELF1 | sed -e "s/./& /g")
    do
        { echo $ELF2 | grep -q -e "$ITEM"; } \
        && { echo $ELF3 | grep -q -e "$ITEM"; } \
        && echo $ITEM $(get_priority $ITEM) && break
    done
}
