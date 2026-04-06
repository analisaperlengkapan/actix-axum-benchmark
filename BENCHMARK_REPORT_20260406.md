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
    Latency   815.28us  602.61us   8.64ms   74.77%
    Req/Sec    30.09k     1.19k   33.11k    79.08%
  3595407 requests in 30.03s, 1.31GB read
Requests/sec: 119740.12
Transfer/sec:     44.76MB
```

### Actix Heavy Endpoint

```
Running 20s test @ http://127.0.0.1:8080/heavy
  2 threads and 50 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   171.74ms   12.76ms 258.85ms   83.81%
    Req/Sec   145.33     29.85   220.00     64.50%
  5805 requests in 20.05s, 7.19GB read
Requests/sec:    289.57
Transfer/sec:    367.08MB
```

### Axum Light Endpoint

```
Running 30s test @ http://127.0.0.1:8081/hello
  4 threads and 100 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     1.05ms  706.23us  10.01ms   72.52%
    Req/Sec    23.84k     1.68k   29.11k    75.83%
  2851284 requests in 30.05s, 0.99GB read
Requests/sec:  94889.84
Transfer/sec:     33.75MB
```

### Axum Heavy Endpoint

```
Running 20s test @ http://127.0.0.1:8081/heavy
  2 threads and 50 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   196.16ms   71.73ms 421.42ms   68.58%
    Req/Sec   127.18     18.99   180.00     69.75%
  5077 requests in 20.04s, 6.28GB read
Requests/sec:    253.32
Transfer/sec:    321.09MB
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
user	0m0.004s
sys	0m0.001s

real	0m0.005s
user	0m0.002s
sys	0m0.003s

real	0m0.005s
user	0m0.001s
sys	0m0.004s

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

real	0m0.005s
user	0m0.000s
sys	0m0.005s

real	0m0.005s
user	0m0.001s
sys	0m0.004s

real	0m0.004s
user	0m0.002s
sys	0m0.002s

real	0m0.005s
user	0m0.002s
sys	0m0.003s

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
