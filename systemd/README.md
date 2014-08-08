## usage

run /sbin/init (systemd):

```
docker run --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 2222:22 -d minimum2scp/systemd:latest
```

and then init invokes sshd, rsyslog, cron daemons.

## ssh login to container

```
ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -p 2222 debian@localhost
```

(password is "debian")

## processes

systemd invokes following processes:

```
UID        PID  PPID  C STIME TTY      STAT   TIME CMD
root         1     0  0 16:23 ?        Ss     0:00 /sbin/init
root        22     1  0 16:23 ?        Ss     0:00 /lib/systemd/systemd-journald
root        27     1  0 16:23 ?        Ss     0:00 /lib/systemd/systemd-udevd
root        34     1  0 16:23 ?        Ss     0:00 /usr/sbin/sshd -D
root        84    34  0 16:25 ?        Ss     0:00  \_ sshd: debian [priv] 
debian      86    84  0 16:25 ?        S      0:00      \_ sshd: debian@pts/0  
debian      87    86  0 16:25 pts/0    Ss     0:00          \_ -bash
debian      92    87  0 16:26 pts/0    R+     0:00              \_ ps -ef f
root        35     1  0 16:23 ?        Ss     0:00 /usr/sbin/cron -f
message+    36     1  0 16:23 ?        Ss     0:00 /usr/bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation
root        38     1  0 16:23 ?        Ss     0:00 /lib/systemd/systemd-logind
root        40     1  0 16:23 ?        Ssl    0:00 /usr/sbin/rsyslogd -n
```

