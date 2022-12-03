#!/usr/bin/env bash

bottommax=0
topelfs=( 0 0 0 ) 
topsize=3
currelf=0
sum=0
while read line; do 
    #echo $line
    if [[ $line != "" ]]
    then
        currelf=$(( currelf + line ))
    else
        for (( i = 0; i < topsize; i++ ))
        do
            if [[ $currelf -gt ${topelfs[$i]} ]] 
            then 
                for (( j = $(( topsize - 1 )); j > i; j-- ))
                do
                    topelfs[$j]=${topelfs[$(( j-1 ))]}
                done;
                topelfs[$i]=$currelf
                echo "Elf number $(( i+1 )) is now ${topelfs[$i]}"
                break
            fi;
        done;
        currelf=0
    fi;
done < ./input;

for (( i = 0; i < topsize; i++ ))
do
    sum=$((sum + topelfs[$i]))
    echo "Sum is: $sum"
done;
