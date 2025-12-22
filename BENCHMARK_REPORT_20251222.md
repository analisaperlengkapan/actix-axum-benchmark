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
    Latency     0.91ms    0.95ms  11.20ms   85.18%
    Req/Sec    31.90k     1.73k   37.51k    72.42%
  3818106 requests in 30.08s, 837.47MB read
Requests/sec: 126920.57
Transfer/sec:     27.84MB
```

### Actix Heavy Endpoint

```
Running 20s test @ http://127.0.0.1:8080/heavy
  2 threads and 50 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   192.21ms   14.53ms 300.77ms   91.74%
    Req/Sec   129.92     18.56   180.00     60.75%
  5194 requests in 20.07s, 6.43GB read
Requests/sec:    258.78
Transfer/sec:    328.02MB
```

### Axum Light Endpoint

```
Running 30s test @ http://127.0.0.1:8081/hello
  4 threads and 100 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     0.86ms  562.61us   8.05ms   73.32%
    Req/Sec    27.67k     1.45k   32.56k    71.92%
  3307856 requests in 30.04s, 725.55MB read
Requests/sec: 110123.46
Transfer/sec:     24.15MB
```

### Axum Heavy Endpoint

```
Running 20s test @ http://127.0.0.1:8081/heavy
  2 threads and 50 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   225.61ms   85.34ms 482.92ms   69.71%
    Req/Sec   110.48     18.78   161.00     58.00%
  4418 requests in 20.08s, 5.47GB read
Requests/sec:    220.06
Transfer/sec:    278.91MB
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
user	0m0.001s
sys	0m0.004s

real	0m0.005s
user	0m0.004s
sys	0m0.001s

real	0m0.005s
user	0m0.003s
sys	0m0.002s

real	0m0.005s
user	0m0.004s
sys	0m0.001s
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
user	0m0.003s
sys	0m0.002s

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
