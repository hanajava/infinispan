#!/bin/sh


. ./env.sh

for count in 1 2 3 4 5; do
    echo "Thread Dump : $count"
    for i in `ps -ef | grep java | grep infinispan| grep "$NODE_NAME " | awk '{print $2}'`;do
        date
	echo "+jstack -l $i >> $LOG_DIR/nohup/thread_dump_$i"
	jstack -l $i >> $LOG_DIR/nohup/thread_dump_$i
    done
    echo "done"
    echo "sleep 3 sec"
    sleep 3
done
