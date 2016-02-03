# about minimum2scp/apt-cacher-ng image

 * based on minimum2scp/baseimage (see https://github.com/minimum2scp/dockerfiles/tree/master/baseimage)
 * apt-cacher-ng package installed

## start container

```
docker run -d -p 3142:3142 -e ACNG_BACKENDS_DEBIAN=http://ftp.jp.debian.org/debian/ minimum2scp/apt-cacher-ng
```

and then use from localhost:

```
sudo apt-get -o Acquire::http::Proxy=http://localhost:3142/ -o Acquire::https::Proxy=DIRECT update
sudo apt-get -o Acquire::http::Proxy=http://localhost:3142/ -o Acquire::https::Proxy=DIRECT upgrade
```

or

```
sudo http_proxy=http://localhost:3142 https_proxy= apt-get update
sudo http_proxy=http://localhost:3142 https_proxy= apt-get upgrade
```

use with docker build:

```
docker build --build-arg http_proxy=http://<container IP address>:3142/ --build-arg https_proxy= -t some-image .
```

use with docker run minimum2scp/baseimage:latest:

```
docker run -d -e APT_HTTP_PROXY=http://<container IP address>:3142/ minimum2scp/baseimage:latest
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
root         1     0  0 02:08 ?        Ss     0:00 init [2]  
apt-cac+    17     1  0 02:08 ?        Ss     0:00 /usr/sbin/apt-cacher-ng -c /etc/apt-cacher-ng pidfile=/var/run/apt-cacher-ng/pid SocketPath=/var/run/apt-cacher-ng/socket foreground=0
root        44     1  0 02:08 ?        Ssl    0:00 /usr/sbin/rsyslogd
root        69     1  0 02:08 ?        Ss     0:00 /usr/sbin/cron
root        80     1  0 02:08 ?        Ss     0:00 /usr/sbin/sshd
root        87    80  0 02:08 ?        Ss     0:00  \_ sshd: debian [priv]
debian      89    87  0 02:08 ?        S      0:00      \_ sshd: debian@pts/0
debian      90    89  0 02:08 pts/0    Ss     0:00          \_ -bash
debian      96    90  0 02:08 pts/0    R+     0:00              \_ ps -ef fww
```

## ports

 * TCP/22: sshd
 * TCP/3142: apt-cacher-ng


