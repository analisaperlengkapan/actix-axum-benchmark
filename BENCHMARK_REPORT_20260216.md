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
    Latency   566.44us  432.54us   6.01ms   78.45%
    Req/Sec    44.66k     1.22k   50.43k    90.00%
  5334149 requests in 30.02s, 1.95GB read
Requests/sec: 177706.25
Transfer/sec:     66.43MB
```

### Actix Heavy Endpoint

```
Running 20s test @ http://127.0.0.1:8080/heavy
  2 threads and 50 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   199.39ms   13.77ms 243.41ms   90.59%
    Req/Sec   125.25     13.81   171.00     56.50%
  4996 requests in 20.03s, 6.18GB read
Requests/sec:    249.45
Transfer/sec:    316.20MB
```

### Axum Light Endpoint

```
Running 30s test @ http://127.0.0.1:8081/hello
  4 threads and 100 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   680.06us  388.66us   4.68ms   73.62%
    Req/Sec    35.58k     1.46k   42.46k    70.83%
  4249219 requests in 30.01s, 1.48GB read
Requests/sec: 141584.00
Transfer/sec:     50.36MB
```

### Axum Heavy Endpoint

```
Running 20s test @ http://127.0.0.1:8081/heavy
  2 threads and 50 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   226.24ms   87.64ms 492.47ms   68.56%
    Req/Sec   110.25     21.23   160.00     73.50%
  4401 requests in 20.03s, 5.45GB read
Requests/sec:    219.69
Transfer/sec:    278.47MB
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
sys	0m0.003s

real	0m0.004s
user	0m0.003s
sys	0m0.001s

real	0m0.004s
user	0m0.002s
sys	0m0.002s

real	0m0.004s
user	0m0.002s
sys	0m0.002s

real	0m0.004s
user	0m0.002s
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

real	0m0.004s
user	0m0.003s
sys	0m0.001s

real	0m0.004s
user	0m0.002s
sys	0m0.002s

real	0m0.004s
user	0m0.002s
sys	0m0.002s

real	0m0.004s
user	0m0.002s
sys	0m0.002s

real	0m0.004s
user	0m0.003s
sys	0m0.001s
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
