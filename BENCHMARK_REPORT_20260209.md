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
    Latency     1.00ms    0.95ms  10.12ms   83.19%
    Req/Sec    28.74k     1.54k   35.49k    69.50%
  3440790 requests in 30.09s, 1.26GB read
Requests/sec: 114359.24
Transfer/sec:     42.75MB
```

### Actix Heavy Endpoint

```
Running 20s test @ http://127.0.0.1:8080/heavy
  2 threads and 50 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   204.36ms   15.67ms 255.40ms   85.49%
    Req/Sec   122.17     11.74   150.00     65.50%
  4880 requests in 20.08s, 6.04GB read
Requests/sec:    243.08
Transfer/sec:    308.12MB
```

### Axum Light Endpoint

```
Running 30s test @ http://127.0.0.1:8081/hello
  4 threads and 100 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     1.00ms  635.34us   6.67ms   71.61%
    Req/Sec    23.95k     1.35k   28.25k    71.08%
  2864535 requests in 30.05s, 1.00GB read
Requests/sec:  95326.68
Transfer/sec:     33.91MB
```

### Axum Heavy Endpoint

```
Running 20s test @ http://127.0.0.1:8081/heavy
  2 threads and 50 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   230.64ms   86.66ms 558.34ms   67.69%
    Req/Sec   107.88     20.07   161.00     67.75%
  4316 requests in 20.07s, 5.34GB read
Requests/sec:    215.01
Transfer/sec:    272.54MB
```

## Docker Benchmark Results

### docker_actix_heavy.txt
```
unable to connect to localhost:8080 Connection refused
```

### docker_actix_individual.txt
```

real	0m0.005s
user	0m0.000s
sys	0m0.005s

real	0m0.005s
user	0m0.002s
sys	0m0.003s

real	0m0.005s
user	0m0.002s
sys	0m0.003s

real	0m0.005s
user	0m0.002s
sys	0m0.003s

real	0m0.005s
user	0m0.002s
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
sys	0m0.005s

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
