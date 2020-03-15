#!/bin/sh

. ./env.sh

let CLI_PORT=$CONSOLE_PORT+$PORT_OFFSET

$INFINISPAN_HOME/bin/ispn-cli.sh --connect --controller=$CONSOLE_IP:$CLI_PORT --command=:shutdown
