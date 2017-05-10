#! /bin/bash

for x in $@
do
time=$(cat $x | head -n 2 | tail -n 1 | cut -f 1)
a=$(tail -n +2 $x | gawk -v y="${time}" 'y+1000>$1, NF > 1 {print $2}' | ./avg.py)
d=$(tail -n +2 $x | gawk -v y="${time}" 'y+1000>$1, NF > 1 {print $3}' | ./std.py)
b=$(tail -n +2 $x | gawk -v y="${time}" 'y+1000>$1, NF>1 {print $2}' | ./std.py)
c=$(tail -n +2 $x | gawk -v y="${time}" 'y+1000>$1, NF>1 {print $3}' | ./avg.py)
f=$(echo ''$b'^2' | bc)
g=$(echo ''$d'^2' | bc)
e=$(echo 'sqrt('$f'+'$g')' | bc)

info=($x\	$a\	$b\	$c\	$d\	$e)
echo $info
done

