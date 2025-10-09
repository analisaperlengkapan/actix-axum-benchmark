=== ACTIX vs AXUM BENCHMARK RESULTS ===

Generated on: Thu Oct  9 07:18:56 WIB 2025


# Test Results: results

## Results from actix_light_20251009_070918

**Requests/sec:** 142580.61
**Average Latency:** 22.65ms 138.32ms
**Total Requests:** 4476007
**Transfer Rate:** 31.27MB

**Latency Distribution:**
  Latency Distribution
     50%  369.00us
     75%    0.96ms
     90%    2.75ms
     99%  932.38ms
  4476007 requests in 31.39s, 0.96GB read
Requests/sec: 142580.61
Transfer/sec:     31.27MB

## Results from axum_heavy_20251009_071707

**Requests/sec:** 323.28
**Average Latency:** 333.58ms 230.73ms
**Total Requests:** 20326
**Transfer Rate:** 409.72MB

**Latency Distribution:**
  Latency Distribution
     50%  300.42ms
     75%  381.28ms
     90%  475.70ms
     99%    1.59s 
  20326 requests in 1.05m, 25.16GB read
Requests/sec:    323.28
Transfer/sec:    409.72MB

## Results from axum_light_20251009_071414

**Requests/sec:** 92084.01
**Average Latency:** 29.51ms 161.96ms
**Total Requests:** 5791742
**Transfer Rate:** 20.20MB

**Latency Distribution:**
  Latency Distribution
     50%    0.90ms
     75%    1.38ms
     90%    2.22ms
     99%    1.07s 
  5791742 requests in 1.05m, 1.24GB read
Requests/sec:  92084.01
Transfer/sec:     20.20MB

## Results from actix_light_20251009_071302

**Requests/sec:** 156313.86
**Average Latency:** 19.69ms 129.61ms
**Total Requests:** 9804333
**Transfer Rate:** 34.29MB

**Latency Distribution:**
  Latency Distribution
     50%  346.00us
     75%  807.00us
     90%    2.41ms
     99%  871.92ms
  9804333 requests in 1.05m, 2.10GB read
Requests/sec: 156313.86
Transfer/sec:     34.29MB

## Results from actix_heavy_20251009_071526

**Requests/sec:** 359.39
**Average Latency:** 301.92ms 194.10ms
**Total Requests:** 22611
**Transfer Rate:** 455.49MB

**Latency Distribution:**
  Latency Distribution
     50%  262.94ms
     75%  275.34ms
     90%  292.73ms
     99%    1.43s 
  22611 requests in 1.05m, 27.99GB read
Requests/sec:    359.39
Transfer/sec:    455.49MB

## Results from axum_heavy_20251009_071149

**Requests/sec:** 322.80
**Average Latency:** 308.77ms 125.89ms
**Total Requests:** 9694
**Transfer Rate:** 409.12MB

**Latency Distribution:**
  Latency Distribution
     50%  302.92ms
     75%  386.52ms
     90%  466.34ms
     99%  641.78ms
  9694 requests in 30.03s, 12.00GB read
Requests/sec:    322.80
Transfer/sec:    409.12MB

## Results from axum_light_20251009_070958

**Requests/sec:** 89903.32
**Average Latency:** 26.62ms 148.88ms
**Total Requests:** 2820067
**Transfer Rate:** 19.72MB

**Latency Distribution:**
  Latency Distribution
     50%    0.92ms
     75%    1.43ms
     90%    2.34ms
     99%  989.81ms
  2820067 requests in 31.37s, 618.56MB read
Requests/sec:  89903.32
Transfer/sec:     19.72MB

## Results from actix_heavy_20251009_071038

**Requests/sec:** 342.72
**Average Latency:** 312.94ms 189.34ms
**Total Requests:** 10792
**Transfer Rate:** 434.37MB

**Latency Distribution:**
  Latency Distribution
     50%  274.62ms
     75%  291.97ms
     90%  317.32ms
     99%    1.38s 
  10792 requests in 31.49s, 13.36GB read
Requests/sec:    342.72
Transfer/sec:    434.37MB

## Hey Results from actix_light_20251009_070918

```

Summary:
  Total:	0.2645 secs
  Slowest:	0.0426 secs
  Fastest:	0.0001 secs
  Average:	0.0024 secs
  Requests/sec:	37809.2178
  
  Total data:	1209979 bytes
  Size/request:	120 bytes

Response time histogram:
  0.000 [1]	|
  0.004 [8130]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.009 [1440]	|■■■■■■■
  0.013 [266]	|■
  0.017 [72]	|
  0.021 [5]	|
  0.026 [13]	|
  0.030 [51]	|
  0.034 [15]	|
  0.038 [0]	|
  0.043 [7]	|


Latency distribution:
  10% in 0.0002 secs
  25% in 0.0004 secs
  50% in 0.0010 secs
  75% in 0.0031 secs
  90% in 0.0062 secs
  95% in 0.0081 secs
  99% in 0.0159 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0000 secs, 0.0001 secs, 0.0426 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0001 secs, 0.0000 secs, 0.0219 secs
  resp wait:	0.0012 secs, 0.0000 secs, 0.0111 secs
  resp read:	0.0008 secs, 0.0000 secs, 0.0274 secs

Status code distribution:
  [200]	10000 responses



```

## Hey Results from axum_heavy_20251009_071707

```

Summary:
  Total:	30.8025 secs
  Slowest:	0.7845 secs
  Fastest:	0.0213 secs
  Average:	0.3003 secs
  Requests/sec:	324.6493
  
  Total data:	13288608842 bytes
  Size/request:	1328860 bytes

Response time histogram:
  0.021 [1]	|
  0.098 [451]	|■■■■■■■■
  0.174 [1163]	|■■■■■■■■■■■■■■■■■■■■
  0.250 [1986]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.327 [2338]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.403 [2093]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.479 [1099]	|■■■■■■■■■■■■■■■■■■■
  0.556 [563]	|■■■■■■■■■■
  0.632 [222]	|■■■■
  0.708 [77]	|■
  0.785 [7]	|


Latency distribution:
  10% in 0.1426 secs
  25% in 0.2104 secs
  50% in 0.2960 secs
  75% in 0.3807 secs
  90% in 0.4685 secs
  95% in 0.5213 secs
  99% in 0.6252 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0000 secs, 0.0213 secs, 0.7845 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0001 secs, 0.0000 secs, 0.0095 secs
  resp wait:	0.2991 secs, 0.0206 secs, 0.7838 secs
  resp read:	0.0010 secs, 0.0003 secs, 0.0555 secs

Status code distribution:
  [200]	10000 responses



```

## Hey Results from axum_light_20251009_071414

```

Summary:
  Total:	0.3538 secs
  Slowest:	0.0334 secs
  Fastest:	0.0001 secs
  Average:	0.0033 secs
  Requests/sec:	28266.3753
  
  Total data:	1209949 bytes
  Size/request:	120 bytes

Response time histogram:
  0.000 [1]	|
  0.003 [6934]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.007 [1735]	|■■■■■■■■■■
  0.010 [847]	|■■■■■
  0.013 [282]	|■■
  0.017 [113]	|■
  0.020 [30]	|
  0.023 [12]	|
  0.027 [39]	|
  0.030 [6]	|
  0.033 [1]	|


Latency distribution:
  10% in 0.0007 secs
  25% in 0.0012 secs
  50% in 0.0021 secs
  75% in 0.0042 secs
  90% in 0.0078 secs
  95% in 0.0100 secs
  99% in 0.0163 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0000 secs, 0.0001 secs, 0.0334 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0001 secs, 0.0000 secs, 0.0155 secs
  resp wait:	0.0022 secs, 0.0001 secs, 0.0218 secs
  resp read:	0.0008 secs, 0.0000 secs, 0.0186 secs

Status code distribution:
  [200]	10000 responses



```

## Hey Results from actix_light_20251009_071302

```

Summary:
  Total:	0.2744 secs
  Slowest:	0.0344 secs
  Fastest:	0.0001 secs
  Average:	0.0025 secs
  Requests/sec:	36438.2420
  
  Total data:	1209979 bytes
  Size/request:	120 bytes

Response time histogram:
  0.000 [1]	|
  0.004 [7736]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.007 [1304]	|■■■■■■■
  0.010 [589]	|■■■
  0.014 [200]	|■
  0.017 [65]	|
  0.021 [11]	|
  0.024 [39]	|
  0.028 [52]	|
  0.031 [1]	|
  0.034 [2]	|


Latency distribution:
  10% in 0.0002 secs
  25% in 0.0004 secs
  50% in 0.0009 secs
  75% in 0.0031 secs
  90% in 0.0068 secs
  95% in 0.0093 secs
  99% in 0.0188 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0000 secs, 0.0001 secs, 0.0344 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0001 secs, 0.0000 secs, 0.0095 secs
  resp wait:	0.0013 secs, 0.0000 secs, 0.0249 secs
  resp read:	0.0009 secs, 0.0000 secs, 0.0278 secs

Status code distribution:
  [200]	10000 responses



```

## Hey Results from actix_heavy_20251009_071526

```

Summary:
  Total:	28.0194 secs
  Slowest:	0.4992 secs
  Fastest:	0.0386 secs
  Average:	0.2770 secs
  Requests/sec:	356.8950
  
  Total data:	13288609025 bytes
  Size/request:	1328860 bytes

Response time histogram:
  0.039 [1]	|
  0.085 [3]	|
  0.131 [9]	|
  0.177 [27]	|
  0.223 [68]	|■
  0.269 [3986]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.315 [5271]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.361 [535]	|■■■■
  0.407 [67]	|■
  0.453 [26]	|
  0.499 [7]	|


Latency distribution:
  10% in 0.2545 secs
  25% in 0.2619 secs
  50% in 0.2728 secs
  75% in 0.2881 secs
  90% in 0.3049 secs
  95% in 0.3194 secs
  99% in 0.3611 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0001 secs, 0.0386 secs, 0.4992 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0001 secs, 0.0000 secs, 0.0094 secs
  resp wait:	0.2758 secs, 0.0375 secs, 0.4984 secs
  resp read:	0.0010 secs, 0.0003 secs, 0.0536 secs

Status code distribution:
  [200]	10000 responses



```

## Hey Results from axum_heavy_20251009_071149

```

Summary:
  Total:	30.6494 secs
  Slowest:	0.9900 secs
  Fastest:	0.0209 secs
  Average:	0.3002 secs
  Requests/sec:	326.2709
  
  Total data:	13288607810 bytes
  Size/request:	1328860 bytes

Response time histogram:
  0.021 [1]	|
  0.118 [669]	|■■■■■■■■
  0.215 [1908]	|■■■■■■■■■■■■■■■■■■■■■■■■
  0.312 [3189]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.409 [2370]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.505 [1195]	|■■■■■■■■■■■■■■■
  0.602 [445]	|■■■■■■
  0.699 [147]	|■■
  0.796 [46]	|■
  0.893 [17]	|
  0.990 [13]	|


Latency distribution:
  10% in 0.1440 secs
  25% in 0.2117 secs
  50% in 0.2898 secs
  75% in 0.3782 secs
  90% in 0.4677 secs
  95% in 0.5313 secs
  99% in 0.6724 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0001 secs, 0.0209 secs, 0.9900 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0001 secs, 0.0000 secs, 0.0102 secs
  resp wait:	0.2990 secs, 0.0202 secs, 0.9883 secs
  resp read:	0.0010 secs, 0.0003 secs, 0.0551 secs

Status code distribution:
  [200]	10000 responses



```

## Hey Results from axum_light_20251009_070958

```

Summary:
  Total:	0.2551 secs
  Slowest:	0.0187 secs
  Fastest:	0.0001 secs
  Average:	0.0024 secs
  Requests/sec:	39198.9099
  
  Total data:	1209973 bytes
  Size/request:	120 bytes

Response time histogram:
  0.000 [1]	|
  0.002 [5874]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.004 [2044]	|■■■■■■■■■■■■■■
  0.006 [1156]	|■■■■■■■■
  0.008 [618]	|■■■■
  0.009 [208]	|■
  0.011 [77]	|■
  0.013 [15]	|
  0.015 [1]	|
  0.017 [2]	|
  0.019 [4]	|


Latency distribution:
  10% in 0.0006 secs
  25% in 0.0009 secs
  50% in 0.0016 secs
  75% in 0.0033 secs
  90% in 0.0055 secs
  95% in 0.0068 secs
  99% in 0.0094 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0000 secs, 0.0001 secs, 0.0187 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0001 secs, 0.0000 secs, 0.0056 secs
  resp wait:	0.0016 secs, 0.0001 secs, 0.0093 secs
  resp read:	0.0006 secs, 0.0000 secs, 0.0104 secs

Status code distribution:
  [200]	10000 responses



```

## Hey Results from actix_heavy_20251009_071038

```

Summary:
  Total:	28.8954 secs
  Slowest:	0.4897 secs
  Fastest:	0.0249 secs
  Average:	0.2855 secs
  Requests/sec:	346.0762
  
  Total data:	13288609901 bytes
  Size/request:	1328860 bytes

Response time histogram:
  0.025 [1]	|
  0.071 [6]	|
  0.118 [15]	|
  0.164 [7]	|
  0.211 [28]	|
  0.257 [1021]	|■■■■■■
  0.304 [6913]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.350 [1714]	|■■■■■■■■■■
  0.397 [199]	|■
  0.443 [81]	|
  0.490 [15]	|


Latency distribution:
  10% in 0.2565 secs
  25% in 0.2678 secs
  50% in 0.2820 secs
  75% in 0.2991 secs
  90% in 0.3181 secs
  95% in 0.3330 secs
  99% in 0.3950 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0000 secs, 0.0249 secs, 0.4897 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0001 secs, 0.0000 secs, 0.0128 secs
  resp wait:	0.2843 secs, 0.0239 secs, 0.4878 secs
  resp read:	0.0010 secs, 0.0003 secs, 0.0495 secs

Status code distribution:
  [200]	10000 responses



```

# System Information

**CPU:** 13th Gen Intel(R) Core(TM) i7-1355U
**Cores:** 10
**Memory:** 19Gi

