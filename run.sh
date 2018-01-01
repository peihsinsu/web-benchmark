#!/bin/bash

echo "Clean log..."
rm -rf log/*

echo "Start benchmark..."
for svc in nginx httpd
do

echo "Doing $svc benchmark process...."
for rate in 300 400 500
do
	echo "Processing $svc@$rate...."
	make test-$svc DURATION=30 RATE=$rate > ./log/$svc-$rate.log
done
done

echo "DONE..."
