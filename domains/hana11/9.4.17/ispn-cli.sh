#!/bin/sh


. ./env.sh

export JAVA_OPTS=" -Djava.awt.headless=false $JAVA_OPTS"

let CLI_PORT=$CONSOLE_PORT+$PORT_OFFSET

$INFINISPAN_HOME/bin/ispn-cli.sh --connect --controller=$CONSOLE_IP:$CLI_PORT
