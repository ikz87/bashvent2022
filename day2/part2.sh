#!/usr/bin/env bash

# rock = a, 1 point
# paper = b, 2 points
# scissors = c, 3 points
# X = lose
# Y = draw 
# Z = win

parse () {
    case $1 in
        A | X )
            echo "0"
            ;;
        B | Y )
            echo "1"
            ;;
        C | Z )
            echo "2"
            ;;
    esac
}

score=0
while read line
do
    other=`parse ${line%% *}`
    result=`parse ${line##* }`
    self=$(( (other + result + 2) % 3 ))
    roundpoints=$(( self + 1 + 3 * result ))
    score=$(( score + roundpoints ))
    echo "current score is $score"
done < ./input;
