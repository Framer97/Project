#! /bin/bash

for x in $@
do
a=$(tail -n +2 $x | gawk '{print $2}' | ./avg.py)
b=$(tail -n +2 $x | gawk '{print $2}' | ./std.py)
c=$(tail -n +2 $x | gawk '{print $3}' | ./avg.py)
d=$(tail -n +2 $x | gawk '{print $3}' | ./std.py)
f=$(echo ''$b'^2' | bc)
g=$(echo ''$d'^2' | bc)
e=$(echo 'sqrt('$f'+'$g')' | bc)
info=($x\	$a\	$b\	$c\	$d\	$e)
echo $info
done

