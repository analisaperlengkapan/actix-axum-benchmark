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
    Latency     0.93ms    0.95ms  15.56ms   84.58%
    Req/Sec    31.33k     2.04k   38.11k    70.25%
  3750295 requests in 30.09s, 822.60MB read
Requests/sec: 124654.68
Transfer/sec:     27.34MB
```

### Actix Heavy Endpoint

```
Running 20s test @ http://127.0.0.1:8080/heavy
  2 threads and 50 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   194.71ms   13.92ms 397.36ms   89.35%
    Req/Sec   128.19     17.29   178.00     66.50%
  5127 requests in 20.08s, 6.35GB read
Requests/sec:    255.27
Transfer/sec:    323.53MB
```

### Axum Light Endpoint

```
Running 30s test @ http://127.0.0.1:8081/hello
  4 threads and 100 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     0.88ms  576.38us   6.96ms   73.52%
    Req/Sec    27.35k     1.46k   32.20k    70.33%
  3268780 requests in 30.04s, 716.98MB read
Requests/sec: 108811.67
Transfer/sec:     23.87MB
```

### Axum Heavy Endpoint

```
Running 20s test @ http://127.0.0.1:8081/heavy
  2 threads and 50 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   221.63ms   80.10ms 469.35ms   69.18%
    Req/Sec   112.55     19.38   202.00     74.69%
  4498 requests in 20.08s, 5.57GB read
Requests/sec:    224.04
Transfer/sec:    283.95MB
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
user	0m0.000s
sys	0m0.005s

real	0m0.005s
user	0m0.001s
sys	0m0.004s

real	0m0.005s
user	0m0.003s
sys	0m0.002s

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
