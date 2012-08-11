# Web Server wars!

Testing puma.io vs thin (with pastry pre-fork runner, similar to thin v2)

## Setup

bundle --path gems --binstubs

## Running

./bechmark.sh

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
