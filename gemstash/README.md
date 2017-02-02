# about minimum2scp/gemstash image

 * based on minimum2scp/ruby (see https://github.com/minimum2scp/dockerfiles/tree/master/baseimage)
 * [gemstash](https://github.com/bundler/gemstash) is installed, and running under supervisord

## start container

```
docker run -d  minimum2scp/gemstash
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

## use gemstash with bundler

```shell
docker run --name gemstash -d -p 9292:9292 minimum2scp/gemstash
bundle config mirror.https://rubygems.org http://localhost:9292
```

or

```shell
docker run --name gemstash -d minimum2scp/gemstash
gemstash_ip=$(docker inspect -f '{{.NetworkSettings.IPAddress}}' gemstash)
bundle config mirror.https://rubygems.org http://${gemstash_ip}:9292
```

## processes

```
UID        PID  PPID  C STIME TTY      STAT   TIME CMD
root         1     0  0 11:43 ?        Ss     0:00 init [2]
root       592     1  0 11:43 ?        Ssl    0:00 /usr/sbin/rsyslogd
root       617     1  0 11:43 ?        Ss     0:00 /usr/sbin/cron
root       626     1  0 11:43 ?        Ss     0:00 /usr/sbin/sshd
root       759   626  0 11:43 ?        Ss     0:00  \_ sshd: debian [priv]
debian     761   759  0 11:43 ?        S      0:00      \_ sshd: debian@pts/0
debian     762   761  0 11:43 pts/0    Ss     0:00          \_ -bash
debian     798   762  0 11:43 pts/0    R+     0:00              \_ ps -ef fw
root       632     1  0 11:43 ?        Ss     0:00 /usr/bin/python /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
debian     678   632  1 11:43 ?        Sl     0:00  \_ puma 2.16.0 (tcp://0.0.0.0:9292) [debian]
debian     740   678  0 11:43 ?        Sl     0:00      \_ puma: cluster worker 0: 678 [debian]
```

## ports

 * TCP/22: sshd
 * TCP/9292: gemstash
