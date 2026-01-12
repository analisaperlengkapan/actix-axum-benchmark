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
    Latency   832.61us  654.29us   9.35ms   78.30%
    Req/Sec    29.77k     1.34k   33.16k    77.75%
  3556577 requests in 30.02s, 1.30GB read
Requests/sec: 118455.91
Transfer/sec:     44.28MB
```

### Actix Heavy Endpoint

```
Running 20s test @ http://127.0.0.1:8080/heavy
  2 threads and 50 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   196.43ms   15.10ms 432.55ms   88.79%
    Req/Sec   127.04     26.68   191.00     67.50%
  5083 requests in 20.09s, 6.29GB read
Requests/sec:    253.06
Transfer/sec:    320.77MB
```

### Axum Light Endpoint

```
Running 30s test @ http://127.0.0.1:8081/hello
  4 threads and 100 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     1.00ms  629.93us   7.95ms   71.42%
    Req/Sec    24.05k     1.29k   28.43k    68.42%
  2875311 requests in 30.04s, 1.00GB read
Requests/sec:  95712.31
Transfer/sec:     34.05MB
```

### Axum Heavy Endpoint

```
Running 20s test @ http://127.0.0.1:8081/heavy
  2 threads and 50 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   233.05ms   87.26ms 505.36ms   69.21%
    Req/Sec   106.84     20.02   160.00     69.00%
  4272 requests in 20.05s, 5.29GB read
Requests/sec:    213.04
Transfer/sec:    270.04MB
```

## Docker Benchmark Results

### docker_actix_heavy.txt
```
unable to connect to localhost:8080 Connection refused
```

### docker_actix_individual.txt
```

real	0m0.006s
user	0m0.003s
sys	0m0.003s

real	0m0.006s
user	0m0.003s
sys	0m0.003s

real	0m0.006s
user	0m0.002s
sys	0m0.004s

real	0m0.006s
user	0m0.002s
sys	0m0.003s

real	0m0.006s
user	0m0.001s
sys	0m0.005s
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
sys	0m0.005s

real	0m0.006s
user	0m0.003s
sys	0m0.002s

real	0m0.005s
user	0m0.002s
sys	0m0.003s

real	0m0.005s
user	0m0.002s
sys	0m0.003s

real	0m0.006s
user	0m0.002s
sys	0m0.003s
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
