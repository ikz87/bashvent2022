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
while read line
do 
    halflen=${#line}
    halflen=$(( halflen / 2 )) 
    half1=`echo $line | cut -c -$halflen`
    half2=`echo $line | cut -c $(( halflen+1 ))-`
    
    for (( i = 1; i <= halflen; i++ )) 
    do
        char=`echo $half1 | cut -c $i`
        echo $half2 | grep $char -q && total=$(( total + `get_index $char` )) && \
            echo "Matched character $char with index `get_index $char`" && break
    done;
    echo "Total is $total" 
done < ./input;
