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
    Latency     0.99ms    0.87ms  11.06ms   81.28%
    Req/Sec    26.72k     1.41k   33.75k    75.67%
  3196860 requests in 30.07s, 1.17GB read
Requests/sec: 106316.40
Transfer/sec:     39.75MB
```

### Actix Heavy Endpoint

```
Running 20s test @ http://127.0.0.1:8080/heavy
  2 threads and 50 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   225.79ms   17.72ms 276.32ms   86.22%
    Req/Sec   110.52     15.90   151.00     63.50%
  4413 requests in 20.05s, 5.46GB read
Requests/sec:    220.11
Transfer/sec:    279.01MB
```

### Axum Light Endpoint

```
Running 30s test @ http://127.0.0.1:8081/hello
  4 threads and 100 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     1.01ms  644.23us   7.62ms   71.33%
    Req/Sec    23.64k     1.15k   27.45k    71.33%
  2827674 requests in 30.06s, 0.98GB read
Requests/sec:  94077.15
Transfer/sec:     33.46MB
```

### Axum Heavy Endpoint

```
Running 20s test @ http://127.0.0.1:8081/heavy
  2 threads and 50 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   246.65ms   93.62ms 533.98ms   68.91%
    Req/Sec   100.96     17.65   151.00     61.00%
  4033 requests in 20.04s, 4.99GB read
Requests/sec:    201.28
Transfer/sec:    255.19MB
```

## Docker Benchmark Results

### docker_actix_heavy.txt
```
unable to connect to localhost:8080 Connection refused
```

### docker_actix_individual.txt
```

real	0m0.005s
user	0m0.003s
sys	0m0.002s

real	0m0.005s
user	0m0.003s
sys	0m0.003s

real	0m0.005s
user	0m0.002s
sys	0m0.003s

real	0m0.005s
user	0m0.002s
sys	0m0.003s

real	0m0.005s
user	0m0.000s
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
user	0m0.002s
sys	0m0.004s

real	0m0.005s
user	0m0.002s
sys	0m0.003s

real	0m0.005s
user	0m0.000s
sys	0m0.005s

real	0m0.005s
user	0m0.004s
sys	0m0.001s

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
