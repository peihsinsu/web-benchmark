# Using Vegeta Benchmark HTTPD and Nginx

Using run script to test 100~500 rate (Requests per second)

```
bash run.sh
```

Report and screen output...

```
bash rpt-latencies.sh 
```

Output as CSV file

```
bash rpt-latencies.sh | sed s/\ /,/g | cat > ~/Downloads/benchmark.csv
```

Using make...

For nginx:

```
make vegeta-nginx RATE=800
```

For httpd:

```
make vegeta-httpd RATE=800
```
