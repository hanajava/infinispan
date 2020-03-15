#!/bin/sh


. ./env.sh

PID=`ps -ef | grep java | grep infinispan | grep "$NODE_NAME " | awk '{print $2}'`


if [ e$PID == "e" ]
then
        echo "NOT RUNNING!!!"
        exit;
fi

$DOMAIN_BASE/monitor_agent/./jvmtop.sh $PID
