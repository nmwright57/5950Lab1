import re
import sys

pattern = re.compile(r'(?P<ip>\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}):(?P<hour>\d{2}):\d{2}.*? ')
for line in sys.stdin:
	match = pattern.search(line)
	if match:
		for hour in range(24):
			print '%s\t%s' % ('[' + match.group('hour') + ':00' + ']' + match.group('ip'), 1)
