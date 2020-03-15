#!/bin/sh


. ./env.sh

ps -ef | grep java | grep infinispan | grep "$NODE_NAME " | awk {'print "kill -9 " $2'} | sh -x
