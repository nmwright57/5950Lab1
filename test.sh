#!/bin/sh
../../start.sh
/usr/local/hadoop/bin/hdfs dfs -rm -r /5950Lab1/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /5950Lab1/output/
/usr/local/hadoop/bin/hdfs dfs -mkdir -p /5950Lab1/input/
/usr/local/hadoop/bin/hdfs dfs -copyFromLocal ../../mapreduce-test-data/access.log /5950Lab1/input/
/usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-3.3.1.jar \
-file ../../5950Lab1/mapper1.py -mapper ../../5950Lab1/mapper1.py \
-file ../../5950Lab1/reducer.py -reducer ../../5950Lab1/reducer1.py \
-input /5950Lab1/input/* -output /5950Lab1/output/


/usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-3.3.1.jar \
-file ../../5950Lab1/mapper-2.py -mapper ../../5950Lab1/mapper-2.py \
-file ../../5950Lab1/reducer-2.py -reducer ../../5950Lab1/reducer-2.py \
-input /5950Lab1/output/* -output /5950Lab1-2/output/





/usr/local/hadoop/bin/hdfs dfs -cat /5950Lab1-2/output/part-00000 | tail -10
/usr/local/hadoop/bin/hdfs dfs -rm -r /5950Lab1/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /5950Lab1/output/
/usr/local/hadoop/bin/hdfs dfs -rm -r /5950Lab1-2/output/
../../stop.sh
