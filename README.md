# Web Server wars!

Testing puma.io (just-dash-w) vs thin (with pastry pre-fork runner, similar to thin v2)

## Setup

`bundle --path gems --binstubs`

```
$ uname -a
Linux deepfryed.local 3.0.0-1-amd64 #1 SMP Sun Jul 24 02:24:44 UTC 2011 x86_64 GNU/Linux

$ ruby -v
ruby 1.9.3p125 (2012-02-16 revision 34643) [x86_64-linux]

$ cat /proc/cpuinfo | grep "processor\|model name\|cache size"
processor	: 0
model name	: Intel(R) Core(TM) i7-2677M CPU @ 1.80GHz
cache size	: 4096 KB
processor	: 1
model name	: Intel(R) Core(TM) i7-2677M CPU @ 1.80GHz
cache size	: 4096 KB
processor	: 2
model name	: Intel(R) Core(TM) i7-2677M CPU @ 1.80GHz
cache size	: 4096 KB
processor	: 3
model name	: Intel(R) Core(TM) i7-2677M CPU @ 1.80GHz
cache size	: 4096 KB
```

## Running

`./bechmark.sh`

## Results

```
$ ./bechmark.sh 
##########################################################################################
testing puma
##########################################################################################


Concurrency Level:      10
Time taken for tests:   0.239 seconds
Complete requests:      2000
Failed requests:        0
Write errors:           0
Total transferred:      152000 bytes
HTML transferred:       24000 bytes
Requests per second:    8370.16 [#/sec] (mean)
Time per request:       1.195 [ms] (mean)
Time per request:       0.119 [ms] (mean, across all concurrent requests)
##########################################################################################
testing thin (with pastry)
##########################################################################################


Concurrency Level:      10
Time taken for tests:   0.804 seconds
Complete requests:      10000
Failed requests:        0
Write errors:           0
Total transferred:      1130000 bytes
HTML transferred:       120000 bytes
Requests per second:    12438.83 [#/sec] (mean)
Time per request:       0.804 [ms] (mean)
Time per request:       0.080 [ms] (mean, across all concurrent requests)
```
