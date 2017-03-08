# about minimum2scp/squid image

 * based on minimum2scp/baseimage (see https://github.com/minimum2scp/dockerfiles/tree/master/baseimage)
 * squid package installed

## start container

```
docker run -d -p 3128:3128 minimum2scp/squid
```

and then use from localhost:

```
export http_proxy=http://127.0.0.1:3128
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
root         1     0  0 23:50 ?        Ss     0:00 init [2]
root       412     1  0 23:50 ?        Ssl    0:00 /usr/sbin/rsyslogd
root       437     1  0 23:50 ?        Ss     0:00 /usr/sbin/cron
root       471     1  0 23:50 ?        Ss     0:00 /usr/sbin/squid -YC -f /etc/squid/squid.conf
proxy      473   471  0 23:50 ?        S      0:00  \_ (squid-1) -YC -f /etc/squid/squid.conf
proxy      486   473  0 23:50 ?        S      0:00      \_ (logfile-daemon) /var/log/squid/access.log
proxy      492   473  0 23:50 ?        S      0:00      \_ (pinger)
root       482     1  0 23:50 ?        Ss     0:00 /usr/sbin/sshd
root       493   482  0 23:50 ?        Ss     0:00  \_ sshd: debian [priv]
debian     495   493  0 23:50 ?        S      0:00      \_ sshd: debian@pts/0
debian     496   495  0 23:50 pts/0    Ss     0:00          \_ -bash
debian     501   496  0 23:50 pts/0    R+     0:00              \_ ps -ef fw
```

## ports

 * TCP/22: sshd
 * TCP/3128: squid
 * TCP/3129: squid (transparent)

