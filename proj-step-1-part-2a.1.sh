#! /bin/bash

for x in $@
do
stime=$(cat $x | head -n 2 | tail -n -1 | cut -f 1 -d " ")
info=$x,$(tail -n +2 $x | gawk -v y="${stime}" 'y = 1000 > $1, NF > 1 {print $2}' | ./avg.py),$(tail -n +2 $x | gawk '{print $2}' | ./std.py),$(tail -n +2 $x | gawk '{print $3}' | ./avg.py),$(tail -n +2 $x | gawk '{print $3}' | ./std.py )
echo $info
done

