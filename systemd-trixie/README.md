# about minimum2scp/systemd-trixie image

 * based on minimum2scp/baseimage-trixie (see https://github.com/minimum2scp/dockerfiles/tree/master/baseimage-trixie)
 * use systemd as /sbin/init

## start container

```
docker run --privileged -d minimum2scp/systemd-trixie:latest
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
UID          PID    PPID  C STIME TTY      STAT   TIME CMD
root           1       0  0 02:11 ?        Ss     0:00 /usr/sbin/init
root         479       1  0 02:11 ?        Ss     0:00 /usr/lib/systemd/systemd-journald
root         523       1  0 02:11 ?        Ss     0:00 /usr/sbin/cron -f
message+     524       1  0 02:11 ?        Ss     0:00 /usr/bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation --syslog-only
root         526       1  0 02:11 ?        Ssl    0:00 /usr/sbin/rsyslogd -n -iNONE
root         528       1  0 02:11 ?        Ss     0:00 /usr/lib/systemd/systemd-logind
root         542       1  0 02:11 ?        Ss     0:00 sshd: /usr/sbin/sshd -D [listener] 0 of 10-100 startups
root         547     542  0 02:11 ?        Ss     0:00  \_ sshd-session: debian [priv]
debian       555     547  0 02:11 ?        S      0:00      \_ sshd-session: debian@pts/0
debian       562     555  0 02:11 pts/0    Ss     0:00          \_ -bash
debian       566     562  0 02:11 pts/0    R+     0:00              \_ ps -ef fww
```

## ports

 * TCP/22: sshd

