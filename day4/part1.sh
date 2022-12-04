#!/usr/bin/env bash

total=0
while read line 
do 
    elf1=${line%%,*}
    min1=${elf1%%-*}
    max1=${elf1##*-}

    elf2=${line##*,}
    min2=${elf2%%-*}
    max2=${elf2##*-}
    
    lowerdiff=$(( min2 - min1 )) 
    higherdiff=$(( max2 - max1 ))

    if [[ $(( lowerdiff * higherdiff )) -lt 1 ]] 
    then
        total=$(( total + 1 ))
        echo "New total is $total"
    fi;

done < ./input;
