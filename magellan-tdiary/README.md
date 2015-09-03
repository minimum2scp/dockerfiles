# magellan-tdiary

tDiary on MAGELLAN

https://hub.docker.com/r/minimum2scp/magellan-tdiary/

## Environment Variables

### Basic Authentication

magellan-tdiary creates .htpasswd by environment variables:

 * `TDIARY_BASIC_AUTH_USERNAME`
 * `TDIARY_BASIC_AUTH_PASSWORD`

### Database

magellan-tdiary stores data into MySQL database, using tdiary-io-rdb gem.
MySQL database connection is configured by environment variables:

 * `MYSQL_HOST`
 * `MYSQL_PORT`
 * `MYSQL_DATABASE`
 * `MYSQL_USERNAME`
 * `MYSQL_PASSWORD`

## local test with docker-compose

You can try tDiary with docker-compose:

```
% docker-compose up -d
Creating magellantdiary_db_1...
Creating magellantdiary_tdiary_1...
% docker-compose ps
         Name                        Command               State    Ports
---------------------------------------------------------------------------
magellantdiary_db_1       /entrypoint.sh mysqld            Up      3306/tcp
magellantdiary_tdiary_1   /opt/magellan-tdiary/entry ...   Up
```

See docker-compose.yml for details.


