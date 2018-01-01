#!/bin/bash

for server in nginx httpd
do

for name in 300 400 500
do
echo $server $name `cat ./log/$server-$name.log | grep Latencies | awk '{print $7 $8 $9 $10 $11}' | sed s/ms,/\ /g | sed s/ms/\ /g`
done

done
