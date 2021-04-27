### Intel 10th-gen core i7-10700k

#### Environment

* New Home Workstation
* Intel 10th-gen core i7-10700k
* 64 GB Ram
* Arch Linux
* Python 3.7.10
* Node (JS) 15.10.0
* rustc 1.51

#### Benchmark command

```bash
wrk -t 16 -c 200 <url>
```

#### Results

> only those that worked with 16 cores & were comparatively fast

###### _all_ ->> `/retailers`

- Express / pm2 => 19040.29 (20249.68 return raw string)
- Nanoexpress / pm2 => 21760.57 (24822.44 returning raw string)
- Rust / Rocket => 15427.94

###### _show_ ->> `/retailer/42`

- Express / pm2 => 63898.91
- Nanoexpress / pm2 => 139525.76
- Rust / Rocket => 84048.81

