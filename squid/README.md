# about minimum2scp/squid image

 * based on minimum2scp/baseimage (see https://github.com/minimum2scp/dockerfiles/tree/master/baseimage)
 * squid package installed

## start container

```
docker run -d -p 3128:3128 minimum2scp/squid
```

and then use from localhost:

```
export http_proxy=htpt://127.0.0.1:3128
curl http://example.com/
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
root         1     0  0 02:51 ?        Ss     0:00 init [2]
root        37     1  0 02:51 ?        Ssl    0:00 /usr/sbin/rsyslogd
root        62     1  0 02:51 ?        Ss     0:00 /usr/sbin/cron
root        70     1  0 02:51 ?        Ss     0:00 /usr/sbin/squid -YC -f /etc/squid/squid.conf
proxy       72    70  0 02:51 ?        S      0:00  \_ (squid-1) -YC -f /etc/squid/squid.conf
proxy       77    72  0 02:51 ?        S      0:00      \_ (logfile-daemon) /var/log/squid/access.log
proxy       91    72  0 02:51 ?        S      0:00      \_ (pinger)
root        84     1  0 02:51 ?        Ss     0:00 /usr/sbin/sshd
root        92    84  1 02:52 ?        Ss     0:00  \_ sshd: debian [priv]
debian      94    92  0 02:52 ?        S      0:00      \_ sshd: debian@pts/0
debian      95    94  0 02:52 pts/0    Ss     0:00          \_ -bash
debian     100    95  0 02:53 pts/0    R+     0:00              \_ ps -ef fww
```

## ports

 * TCP/22: sshd
 * TCP/3128: squid3
 * TCP/3129: squid3 (transparent)

