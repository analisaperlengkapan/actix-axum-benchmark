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
    Latency   648.38us  591.42us   8.29ms   84.54%
    Req/Sec    42.99k     2.00k   54.08k    73.67%
  5138043 requests in 30.04s, 1.88GB read
Requests/sec: 171041.73
Transfer/sec:     63.94MB
```

### Actix Heavy Endpoint

```
Running 20s test @ http://127.0.0.1:8080/heavy
  2 threads and 50 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   160.96ms   11.19ms 197.14ms   81.72%
    Req/Sec   155.18     26.26   222.00     71.50%
  6194 requests in 20.03s, 7.67GB read
Requests/sec:    309.28
Transfer/sec:    392.03MB
```

### Axum Light Endpoint

```
Running 30s test @ http://127.0.0.1:8081/hello
  4 threads and 100 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   731.68us  532.77us   7.20ms   78.18%
    Req/Sec    35.55k     2.44k   42.59k    74.58%
  4249204 requests in 30.04s, 1.48GB read
Requests/sec: 141456.77
Transfer/sec:     50.32MB
```

### Axum Heavy Endpoint

```
Running 20s test @ http://127.0.0.1:8081/heavy
  2 threads and 50 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   186.16ms   68.28ms 449.39ms   68.79%
    Req/Sec   134.07     19.22   202.00     73.75%
  5351 requests in 20.03s, 6.62GB read
Requests/sec:    267.16
Transfer/sec:    338.66MB
```

## Docker Benchmark Results

### docker_actix_heavy.txt
```
unable to connect to localhost:8080 Connection refused
```

### docker_actix_individual.txt
```

real	0m0.004s
user	0m0.002s
sys	0m0.002s

real	0m0.004s
user	0m0.002s
sys	0m0.002s

real	0m0.004s
user	0m0.002s
sys	0m0.001s

real	0m0.004s
user	0m0.002s
sys	0m0.001s

real	0m0.004s
user	0m0.004s
sys	0m0.000s
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

real	0m0.004s
user	0m0.002s
sys	0m0.002s

real	0m0.004s
user	0m0.002s
sys	0m0.002s

real	0m0.004s
user	0m0.001s
sys	0m0.003s

real	0m0.004s
user	0m0.002s
sys	0m0.002s

real	0m0.004s
user	0m0.001s
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
