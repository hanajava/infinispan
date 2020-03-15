#!/bin/sh


. ./env.sh

ps -ef | grep java | grep infinispan | grep "$NODE_NAME "
