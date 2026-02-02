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
    Latency     0.98ms    1.01ms  14.60ms   84.45%
    Req/Sec    30.20k     2.07k   42.74k    75.50%
  3614906 requests in 30.09s, 1.32GB read
Requests/sec: 120121.48
Transfer/sec:     44.91MB
```

### Actix Heavy Endpoint

```
Running 20s test @ http://127.0.0.1:8080/heavy
  2 threads and 50 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   200.97ms   15.18ms 403.61ms   89.99%
    Req/Sec   124.23     13.50   160.00     58.25%
  4974 requests in 20.10s, 6.16GB read
Requests/sec:    247.44
Transfer/sec:    313.65MB
```

### Axum Light Endpoint

```
Running 30s test @ http://127.0.0.1:8081/hello
  4 threads and 100 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     0.99ms  629.47us   7.41ms   71.43%
    Req/Sec    24.32k     1.29k   30.16k    70.75%
  2908466 requests in 30.05s, 1.01GB read
Requests/sec:  96774.06
Transfer/sec:     34.42MB
```

### Axum Heavy Endpoint

```
Running 20s test @ http://127.0.0.1:8081/heavy
  2 threads and 50 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   225.64ms   81.62ms 481.66ms   68.63%
    Req/Sec   110.31     17.82   171.00     66.50%
  4419 requests in 20.09s, 5.47GB read
Requests/sec:    219.91
Transfer/sec:    278.75MB
```

## Docker Benchmark Results

### docker_actix_heavy.txt
```
unable to connect to localhost:8080 Connection refused
```

### docker_actix_individual.txt
```

real	0m0.005s
user	0m0.001s
sys	0m0.004s

real	0m0.005s
user	0m0.002s
sys	0m0.003s

real	0m0.005s
user	0m0.002s
sys	0m0.003s

real	0m0.005s
user	0m0.003s
sys	0m0.002s

real	0m0.005s
user	0m0.001s
sys	0m0.004s
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
user	0m0.002s
sys	0m0.003s

real	0m0.005s
user	0m0.002s
sys	0m0.003s

real	0m0.005s
user	0m0.001s
sys	0m0.004s

real	0m0.005s
user	0m0.003s
sys	0m0.002s
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
