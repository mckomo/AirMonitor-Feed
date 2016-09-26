# AirMonitor-Feed

Data feed for [AirMonitor](https://air-monitor.pl) project.


### Usage:

```
$ upload_measurements [--from datetime] [--to datetime]
```

### Examples:

```
$ upload_measurements # Uploads measurements from a previous hour
$ upload_measurements --from "2016-01-01 12:00" --to "2016-02-01 12:00" # Uploads measurements between given two datetimes
```

