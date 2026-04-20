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
    Latency     0.89ms  796.72us  13.52ms   86.95%
    Req/Sec    28.89k     3.25k   42.44k    69.33%
  3452421 requests in 30.02s, 1.26GB read
Requests/sec: 114996.03
Transfer/sec:     42.99MB
```

### Actix Heavy Endpoint

```
Running 20s test @ http://127.0.0.1:8080/heavy
  2 threads and 50 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   173.38ms   13.50ms 356.43ms   87.41%
    Req/Sec   144.00     15.85   190.00     66.50%
  5758 requests in 20.06s, 7.13GB read
Requests/sec:    286.99
Transfer/sec:    363.78MB
```

### Axum Light Endpoint

```
Running 30s test @ http://127.0.0.1:8081/hello
  4 threads and 100 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     1.07ms  709.48us   8.16ms   72.17%
    Req/Sec    23.34k     1.77k   29.30k    73.33%
  2790915 requests in 30.05s, 0.97GB read
Requests/sec:  92866.33
Transfer/sec:     33.03MB
```

### Axum Heavy Endpoint

```
Running 20s test @ http://127.0.0.1:8081/heavy
  2 threads and 50 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   187.69ms   69.95ms 389.12ms   67.54%
    Req/Sec   132.97     19.44   227.00     74.50%
  5317 requests in 20.07s, 6.58GB read
Requests/sec:    264.94
Transfer/sec:    335.82MB
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
user	0m0.003s
sys	0m0.002s

real	0m0.005s
user	0m0.001s
sys	0m0.004s

real	0m0.005s
user	0m0.002s
sys	0m0.003s

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
user	0m0.002s
sys	0m0.003s

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
