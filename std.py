#! /usr/bin/python

import fileinput
import math

count=0
sum=0
a = []
for line in fileinput.input():
	line=line.strip()
	if line != "":
		num=float(line)
		sum+=num
		count+=1
		a.append(num)
avg=sum/count

sumate=0
for i in a:
	sumate+= (i-avg)**2

std=math.sqrt(sumate/(count-1))
print std

