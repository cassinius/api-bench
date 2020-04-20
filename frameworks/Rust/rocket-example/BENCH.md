# Rust rocket.rs benchmarks

## `/hello/<name>/<age>`


### `debug`

#### Command

* 8 Workers
```bash
 ab -n 10000 -c 8 http://localhost:8000/hello/Mr.%20Monk/255
```

#### `start` output

Configured for development.
    => address: localhost
    => port: 8000
    => log: normal
    => workers: 8
    => secret key: generated
    => limits: forms = 32KiB
    => keep-alive: 5s
    => tls: disabled

#### Results (best of 3)

Server Software:        Rocket
Server Hostname:        localhost
Server Port:            8000

Document Path:          /hello/Mr.%20Monk/255
Document Length:        35 bytes

Concurrency Level:      8
Time taken for tests:   6.941 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      1870000 bytes
HTML transferred:       350000 bytes
Requests per second:    1440.74 [#/sec] (mean)
Time per request:       5.553 [ms] (mean)
Time per request:       0.694 [ms] (mean, across all concurrent requests)
Transfer rate:          263.10 [Kbytes/sec] received


### `release`

#### Command

* 8 workers
```bash
 ab -n 10000 -c 8 http://localhost:8000/hello/Mr.%20Monk/255
```

#### `start` output

Configured for production.
    => address: 0.0.0.0
    => port: 8000
    => log: critical
    => workers: 8
    => secret key: generated
    => limits: forms = 32KiB
    => keep-alive: 5s
    => tls: disabled

#### Results (best of 3)

Server Software:        Rocket
Server Hostname:        localhost
Server Port:            8000

Document Path:          /hello/Mr.%20Monk/255
Document Length:        35 bytes

Concurrency Level:      8
Time taken for tests:   2.023 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      1870000 bytes
HTML transferred:       350000 bytes
Requests per second:    4943.11 [#/sec] (mean)
Time per request:       1.618 [ms] (mean)
Time per request:       0.202 [ms] (mean, across all concurrent requests)
Transfer rate:          902.70 [Kbytes/sec] received

