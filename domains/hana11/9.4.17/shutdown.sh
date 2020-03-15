#!/bin/sh

. ./env.sh

$INFINISPAN_HOME/bin/ispn-cli.sh --connect --controller=$CONSOLE_IP:$CONSOLE_PORT --command=:shutdown
