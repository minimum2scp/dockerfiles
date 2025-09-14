# about minimum2scp/ruby-trixie image

 * based on minimum2scp/baseimage-trixie (see https://github.com/minimum2scp/dockerfiles/tree/master/baseimage-trixie)
 * ruby, bundler, pry, rake package installed.
 * rbenv installed.

## start container

```
docker run -d minimum2scp/ruby-trixie
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
root           1       0  0 01:02 ?        Ss     0:00 init [2]
root         497       1  0 01:02 ?        Ssl    0:00 /usr/sbin/rsyslogd
root         523       1  0 01:02 ?        Ss     0:00 /usr/sbin/cron
root         533       1  0 01:02 ?        Ss     0:00 sshd: /usr/sbin/sshd [listener] 0 of 10-100 startups
root         562     533  0 01:02 ?        Ss     0:00  \_ sshd-session: debian [priv]
debian       569     562  0 01:02 ?        S      0:00      \_ sshd-session: debian@pts/0
debian       570     569  0 01:02 pts/0    Ss     0:00          \_ -bash
debian       580     570  0 01:05 pts/0    R+     0:00              \_ ps -ef fww
```

## ports

 * TCP/22: sshd

## about rbenv

rbenv is installed in /opt/rbenv.

### rbenv versions, and default ruby

rbenv gloabl (/opt/rbenv/version) is not defined, and no rubies are built.

```
$ rbenv versions
* system (set by /opt/rbenv/version)
```

### plugins

rbenv is installed in /opt/rbenv, and some plugins are installed.

 * ruby-build
 * rbenv-update

### shell settings

For bash user: automatically loaded rbenv by /etc/profile.d/rbenv.sh

For zsh user: zsh does not load /etc/profile.d, so you have to load /etc/profile.d/rbenv.sh by yourself.


