# AirMonitor-Feed

Data feed for [AirMonitor](https://air-monitor.pl) project.

### Instalation

Copy repository and install dependency gems with Bundler:

```bash
git clone https://github.com/mckomo/AirMonitor-Feed && cd AirMonitor-Feed && bundle install
```

Alternatively you can install `upload_measurements` globally:

```bash
ln -s bin/upload_measurements /usr/local/bin/upload_measurements
```

### Usage:

```bash
bin/upload_measurements [--from datetime] [--to datetime]
```

### Examples

Uploads measurements from the previous hour:

```bash
upload_measurements
```

Uploads measurements between given a two sequential datetimes:

```bash
upload_measurements --from "2016-01-01 12:00" --to "2016-02-01 12:00"
```