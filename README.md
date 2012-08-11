# Web Server wars!

Testing puma.io (just-dash-w) vs thin (with pastry pre-fork runner, similar to thin v2)

## Setup

* bundle install with binstubs

```
$ bundle --path gems --binstubs
```

## Environment

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

* Use the bash script `./bechmark.sh`
* puma runs with 2 workers `puma -w 2 -q`
* pastry runs with 2 workers

## Results

## With Keep-Alive

```
$ ./bechmark.sh -k
##########################################################################################
testing puma
##########################################################################################


Concurrency Level:      10
Time taken for tests:   0.127 seconds
Complete requests:      2000
Failed requests:        0
Write errors:           0
Keep-Alive requests:    2000
Total transferred:      202000 bytes
HTML transferred:       24000 bytes
Requests per second:    15755.72 [#/sec] (mean)
Time per request:       0.635 [ms] (mean)
##########################################################################################
testing thin (with pastry)
##########################################################################################


Concurrency Level:      10
Time taken for tests:   0.613 seconds
Complete requests:      10000
Failed requests:        0
Write errors:           0
Keep-Alive requests:    10000
Total transferred:      1380000 bytes
HTML transferred:       120000 bytes
Requests per second:    16301.35 [#/sec] (mean)
Time per request:       0.613 [ms] (mean)
```

## Without Keep-Alive

```
$ ./bechmark.sh
##########################################################################################
testing puma
##########################################################################################


Concurrency Level:      10
Time taken for tests:   0.229 seconds
Complete requests:      2000
Failed requests:        1986
   (Connect: 0, Receive: 0, Length: 1986, Exceptions: 0)
Write errors:           0
Total transferred:      9462912 bytes
HTML transferred:       9334912 bytes
Requests per second:    8745.92 [#/sec] (mean)
Time per request:       1.143 [ms] (mean)
##########################################################################################
testing thin (with pastry)
##########################################################################################


Concurrency Level:      10
Time taken for tests:   0.895 seconds
Complete requests:      10000
Failed requests:        0
Write errors:           0
Total transferred:      1130000 bytes
HTML transferred:       120000 bytes
Requests per second:    11177.33 [#/sec] (mean)
Time per request:       0.895 [ms] (mean)
Time per request:       0.089 [ms] (mean, across all concurrent requests)
```
