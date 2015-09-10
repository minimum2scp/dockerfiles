# magellan-tdiary

[tDiary](http://www.tdiary.org/) on [MAGELLAN](http://www.magellanic-clouds.com/)

https://hub.docker.com/r/minimum2scp/magellan-tdiary/

## Deploy magellan-tdiary on MAGELLAN

(TODO)

## Environment Variables

### Basic Authentication

magellan-tdiary creates .htpasswd by environment variables:

 * `TDIARY_BASIC_AUTH_USERNAME` (default: tdiary)
 * `TDIARY_BASIC_AUTH_PASSWORD` (default: tdiary)

### Database

magellan-tdiary stores data into MySQL database, using tdiary-io-rdb gem.
MySQL database connection is configured by environment variables:

 * `MYSQL_HOST`
 * `MYSQL_PORT`
 * `MYSQL_DATABASE`
 * `MYSQL_USERNAME`
 * `MYSQL_PASSWORD`

### Cache with redis

magellan-tdiary stores cache into Redis, using tdiary-cache-redis gem.
Redis connection is configured by environment variables:

 * `REDIS_HOST`
 * `REDIS_PORT` (optional)
 * `REDIS_DATABASE` (optional)
 * `REDIS_PASSWORD` (optional)

## Local test with docker-compose

You can try tDiary with docker-compose:

```
% docker-compose up -d
magellantdiary_db_1 is up-to-date
magellantdiary_cache_1 is up-to-date
Starting magellantdiary_tdiary_1...
% docker-compose ps
         Name                        Command               State    Ports
---------------------------------------------------------------------------
magellantdiary_cache_1    /entrypoint.sh redis-server      Up      6379/tcp
magellantdiary_db_1       /entrypoint.sh mysqld            Up      3306/tcp
magellantdiary_tdiary_1   /opt/magellan-tdiary/entry ...   Up
```

See docker-compose.yml for details.


