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
    Latency     0.92ms  723.09us   9.73ms   77.41%
    Req/Sec    27.07k     0.93k   31.15k    82.17%
  3235451 requests in 30.04s, 1.18GB read
Requests/sec: 107698.32
Transfer/sec:     40.26MB
```

### Actix Heavy Endpoint

```
Running 20s test @ http://127.0.0.1:8080/heavy
  2 threads and 50 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   228.06ms   17.50ms 276.25ms   86.22%
    Req/Sec   109.36     21.43   170.00     68.75%
  4368 requests in 20.04s, 5.41GB read
Requests/sec:    217.94
Transfer/sec:    276.26MB
```

### Axum Light Endpoint

```
Running 30s test @ http://127.0.0.1:8081/hello
  4 threads and 100 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     1.00ms  638.95us   8.04ms   71.59%
    Req/Sec    23.80k     1.11k   29.72k    71.25%
  2845493 requests in 30.05s, 0.99GB read
Requests/sec:  94681.84
Transfer/sec:     33.68MB
```

### Axum Heavy Endpoint

```
Running 20s test @ http://127.0.0.1:8081/heavy
  2 threads and 50 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   251.53ms   93.62ms 527.45ms   69.15%
    Req/Sec    98.90     16.53   141.00     61.00%
  3952 requests in 20.04s, 4.89GB read
Requests/sec:    197.18
Transfer/sec:    249.93MB
```

## Docker Benchmark Results

### docker_actix_heavy.txt
```
unable to connect to localhost:8080 Connection refused
```

### docker_actix_individual.txt
```

real	0m0.006s
user	0m0.001s
sys	0m0.005s

real	0m0.006s
user	0m0.005s
sys	0m0.001s

real	0m0.005s
user	0m0.002s
sys	0m0.003s

real	0m0.005s
user	0m0.001s
sys	0m0.004s

real	0m0.006s
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

real	0m0.010s
user	0m0.005s
sys	0m0.005s

real	0m0.010s
user	0m0.005s
sys	0m0.005s

real	0m0.012s
user	0m0.003s
sys	0m0.008s

real	0m0.007s
user	0m0.003s
sys	0m0.004s

real	0m0.006s
user	0m0.002s
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
