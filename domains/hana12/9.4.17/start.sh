#!/bin/sh

. ./env.sh

DATE=`date +%Y%m%d%H%M%S`


PID=`ps -ef | grep java | grep infinispan | grep "$NODE_NAME " | awk '{print $2}'`

if [ e$PID != "e" ]
then
        echo "INFINISPAN SERVER - $NODE_NAME is already RUNNING..."
        echo "+PID=$PID"
        exit;
fi


if [ ! -d "$LOG_DIR/nohup" ];
then
        mkdir -p $LOG_DIR/nohup
fi
if [ ! -d "$LOG_DIR/gclog" ];
then
	mkdir -p $LOG_DIR/gclog
fi

if [ ! -d "$LOG_DIR/heapdump" ];
then
	mkdir -p $LOG_DIR/heapdump
fi


mv $LOG_DIR/nohup/nohup.out $LOG_DIR/nohup/nohup.out.$DATE

rm -rf tmp/*

#nohup $INFINISPAN_HOME/bin/clustered.sh -Djboss.node.name=$NODE_NAME -c $CONFIG_FILE >> $LOG_DIR/nohup/nohup.out 2>&1 &
nohup $INFINISPAN_HOME/bin/standalone.sh -Djboss.node.name=$NODE_NAME -c $CONFIG_FILE >> $LOG_DIR/nohup/nohup.out 2>&1 &


if [ e$1 = "etail" ]
then
        tail -f $LOG_DIR/nohup/nohup.out
fi

echo "Starting $NODE_NAME "
until [ "`curl --silent -o --show-error --connect-timeout 1 -w "%{http_code}\n" http://$CONSOLE_IP:$CONSOLE_PORT_CAL | egrep '200|301|302|500'`" != "" ];
do
        echo -ne "."
        sleep 1
done
echo -ne " Success"

PID=`ps -ef | grep java | grep infinispan | grep "$NODE_NAME " | awk '{print $2}'`
echo " +$PID"


#java -jar $DOMAIN_BASE/monitor_agent/jolokia-jvm-1.3.1-agent.jar start $PID --port=$MONITOR_PORT --host=$BIND_ADDR
