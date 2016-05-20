# about minimum2scp/systemd-jessie image

 * based on minimum2scp/baseimage-jessie (see https://github.com/minimum2scp/dockerfiles/tree/master/baseimage-jessie)
 * use systemd as /sbin/init

## start container

```
docker run --privileged -d minimum2scp/systemd-jessie:latest
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
root         1     0  0 01:54 ?        Ss     0:00 /sbin/init
root       514     1  0 01:55 ?        Ss     0:00 /lib/systemd/systemd-udevd
root       544     1  0 01:55 ?        Ss     0:00 /lib/systemd/systemd-journald
root       548     1  0 01:55 ?        Ss     0:00 /usr/sbin/cron -f
root       549     1  0 01:55 ?        Ss     0:00 /usr/sbin/sshd -D
root       584   549  0 01:55 ?        Ss     0:00  \_ sshd: debian [priv]
debian     593   584  0 01:55 ?        S      0:00      \_ sshd: debian@pts/0
debian     594   593  0 01:55 pts/0    Ss     0:00          \_ -bash
debian     602   594  0 01:55 pts/0    R+     0:00              \_ ps -ef fw
root       574     1  0 01:55 ?        Ss     0:00 /lib/systemd/systemd-logind
message+   576     1  0 01:55 ?        Ss     0:00 /usr/bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation
root       579     1  0 01:55 ?        Ssl    0:00 /usr/sbin/rsyslogd -n
```

## ports

 * TCP/22: sshd

