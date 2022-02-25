#!/usr/bin/python
from operator import itemgetter
import sys

dict_time_count = {}

for line in sys.stdin:
	line = line.strip().split('\t')
	hour_ip, count = line
	hour, ip = hour_ip.split(' ')

	try:
		hour = int(hour)
		count = int (count)
		dict_time_count[hour].append([ip,count])

	except ValueError;
		pass

for i in range(24):
	top_time = sorted(dict_time_count[i], key = lambda x:x[1], reverse=True)[0:3]
	print '%s\t%s' % (i,top_time)
