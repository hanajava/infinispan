#!/bin/sh

export PORT=9000

let HANA_PORT=100+$PORT
export HANA_PORT
echo "HANA_PORT="$HANA_PORT 

export DUNA_PORT=`expr 100 + $PORT`
echo "DUNA_PORT="$DUNA_PORT 

export DUNA_PORT=$((100 + $PORT))
echo "DUNA_PORT="$DUNA_PORT
