#!/bin/bash

for svc in nginx httpd
do
for rate in 100 200 300 400 500
do
	make test-$svc RATE=$rate > ./log/$svc-$rate.log
done
done
