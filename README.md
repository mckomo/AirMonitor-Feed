# AirMonitor-Feed

[![Build Status](https://travis-ci.org/mckomo/AirMonitor-Feed.svg?branch=master)](https://travis-ci.org/mckomo/AirMonitor-Feed)

Data feed for [AirMonitor](https://air-monitor.pl) project.

### Instalation

Copy repository and install dependency gems with [Bundler](http://bundler.io):

```bash
git clone https://github.com/mckomo/AirMonitor-Feed && cd AirMonitor-Feed && bundle install
```

Alternatively you can install `upload_measurements` globally:

```bash
ln -s bin/upload_measurements /usr/local/bin/upload_measurements
```

Lastly, create `.env` file in the project root with following contents:

```bash
AUTHENTICATION_TOKEN=past_here_your_access_token
```

Now, you are ready to go :thumbsup:.

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
