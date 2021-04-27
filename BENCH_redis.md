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
wrk -t 16 -c 16 <url>
```

#### Results

> only those that worked with 16 cores & were comparatively fast

###### _all_ ->> `/retailers`

- Express / pm2 => 16939.28 (19358.41 return raw string)
- Nanoexpress / pm2 => 19588.33 (22696.53 returning raw string)
- Rust / Rocket => 15427.94

###### _show_ ->> `/retailer/42`

- Express / pm2 => 62808.93
- Nanoexpress / pm2 => 87688.64
- Rust / Rocket => 78079.65

