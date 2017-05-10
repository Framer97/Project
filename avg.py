#! /usr/bin/python

import fileinput

count=0
sum=0
for line in fileinput.input():
	line = line.strip()
	if line != "":
		num = float(line)
		sum+=num
		count+=1
avg=sum/count	

print avg
