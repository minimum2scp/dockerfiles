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

### CSRF Protection

magellan-tdiary CSRF protection is configured by environment variables:

 * `TDIARY_CSRF_PROTECTION_METHOD` (default: 2)
 * `TDIARY_CSRF_PROTECTION_KEY` (default: `FAKE_CSRF_PROTECTION_KEY`)
 * `TDIARY_CSRF_PROTECTION_ALLOWED_REFERER_REGEXP_FOR_UPDATE` (default: ``)

see tdiary.conf.sample, tdiary.conf.samle-en in https://github.com/tdiary/tdiary-core for details.

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

 * `REDIS_HOST` (optional)
 * `REDIS_PORT` (optional)
 * `REDIS_DATABASE` (optional)
 * `REDIS_PASSWORD` (optional)

When `REDIS_HOST` is not set, magellan-tdiary stores cache into local disk.
That means:

 * The cache will be inconsistent when 2 or more magellan-tdiary containers are running
 * The cache will be lost when magellan-tdiary containers stop

## Local test with docker-compose

You can try tDiary with docker-compose:

```
% docker-compose scale db=1 cache=1 tdiary=3 nginx=1
Creating and starting 1... done
Creating and starting 1... done
Creating and starting 1... done
Creating and starting 2... done
Creating and starting 3... done
Creating and starting 1... done
% docker-compose ps 
Name                        Command               State        Ports
----------------------------------------------------------------------------------
magellantdiary_cache_1    /entrypoint.sh redis-server      Up      6379/tcp
magellantdiary_db_1       /entrypoint.sh mysqld            Up      3306/tcp
magellantdiary_nginx_1    /opt/entrypoint nginx -g d ...   Up      443/tcp, 80/tcp
magellantdiary_tdiary_1   /opt/magellan-tdiary/entry ...   Up      80/tcp
magellantdiary_tdiary_2   /opt/magellan-tdiary/entry ...   Up      80/tcp
magellantdiary_tdiary_3   /opt/magellan-tdiary/entry ...   Up      80/tcp
```

See docker-compose.yml for details.


