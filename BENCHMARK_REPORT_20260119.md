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
    Latency   707.81us  737.38us   8.86ms   84.47%
    Req/Sec    45.06k     2.30k   65.91k    73.83%
  5394209 requests in 30.10s, 1.97GB read
Requests/sec: 179207.57
Transfer/sec:     66.99MB
```

### Actix Heavy Endpoint

```
Running 20s test @ http://127.0.0.1:8080/heavy
  2 threads and 50 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   191.68ms   13.76ms 218.58ms   87.41%
    Req/Sec   130.28     17.28   181.00     63.50%
  5204 requests in 20.06s, 6.44GB read
Requests/sec:    259.36
Transfer/sec:    328.75MB
```

### Axum Light Endpoint

```
Running 30s test @ http://127.0.0.1:8081/hello
  4 threads and 100 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   658.15us  342.57us   4.25ms   74.92%
    Req/Sec    36.66k     1.44k   41.55k    72.42%
  4378937 requests in 30.01s, 1.52GB read
Requests/sec: 145908.40
Transfer/sec:     51.90MB
```

### Axum Heavy Endpoint

```
Running 20s test @ http://127.0.0.1:8081/heavy
  2 threads and 50 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   223.34ms   82.86ms 451.48ms   68.38%
    Req/Sec   111.67     19.12   181.00     62.50%
  4461 requests in 20.06s, 5.52GB read
Requests/sec:    222.40
Transfer/sec:    281.90MB
```

## Docker Benchmark Results

### docker_actix_heavy.txt
```
unable to connect to localhost:8080 Connection refused
```

### docker_actix_individual.txt
```

real	0m0.004s
user	0m0.001s
sys	0m0.003s

real	0m0.004s
user	0m0.002s
sys	0m0.002s

real	0m0.004s
user	0m0.001s
sys	0m0.003s

real	0m0.004s
user	0m0.003s
sys	0m0.001s

real	0m0.004s
user	0m0.003s
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
user	0m0.000s
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
