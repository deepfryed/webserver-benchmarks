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

Requests per second:    7778.53 [#/sec] (mean)
Time per request:       1.286 [ms] (mean)
Time per request:       0.129 [ms] (mean, across all concurrent requests)
##########################################################################################
testing thin (with pastry)
##########################################################################################

Requests per second:    11170.53 [#/sec] (mean)
Time per request:       0.895 [ms] (mean)
Time per request:       0.090 [ms] (mean, across all concurrent requests)
```
