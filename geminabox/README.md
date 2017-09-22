[![Docker Stars](https://img.shields.io/docker/stars/minimum2scp/geminabox.svg)]()
[![Docker Pulls](https://img.shields.io/docker/pulls/minimum2scp/geminabox.svg)]()
[![Docker Build Status](https://img.shields.io/docker/build/minimum2scp/geminabox.svg)]()
[![Docker Automated Build](https://img.shields.io/docker/automated/minimum2scp/geminabox.svg)]()

# about minimum2scp/geminabox image

 * based on minimum2scp/ruby (see https://github.com/minimum2scp/dockerfiles/tree/master/ruby)
 * [geminabox](https://github.com/geminabox/geminabox) is installed

## start container

```
docker run -d minimum2scp/geminabox
```

To persistent geminabox data:

```
docker run -d -v /path/to/geminabox-data:/home/debian/geminabox/data minimum2scp/geminabox
```

To use geminabox from client:

 * browser: `http://<container IP address>`
 * gem command: `gem push pkg/my-awesome-gem-1.0.gem --host <container IP address>`
 * geminabox gem: `gem inabox -g <container IP address>`

You can publish TCP/80 (nginx) port to host:

```
docker run -d -p xxxx:80 -v /path/to/geminabox-data:/home/debian/geminabox/data minimum2scp/geminabox
```

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
root         1     0  0 00:22 ?        Ss     0:00 init [2]
root        38     1  0 00:22 ?        Ssl    0:00 /usr/sbin/rsyslogd
root        63     1  0 00:22 ?        Ss     0:00 /usr/sbin/cron
root        74     1  0 00:22 ?        Ss     0:00 nginx: master process /usr/sbin/nginx
www-data    75    74  0 00:22 ?        S      0:00  \_ nginx: worker process
www-data    76    74  0 00:22 ?        S      0:00  \_ nginx: worker process
www-data    77    74  0 00:22 ?        S      0:00  \_ nginx: worker process
www-data    79    74  0 00:22 ?        S      0:00  \_ nginx: worker process
root        89     1  0 00:22 ?        Ss     0:00 /usr/sbin/sshd
root       115    89  0 00:22 ?        Ss     0:00  \_ sshd: debian [priv]
debian     117   115  0 00:22 ?        S      0:00      \_ sshd: debian@pts/0
debian     118   117  0 00:22 pts/0    Ss     0:00          \_ -bash
debian     169   118  0 00:22 pts/0    R+     0:00              \_ ps -ef fw
root        95     1  0 00:22 ?        Ss     0:00 /usr/bin/python /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
debian      98    95  0 00:22 ?        S      0:00  \_ /bin/sh /home/debian/geminabox/start.sh
debian     105    98  4 00:22 ?        Sl     0:00      \_ puma 2.9.2 (tcp://127.0.0.1:9292)
```

## ports

 * TCP/22: sshd
 * TCP/80: nginx
 * TCP/9001: supervisord
 * TCP/9292: geminabox (puma)

## geminabox

 * Geminabox is installed in `/home/debian/geminabox` using bundler.
   (see `/home/debian/gemfile/Gemfile`)
 * Upload gems will be stored in `/home/debian/geminabox/data`
   (see `/home/debian/geminabox/config.ru`)
 * Application server is puma, and invoked by supervisord
   (see `/etc/supervisord/conf.d/geminabox.conf` and `/home/debian/geminabox/start.sh`)
 * Nginx is running as reverse proxy to application server.
   (see `/etc/nginx/sites-available/geminabox`)
 * No SSL, No Authentication.

### directory structure

```
debian@0c1a3a1c08d2:~$ tree -L 2 ~/geminabox/
/home/debian/geminabox/
|-- Gemfile
|-- Gemfile.lock
|-- config.ru
|-- data
|-- start.sh
|-- tmp
|   |-- puma.pid
|   `-- puma.state
`-- vendor
    `-- bundle

4 directories, 6 files
```
