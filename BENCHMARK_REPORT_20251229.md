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
    Latency   779.79us  618.25us   8.78ms   79.97%
    Req/Sec    31.70k     1.65k   36.61k    80.75%
  3786990 requests in 30.02s, 830.65MB read
Requests/sec: 126131.91
Transfer/sec:     27.67MB
```

### Actix Heavy Endpoint

```
Running 20s test @ http://127.0.0.1:8080/heavy
  2 threads and 50 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   202.28ms   15.19ms 239.28ms   84.03%
    Req/Sec   123.38     20.47   174.00     58.90%
  4929 requests in 20.09s, 6.10GB read
Requests/sec:    245.36
Transfer/sec:    310.97MB
```

### Axum Light Endpoint

```
Running 30s test @ http://127.0.0.1:8081/hello
  4 threads and 100 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     0.89ms  580.65us   6.51ms   73.09%
    Req/Sec    27.06k     1.44k   31.46k    71.33%
  3234618 requests in 30.04s, 709.49MB read
Requests/sec: 107679.32
Transfer/sec:     23.62MB
```

### Axum Heavy Endpoint

```
Running 20s test @ http://127.0.0.1:8081/heavy
  2 threads and 50 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   216.55ms   76.28ms 433.40ms   67.82%
    Req/Sec   115.14     20.29   170.00     70.50%
  4611 requests in 20.10s, 5.71GB read
Requests/sec:    229.43
Transfer/sec:    290.78MB
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
user	0m0.002s
sys	0m0.004s

real	0m0.006s
user	0m0.004s
sys	0m0.002s

real	0m0.006s
user	0m0.003s
sys	0m0.002s

real	0m0.006s
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
user	0m0.001s
sys	0m0.004s

real	0m0.005s
user	0m0.001s
sys	0m0.004s

real	0m0.005s
user	0m0.001s
sys	0m0.004s

real	0m0.005s
user	0m0.001s
sys	0m0.004s

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
