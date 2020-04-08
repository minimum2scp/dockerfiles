# about minimum2scp/systemd-buster image

 * based on minimum2scp/baseimage-buster (see https://github.com/minimum2scp/dockerfiles/tree/master/baseimage-buster)
 * use systemd as /sbin/init

## start container

```
docker run --privileged -d minimum2scp/systemd-buster:latest
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
root         1     0  0 17:46 ?        Ss     0:00 /sbin/init
root       466     1  0 17:46 ?        Ss     0:00 /lib/systemd/systemd-journald
root       475     1  0 17:46 ?        Ss     0:00 /usr/sbin/cron -f
message+   476     1  0 17:46 ?        Ss     0:00 /usr/bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation
root       477     1  0 17:46 ?        Ss     0:00 /usr/sbin/sshd -D
root       544   477  0 17:46 ?        Ss     0:00  \_ sshd: debian [priv]
debian     548   544  0 17:46 ?        S      0:00      \_ sshd: debian@pts/0
debian     549   548  0 17:46 pts/0    Ss     0:00          \_ -bash
debian     554   549  0 17:46 pts/0    R+     0:00              \_ ps -ef fw
root       479     1  0 17:46 ?        Ssl    0:00 /usr/sbin/rsyslogd -n
root       481     1  0 17:46 ?        Ss     0:00 /lib/systemd/systemd-logind
```

## ports

 * TCP/22: sshd

