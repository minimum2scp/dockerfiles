# about minimum2scp/tdiary image

 * based on minimum2scp/ruby (see https://github.com/minimum2scp/dockerfiles/tree/master/ruby)
 * tdiary (http://www.tdiary.org/) is installed
 * supervisor invokes tdiary server
 * use nginx-light as web server

## start container

```
docker run -d -p 18080:80 minimum2scp/tdiary
```

and then open http://localhost:18080/ or http://<container ip address>/ by browser.

The default account is username: "debian", password: "debian".

## ssh login to container

ssh login to container:

```
ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no debian@<container IP address>
```

or use published port:

```
ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -p <published ssh port> debian@localhost
```

 * user "debian" is available
 * password is "debian"
 * user "debian" can use sudo command without password
 * `id debian`: `uid=2000(debian) gid=2000(debian) groups=2000(debian),4(adm),27(sudo)`

## processes

```
UID        PID  PPID  C STIME TTY      STAT   TIME CMD
root         1     0  0 01:52 ?        Ss     0:00 init [2]
root       334     1  0 01:52 ?        Ssl    0:00 /usr/sbin/rsyslogd
root       359     1  0 01:52 ?        Ss     0:00 /usr/sbin/cron
root       370     1  0 01:52 ?        Ss     0:00 nginx: master process /usr/sbin/nginx
www-data   371   370  0 01:52 ?        S      0:00  \_ nginx: worker process
www-data   372   370  0 01:52 ?        S      0:00  \_ nginx: worker process
www-data   373   370  0 01:52 ?        S      0:00  \_ nginx: worker process
www-data   375   370  0 01:52 ?        S      0:00  \_ nginx: worker process
root       383     1  0 01:52 ?        Ss     0:00 /usr/sbin/sshd
root       520   383  0 01:52 ?        Ss     0:00  \_ sshd: debian [priv]
debian     522   520  0 01:52 ?        S      0:00      \_ sshd: debian@pts/0
debian     523   522  0 01:52 pts/0    Ss     0:00          \_ -bash
debian     685   523  0 01:52 pts/0    R+     0:00              \_ ps -ef fww
root       389     1  0 01:52 ?        Ss     0:00 /usr/bin/python /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
debian     567   389 17 01:52 ?        Sl     0:01  \_ ruby /home/debian/go/src/github.com/tdiary/tdiary-core/vendor/bundle/ruby/2.2.0/bin/tdiary server
```

## ports

 * TCP/22: sshd
 * TCP/80: nginx
 * TCP/9001: supervisor
 * TCP/19292: tdiary server (thin)

## about tDiary

tDiary is installed in /home/debian/tdiary,
all components are installed by git-clone (with master branch)

### directory layout

```
debian@f3612393eea3:~$ tree -L 1 ~/tdiary ~/go/src/github.com/tdiary
/home/debian/tdiary
|-- data
|-- start.sh
`-- tdiary.conf
/home/debian/go/src/github.com/tdiary
|-- tdiary-blogkit
|-- tdiary-cache-memcached
|-- tdiary-cache-null
|-- tdiary-cache-redis
|-- tdiary-contrib
|-- tdiary-core
|-- tdiary-io-mongodb
|-- tdiary-io-rdb
|-- tdiary-style-emptdiary
|-- tdiary-style-etdiary
|-- tdiary-style-gfm
|-- tdiary-style-rd
|-- tdiary-theme
`-- tdiary-theme-nonfree

14 directories, 2 files
```

 * ~/tdiary
   * data: data directory
   * .htpasswd: username and password for Basic Authentication
   * start.sh: runs tdiary server
 * ~/go/src/github.com/tdiary
   * tdiary-core: https://github.com/tdiary/tdiary-core.git
   * tdiary-contrib: https://github.com/tdiary/tdiary-contrib.git
   * tdiary-blogkit: https://github.com/tdiary/tdiary-blogkit.git
   * tdiary-cache-redis: https://github.com/tdiary/tdiary-cache-redis.git
   * tdiary-cache-memcached: https://github.com/tdiary/tdiary-cache-memcached.git
   * tdiary-cache-null: https://github.com/tdiary/tdiary-cache-null.git
   * tdiary-io-mongodb: https://github.com/tdiary/tdiary-io-mongodb.git
   * tdiary-io-rdb: https://github.com/tdiary/tdiary-io-rdb.git
   * tdiary-theme: https://github.com/tdiary/tdiary-theme.git
   * tdiary-theme-nonfree: https://github.com/tdiary/tdiary-theme-nonfree.git
   * tdiary-style-emptdiary: https://github.com/tdiary/tdiary-style-emptdiary.git
   * tdiary-style-etdiary: https://github.com/tdiary/tdiary-style-etdiary.git
   * tdiary-style-gfm: https://github.com/tdiary/tdiary-style-gfm.git
   * tdiary-style-rd: https://github.com/tdiary/tdiary-style-rd.git

### configuration

~/tdiary/.htpasswd:

 * user is "debian", and password is "debian"

~/tdiary/tdiary.conf:

 * `@data_path`: points ~/tdiary/data directory
 * `@style`: changed to 'GFM'

~/go/src/github.com/tdiary/tdiary-core/Gemfile.local:

 * add git cloned directories (~/go/src/github.com/tdiary/tdiary-xxx)

~/tdiary/start.sh:

 * setenv and run tdiary server from supervisor (/etc/supervisor/conf.d/tdiary.conf)

