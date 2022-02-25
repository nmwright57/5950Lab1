#!/usr/bin/env python
from operator import itemgetter
import sys

for line in sys.stdin:
  line = line.strip()
   hour,count = line.split('\t',1)
   print "%s\t%s" % (hour,count)
