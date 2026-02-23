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
    Latency     0.90ms  833.14us   9.22ms   85.20%
    Req/Sec    29.95k     1.69k   35.26k    76.25%
  3580498 requests in 30.05s, 1.31GB read
Requests/sec: 119155.57
Transfer/sec:     44.54MB
```

### Actix Heavy Endpoint

```
Running 20s test @ http://127.0.0.1:8080/heavy
  2 threads and 50 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   200.76ms   15.62ms 381.33ms   89.16%
    Req/Sec   124.32     29.51   191.00     64.50%
  4971 requests in 20.06s, 6.15GB read
Requests/sec:    247.80
Transfer/sec:    314.10MB
```

### Axum Light Endpoint

```
Running 30s test @ http://127.0.0.1:8081/hello
  4 threads and 100 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     1.01ms  636.96us   8.56ms   72.01%
    Req/Sec    23.87k     1.36k   27.72k    69.75%
  2853449 requests in 30.05s, 0.99GB read
Requests/sec:  94954.91
Transfer/sec:     33.78MB
```

### Axum Heavy Endpoint

```
Running 20s test @ http://127.0.0.1:8081/heavy
  2 threads and 50 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   227.80ms   90.61ms 557.03ms   66.17%
    Req/Sec   109.53     21.65   161.00     74.00%
  4383 requests in 20.09s, 5.43GB read
Requests/sec:    218.22
Transfer/sec:    276.61MB
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
user	0m0.003s
sys	0m0.002s

real	0m0.006s
user	0m0.001s
sys	0m0.004s

real	0m0.005s
user	0m0.000s
sys	0m0.005s

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
user	0m0.000s
sys	0m0.005s

real	0m0.005s
user	0m0.001s
sys	0m0.004s

real	0m0.005s
user	0m0.001s
sys	0m0.004s

real	0m0.005s
user	0m0.002s
sys	0m0.003s

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
