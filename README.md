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
* keep-alive is turned on by default

## Results

```
$ ./bechmark.sh
##########################################################################################
testing puma
##########################################################################################

Concurrency Level:      10
Time taken for tests:   3.217 seconds
Complete requests:      50000
Failed requests:        0
Write errors:           0
Keep-Alive requests:    50000
Total transferred:      5050000 bytes
HTML transferred:       600000 bytes
Requests per second:    15543.26 [#/sec] (mean)
Time per request:       0.643 [ms] (mean)

##########################################################################################
memory use (rss)
##########################################################################################

parent:
18932
workers:
16660
17388

##########################################################################################
testing thin (with pastry)
##########################################################################################

Concurrency Level:      10
Time taken for tests:   2.984 seconds
Complete requests:      50000
Failed requests:        0
Write errors:           0
Keep-Alive requests:    50000
Total transferred:      6900000 bytes
HTML transferred:       600000 bytes
Requests per second:    16755.13 [#/sec] (mean)
Time per request:       0.597 [ms] (mean)

##########################################################################################
memory use (rss)
##########################################################################################

parent:
21972
workers:
19352
19352
```
