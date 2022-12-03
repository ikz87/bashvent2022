#!/usr/bin/env bash

max=0
currelf=0
cat ./input | while read line; do 
    #echo $line
    if [[ $line != "" ]]
    then
        currelf=$(( currelf + line ))
    else
        if [[ $currelf -gt $max ]] 
        then
            max=$currelf 
            echo "New max is $max"
        fi;
        currelf=0
    fi;
done;
