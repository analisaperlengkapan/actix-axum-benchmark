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
    Latency     0.87ms  650.45us   9.52ms   73.94%
    Req/Sec    27.94k     0.97k   34.10k    87.08%
  3338652 requests in 30.04s, 1.22GB read
Requests/sec: 111156.00
Transfer/sec:     41.55MB
```

### Actix Heavy Endpoint

```
Running 20s test @ http://127.0.0.1:8080/heavy
  2 threads and 50 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   226.55ms   16.53ms 462.95ms   92.80%
    Req/Sec   110.15     18.43   161.00     57.25%
  4400 requests in 20.06s, 5.45GB read
Requests/sec:    219.38
Transfer/sec:    278.08MB
```

### Axum Light Endpoint

```
Running 30s test @ http://127.0.0.1:8081/hello
  4 threads and 100 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     1.00ms  643.47us   9.08ms   71.63%
    Req/Sec    23.85k     1.13k   27.63k    72.42%
  2852346 requests in 30.05s, 0.99GB read
Requests/sec:  94919.91
Transfer/sec:     33.76MB
```

### Axum Heavy Endpoint

```
Running 20s test @ http://127.0.0.1:8081/heavy
  2 threads and 50 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   244.01ms   89.53ms 530.54ms   68.63%
    Req/Sec   102.07     18.50   151.00     66.75%
  4079 requests in 20.04s, 5.05GB read
Requests/sec:    203.50
Transfer/sec:    257.98MB
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
user	0m0.003s
sys	0m0.002s

real	0m0.006s
user	0m0.003s
sys	0m0.003s

real	0m0.005s
user	0m0.002s
sys	0m0.003s

real	0m0.006s
user	0m0.002s
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

real	0m0.006s
user	0m0.003s
sys	0m0.003s

real	0m0.006s
user	0m0.003s
sys	0m0.003s

real	0m0.006s
user	0m0.004s
sys	0m0.002s

real	0m0.006s
user	0m0.004s
sys	0m0.002s

real	0m0.005s
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
