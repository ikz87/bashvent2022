#!/usr/bin/env bash

get_index() 
{
    if [[ $1 == [a-z] ]] 
    then
        echo $(( 36#$1-9))
    else
        echo $(( 36#$1+17))
    fi;
}

total=0
while read line1; read line2; read line3
do 
    len=${#line1}
    for (( i = 1; i <= len; i++ )) 
    do
        char=`echo $line1 | cut -c $i`
        echo $line2 | grep $char -q && echo $line3 | grep $char -q && \
            charcount=`echo "$line1\n$line2\n$line3\n" | grep -c $char` &&\
            total=$(( total + `get_index $char`*charcount )) &&\
            charcount=0 && break
    done;
    echo "Total is $total" 

done < ./input;
