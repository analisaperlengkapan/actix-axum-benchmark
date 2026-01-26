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
    Latency     0.95ms    0.93ms  10.39ms   84.98%
    Req/Sec    29.61k     1.77k   35.22k    70.92%
  3542255 requests in 30.06s, 1.29GB read
Requests/sec: 117843.93
Transfer/sec:     44.05MB
```

### Actix Heavy Endpoint

```
Running 20s test @ http://127.0.0.1:8080/heavy
  2 threads and 50 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   210.37ms   15.83ms 282.04ms   89.04%
    Req/Sec   118.57     15.23   160.00     65.41%
  4736 requests in 20.07s, 5.86GB read
Requests/sec:    235.94
Transfer/sec:    299.06MB
```

### Axum Light Endpoint

```
Running 30s test @ http://127.0.0.1:8081/hello
  4 threads and 100 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     0.99ms  635.99us   7.47ms   71.47%
    Req/Sec    24.15k     1.32k   28.77k    70.67%
  2887855 requests in 30.05s, 1.00GB read
Requests/sec:  96090.37
Transfer/sec:     34.18MB
```

### Axum Heavy Endpoint

```
Running 20s test @ http://127.0.0.1:8081/heavy
  2 threads and 50 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   244.00ms   94.73ms 530.84ms   67.45%
    Req/Sec   102.04     18.08   150.00     68.00%
  4088 requests in 20.09s, 5.06GB read
Requests/sec:    203.44
Transfer/sec:    257.87MB
```

## Docker Benchmark Results

### docker_actix_heavy.txt
```
unable to connect to localhost:8080 Connection refused
```

### docker_actix_individual.txt
```

real	0m0.006s
user	0m0.004s
sys	0m0.003s

real	0m0.006s
user	0m0.001s
sys	0m0.005s

real	0m0.006s
user	0m0.003s
sys	0m0.003s

real	0m0.006s
user	0m0.003s
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
sys	0m0.004s

real	0m0.006s
user	0m0.004s
sys	0m0.002s

real	0m0.006s
user	0m0.001s
sys	0m0.005s

real	0m0.006s
user	0m0.001s
sys	0m0.005s

real	0m0.006s
user	0m0.003s
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
