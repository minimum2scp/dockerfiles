# magellan-tdiary

[tDiary](http://www.tdiary.org/) on [MAGELLAN](http://www.magellanic-clouds.com/)

[minimum2scp/magellan-tdiary image on Docker Hub](https://hub.docker.com/r/minimum2scp/magellan-tdiary/)

## Deploy magellan-tdiary on MAGELLAN

(TODO)

## Environment Variables

### Basic Authentication

magellan-tdiary creates .htpasswd by environment variables:

 * `TDIARY_BASIC_AUTH_USERNAME` (default: `tdiary`)
 * `TDIARY_BASIC_AUTH_PASSWORD` (default: `tdiary`)

### CSRF Protection

magellan-tdiary CSRF protection is configured by environment variables:

 * `TDIARY_CSRF_PROTECTION_METHOD` (default: `2`)
 * `TDIARY_CSRF_PROTECTION_KEY` (default: `FAKE_CSRF_PROTECTION_KEY`)
 * `TDIARY_CSRF_PROTECTION_ALLOWED_REFERER_REGEXP_FOR_UPDATE` (default is empty)

see tdiary.conf.sample, tdiary.conf.samle-en in https://github.com/tdiary/tdiary-core for details.

### Database

magellan-tdiary stores data into MySQL database using [tdiary-io-rdb](https://github.com/tdiary/tdiary-io-rdb) gem.
MySQL connection is configured by environment variables:

 * `MYSQL_HOST` (optional)
 * `MYSQL_PORT` (optional)
 * `MYSQL_DATABASE` (optional)
 * `MYSQL_USERNAME` (optional)
 * `MYSQL_PASSWORD` (optional)

When `MYSQL_*` are not set, magellan-tdiary stores data into local file in `/usr/src/app/data/` directory.
That means:

 * The data will be inconsistent when 2 or more magellan-tdiary containers are running
 * The data will be lost when magellan-tdiary containers stop

### New Relic

magellan-tdiary includes newrelic_rpm gem for application monitoring.

You can provide config options by environment variables
with the prefix `NEW_RELIC_`, for example:

 * `NEW_RELIC_LICENSE_KEY` (optional)
 * `NEW_RELIC_AGENT_ENABLED` (optional)
 * `NEW_RELIC_APP_NAME` (optional)

see https://docs.newrelic.com/docs/agents/ruby-agent/installation-configuration/ruby-agent-configuration#Options for details.

### rack-mini-profiler

magellan-tdiary includes rack-mini-profiler, flamegraph gem for profiling.
You can configure rack-mini-profiler by environment vaiables:

 * `RACK_MINI_PROFILER_ENABLED` (default: `true`)

magellan-tdiary requires Basic Authentication to view rack-mini-profiler.

### Ruby GC::Profiler

magellan-tdiary enables Ruby garbage collection instrumentation by
environment variable:

 * `RUBY_GC_PROFILER_ENABLED` (default: `true`)

## Local test with docker-compose

You can try tDiary with docker-compose:

```
% docker-compose up -d 
Creating magellantdiary_db_1...
Creating magellantdiary_tdiary_1...
Creating magellantdiary_nginx_1...
% docker-compose ps
Name                        Command               State        Ports      
----------------------------------------------------------------------------------
magellantdiary_db_1       /entrypoint.sh mysqld            Up      3306/tcp        
magellantdiary_nginx_1    /opt/entrypoint nginx -g d ...   Up      443/tcp, 80/tcp 
magellantdiary_tdiary_1   /opt/magellan-tdiary/entry ...   Up      80/tcp          
% docker-compose scale tdiary=3
Creating and starting 2... done
Creating and starting 3... done
% docker-compose restart nginx
Restarting magellantdiary_nginx_1...
% docker-compose ps
Name                        Command               State        Ports      
----------------------------------------------------------------------------------
magellantdiary_db_1       /entrypoint.sh mysqld            Up      3306/tcp        
magellantdiary_nginx_1    /opt/entrypoint nginx -g d ...   Up      443/tcp, 80/tcp 
magellantdiary_tdiary_1   /opt/magellan-tdiary/entry ...   Up      80/tcp          
magellantdiary_tdiary_2   /opt/magellan-tdiary/entry ...   Up      80/tcp          
magellantdiary_tdiary_3   /opt/magellan-tdiary/entry ...   Up      80/tcp    
```

See docker-compose.yml for details.


