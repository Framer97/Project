#! /bin/bash

for x in $@
do
time=$(cat $x | head -n 2 | tail -n 1 | cut -f 1 -d " ")
a=$(tail -n +2 $x | gawk -v y="${time}" 'y=10000>$1, NF>$1 {print $2}' | ./avg.py)
b=$(tail -n +2 $x | gawk -v y="${time}" 'y=10000>$1, NF>$1 {print $3}' | ./avg.py)
tail -n +2 $x | gawk -v t="${time}" -v z="$a" -v y="$b" 't+10000>$1, NF>1 {print sqrt(($2-z)^2 + ($3-y)^2)}'
done

