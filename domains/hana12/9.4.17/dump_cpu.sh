#!/bin/sh


. ./env.sh

for count in 1 2 3 4 5; do
    echo "Thread Dump : $count"
    for i in `ps -ef | grep java | grep infinispan | grep "$NODE_NAME " | awk '{print $2}'`;do
        top -H -b -n1 >> $LOG_DIR/nohup/dump_high_cpu_$i.txt
        date
	echo "+jstack -l $i >> $LOG_DIR/nohup/dump_high_cpu_$i"
        jstack -l $i >> $LOG_DIR/nohup/dump_high_cpu_$i
        echo "cpu snapshot and thread dump done. #" 
    done
    echo "done"
    sleep 3
done
