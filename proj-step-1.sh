#! /bin/bash

for x in $@
do
a=$(tail -n +2 $x | gawk '{print $2}' | ./avg.py)
b=$(tail -n +2 $x | gawk '{print $2}' | ./std.py)
c=$(tail -n +2 $x | gawk '{print $3}' | ./avg.py)
d=$(tail -n +2 $x | gawk '{print $3}' | ./std.py)

info=($x\	$a\	$b\	$c\	$d)
echo $info
done

