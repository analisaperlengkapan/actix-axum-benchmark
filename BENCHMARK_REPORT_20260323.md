# Weekly Benchmark Report

**Date:** $(date +%Y-%m-%d)
**System:** GitHub Actions Runner (ubuntu-latest)

## Summary

This report contains automated benchmark results comparing Actix and Axum web frameworks.

## Benchmark Results

### Actix Light Endpoint

```
Running 30s test @ http://127.0.0.1:8080/hello
  4 threads and 100 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     0.89ms  656.84us  14.79ms   78.57%
    Req/Sec    27.14k     0.98k   30.54k    86.92%
  3241970 requests in 30.03s, 1.18GB read
Requests/sec: 107954.05
Transfer/sec:     40.36MB
```

### Actix Heavy Endpoint

```
Running 20s test @ http://127.0.0.1:8080/heavy
  2 threads and 50 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   227.46ms   17.22ms 283.65ms   88.20%
    Req/Sec   109.67     15.44   151.00     67.50%
  4381 requests in 20.05s, 5.42GB read
Requests/sec:    218.47
Transfer/sec:    276.92MB
```

### Axum Light Endpoint

```
Running 30s test @ http://127.0.0.1:8081/hello
  4 threads and 100 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     1.00ms  642.13us   7.32ms   71.68%
    Req/Sec    23.88k     1.21k   30.38k    70.33%
  2855852 requests in 30.06s, 0.99GB read
Requests/sec:  95004.35
Transfer/sec:     33.79MB
```

### Axum Heavy Endpoint

```
Running 20s test @ http://127.0.0.1:8081/heavy
  2 threads and 50 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   244.71ms   89.67ms 509.18ms   68.48%
    Req/Sec   101.77     17.17   151.00     67.00%
  4069 requests in 20.06s, 5.04GB read
Requests/sec:    202.86
Transfer/sec:    257.13MB
```

## Docker Benchmark Results

### docker_actix_heavy.txt
```
unable to connect to localhost:8080 Connection refused
```

### docker_actix_individual.txt
```

real	0m0.005s
user	0m0.002s
sys	0m0.003s

real	0m0.005s
user	0m0.000s
sys	0m0.006s

real	0m0.005s
user	0m0.002s
sys	0m0.003s

real	0m0.005s
user	0m0.003s
sys	0m0.002s

real	0m0.005s
user	0m0.003s
sys	0m0.003s
```

### docker_actix_light.txt
```
unable to connect to localhost:8080 Connection refused
```

### docker_axum_heavy.txt
```
unable to connect to localhost:8081 Connection refused
```

### docker_axum_individual.txt
```

real	0m0.006s
user	0m0.001s
sys	0m0.004s

real	0m0.005s
user	0m0.002s
sys	0m0.003s

real	0m0.006s
user	0m0.002s
sys	0m0.004s

real	0m0.005s
user	0m0.004s
sys	0m0.001s

real	0m0.005s
user	0m0.000s
sys	0m0.005s
```

### docker_axum_light.txt
```
unable to connect to localhost:8081 Connection refused
```


## Notes

- Benchmarks run on GitHub Actions runner (ubuntu-latest)
- Results may vary based on runner load and available resources
- For production comparisons, run benchmarks on dedicated hardware

---
*Generated automatically by GitHub Actions*
