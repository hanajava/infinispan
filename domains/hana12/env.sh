#!/bin/sh

DATE=`date +%Y%m%d_%H%M%S`

export INFINISPAN_HOME=/svc/infinispan/infinispan-server-9.4.17.Final
export DOMAIN_BASE=/svc/infinispan/domains
export HOST_NAME=was01
export NODE_NAME=hana12
export LOG_DIR=$DOMAIN_BASE/$NODE_NAME/logs

export CONFIG_FILE=clustered.xml
export BIND_ADDR=192.168.110.141
export PORT_OFFSET=200

export CONSOLE_IP=$BIND_ADDR
## 기동 시 $PORT_OFFET 자동 합산됨
export CONSOLE_PORT=`expr 9990 + $PORT_OFFSET`
#let CONSOLE_PORT_CAL=$CONSOLE_PORT+$PORT_OFFSET

#let MONITOR_PORT=9991+$PORT_OFFSET
export MONITOR_PORT=`expr 9991 + $PORT_OFFSET`

#hotrod
#let SERVICE_PORT=11222+$PORT_OFFSET
export SERVICE_PORT=`expr 11222 + $PORT_OFFSET`

# JVM Options : Memory
export JAVA_OPTS="-server $JAVA_OPTS"
export JAVA_OPTS=" $JAVA_OPTS -Xms128m -Xmx512m -Xss256k"

# Infinispan Setting
export JAVA_OPTS=" $JAVA_OPTS -Djboss.server.base.dir=$DOMAIN_BASE/$NODE_NAME"
export JAVA_OPTS=" $JAVA_OPTS -Djboss.server.config.dir=$DOMAIN_BASE/$NODE_NAME/configuration "
export JAVA_OPTS=" $JAVA_OPTS -Djboss.server.log.dir=$LOG_DIR"
export JAVA_OPTS=" $JAVA_OPTS -Djboss.socket.binding.port-offset=$PORT_OFFSET"
export JAVA_OPTS=" $JAVA_OPTS -Djboss.bind.address=$BIND_ADDR"
export JAVA_OPTS=" $JAVA_OPTS -Djboss.bind.address.management=$BIND_ADDR"

echo "============================================================="
echo "   Infinispan Server-9.4.17.Final        admin@hanajava.net"
echo "-------------------------------------------------------------"
echo "INFINISPAN_HOME=$INFINISPAN_HOME"
echo "DOMAIN_BASE=$DOMAIN_BASE"
echo "NODE_NAME=$NODE_NAME"
echo "CONFIG_FILE=$DOMAIN_BASE/$NODE_NAME/configuration/$CONFIG_FILE"
echo "BIND_ADDR=$BIND_ADDR"
echo "PORT_OFFSET=$PORT_OFFSET"
echo "SERVICE=$BIND_ADDR:$SERVICE_PORT"
echo "CONSOLE=http://$CONSOLE_IP:$CONSOLE_PORT"
echo "============================================================="
