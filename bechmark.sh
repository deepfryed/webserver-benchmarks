#!/bin/bash

iter=10000

function memcheck() {
  ppid=$1
  echo
  echo "##########################################################################################"
  echo "memory use (rss)"
  echo "##########################################################################################"
  echo
  echo "parent:"
  ps -o rss= --pid  $ppid
  echo "workers:"
  ps -o rss= --ppid $ppid
  echo
}

echo "##########################################################################################"
echo "testing puma"
echo "##########################################################################################"

./bin/puma -w 2 -q config.ru > /dev/null &
pid=$!

sleep 2
ab -n$iter -c10 -q -k http://127.0.0.1:9292/ | head -n24 | tail -n11

sleep 1
memcheck $pid
kill -TERM $pid

sleep 1
echo "##########################################################################################"
echo "testing thin (with pastry)"
echo "##########################################################################################"

./bin/pastry -p 9292 -R config.ru start > /dev/null &
pid=$!

sleep 2
ab -n$iter -c10 -q -k http://127.0.0.1:9292/ | head -n24 | tail -n11

sleep 1
memcheck $pid
kill -TERM $pid
