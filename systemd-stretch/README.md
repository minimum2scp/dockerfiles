# about minimum2scp/systemd-stretch image

 * based on minimum2scp/baseimage-stretch (see https://github.com/minimum2scp/dockerfiles/tree/master/baseimage-stretch)
 * use systemd as /sbin/init

## start container

```
docker run --privileged -d minimum2scp/systemd-stretch:latest
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
root         1     0  1 01:17 ?        Ss     0:00 /sbin/init
root       458     1  1 01:17 ?        Ss     0:00 /lib/systemd/systemd-journald
root       471     1  0 01:17 ?        Ss     0:00 /usr/sbin/sshd -D
root       714   471  0 01:17 ?        Ss     0:00  \_ sshd: debian [priv]
debian     722   714  0 01:17 ?        S      0:00      \_ sshd: debian@pts/0
debian     723   722  0 01:17 pts/0    Ss     0:00          \_ -bash
debian     730   723  0 01:17 pts/0    R+     0:00              \_ ps -ef fw
root       472     1  0 01:17 ?        Ssl    0:00 /usr/sbin/rsyslogd -n
message+   474     1  0 01:17 ?        Ss     0:00 /usr/bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation
root       480     1  0 01:17 ?        Ss     0:00 /lib/systemd/systemd-logind
root       481     1  0 01:17 ?        Ss     0:00 /usr/sbin/cron -f
```

## ports

 * TCP/22: sshd

