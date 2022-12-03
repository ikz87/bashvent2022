#!/usr/bin/env bash

# rock = a, x, 1 point
# paper = b, y, 2 points
# scissors = c, z, 3 points

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

choicepoints=0
winpoints=0
score=0
while read line
do
    other=`parse ${line%% *}`
    self=`parse ${line##* }`
    choicepoints=$(( self + 1 )) 

    shift=$(( 2 - other ))
    other=$(( other + shift ))
    self=$(( (self + shift) % 3 ))

    result=$(( other - self )) 

    case $result in
        0 )
            winpoints=3
            ;;
        1 )
            winpoints=0 
            ;;
        2 ) 
            winpoints=6
            ;;
    esac

    #echo "other is $other and self is $self and points is $points"
    score=$(( score + winpoints + choicepoints ))
    echo "current score is $score"

done < ./input;
