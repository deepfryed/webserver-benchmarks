#!/bin/bash

echo "##########################################################################################"
echo "testing puma"
echo "##########################################################################################"
echo

./bin/puma -w 2 config.ru -q > /dev/null &
pid=$!

sleep 1
ab -q -n2000 -c10 $@ http://127.0.0.1:9292/ | head -n24 | tail -n11
kill -QUIT $pid
kill -TERM $pid

sleep 1
echo "##########################################################################################"
echo "testing thin (with pastry)"
echo "##########################################################################################"
echo

./bin/pastry -p 9292 -R config.ru start > /dev/null &
pid=$!
sleep 1

ab -q -n10000 -c10 $@ http://127.0.0.1:9292/ | head -n24 | tail -n11
kill -QUIT $pid
