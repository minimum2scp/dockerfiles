# about minimum2scp/systemd image

 * based on minimum2scp/baseimage (see https://github.com/minimum2scp/dockerfiles/tree/master/baseimage)
 * use systemd as /sbin/init

## start container

```
docker run --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 2222:22 -d minimum2scp/systemd:latest
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
root         1     0  0 02:59 ?        Ss     0:00 /sbin/init
root        17     1  0 02:59 ?        Ss     0:00 /lib/systemd/systemd-journald
root        24     1  0 02:59 ?        Ss     0:00 /lib/systemd/systemd-udevd
root        33     1  0 02:59 ?        Ss     0:00 /usr/sbin/cron -f
root        34     1  0 02:59 ?        Ss     0:00 /usr/sbin/sshd -D
root        83    34  0 03:00 ?        Ss     0:00  \_ sshd: debian [priv]
debian      85    83  0 03:00 ?        S      0:00      \_ sshd: debian@pts/0
debian      86    85  0 03:00 pts/0    Ss     0:00          \_ -bash
debian      91    86  0 03:00 pts/0    R+     0:00              \_ ps -ef fww
message+    35     1  0 02:59 ?        Ss     0:00 /usr/bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation
root        38     1  0 02:59 ?        Ss     0:00 /lib/systemd/systemd-logind
root        40     1  0 02:59 ?        Ssl    0:00 /usr/sbin/rsyslogd -n
root        60     1  0 02:59 ?        Ss     0:00 nginx: master process /usr/sbin/nginx -g daemon on; master_process on;
www-data    68    60  0 02:59 ?        S      0:00  \_ nginx: worker process
www-data    69    60  0 02:59 ?        S      0:00  \_ nginx: worker process
www-data    70    60  0 02:59 ?        S      0:00  \_ nginx: worker process
www-data    71    60  0 02:59 ?        S      0:00  \_ nginx: worker process
root        82     1  0 02:59 ?        Ss     0:00 /sbin/agetty --noclear tty1
```

## ports

 * TCP/22: sshd
 * TCP/80: nginx
 * TCP/9001: supervisord

