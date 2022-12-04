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
    
    minlowerdiff=$(( min2 - min1 )) 
    minhigherdiff=$(( min2 - max1 ))

    maxlowerdiff=$(( max2 - min1 ))
    maxhigherdiff=$(( max2 - max1 ))

    if [[ $(( minlowerdiff * maxhigherdiff )) -lt 1 || \
        $(( maxhigherdiff * maxlowerdiff )) -lt 1 || \
        $(( minhigherdiff * minlowerdiff )) -lt 1 ]]
    then
        total=$(( total + 1 ))
        echo "New total is $total at line $line"
    fi;

done < ./input;
