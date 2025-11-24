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
    Latency   808.03us  703.78us   8.10ms   83.54%
    Req/Sec    31.86k     1.48k   35.82k    75.17%
  3807439 requests in 30.04s, 835.13MB read
Requests/sec: 126765.74
Transfer/sec:     27.81MB
```

### Actix Heavy Endpoint

```
Running 20s test @ http://127.0.0.1:8080/heavy
  2 threads and 50 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   204.98ms   16.11ms 420.32ms   91.63%
    Req/Sec   121.77     19.25   171.00     69.50%
  4871 requests in 20.08s, 6.03GB read
Requests/sec:    242.56
Transfer/sec:    307.43MB
```

### Axum Light Endpoint

```
Running 30s test @ http://127.0.0.1:8081/hello
  4 threads and 100 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     0.86ms  568.26us   7.28ms   73.61%
    Req/Sec    27.75k     1.46k   35.90k    72.92%
  3317105 requests in 30.05s, 727.58MB read
Requests/sec: 110404.51
Transfer/sec:     24.22MB
```

### Axum Heavy Endpoint

```
Running 20s test @ http://127.0.0.1:8081/heavy
  2 threads and 50 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   226.99ms   82.98ms 441.23ms   68.32%
    Req/Sec   109.79     20.51   174.00     75.25%
  4388 requests in 20.05s, 5.43GB read
Requests/sec:    218.82
Transfer/sec:    277.34MB
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

real	0m0.006s
user	0m0.002s
sys	0m0.004s

real	0m0.005s
user	0m0.003s
sys	0m0.002s

real	0m0.005s
user	0m0.001s
sys	0m0.004s

real	0m0.005s
user	0m0.003s
sys	0m0.002s
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

real	0m0.005s
user	0m0.003s
sys	0m0.002s

real	0m0.005s
user	0m0.001s
sys	0m0.004s

real	0m0.005s
user	0m0.001s
sys	0m0.004s

real	0m0.005s
user	0m0.003s
sys	0m0.002s

real	0m0.005s
user	0m0.001s
sys	0m0.004s
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
