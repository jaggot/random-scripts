#!/bin/bash
# need month, year
tail -n +8 "$1 $2 Little Ferry Prayer Times.txt" | head -n -5 | awk '{if(int($1) < 10){printf "0"$1}else{printf $1}; print" " $3, $5, $6, $7, $8}'
#> "$1 2021 Little Ferry Prayer Times.txt"
