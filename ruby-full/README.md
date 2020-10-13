# about minimum2scp/ruby-full image

 * based on minimum2scp/ruby (see https://github.com/minimum2scp/dockerfiles/tree/master/ruby)
 * ruby 2.5.8, ruby 2.6.6, ruby 2.7.2 is installed by rbenv
 * ruby 2.7.2 is installed by debian package

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
root         1     0  0 03:25 ?        Ss     0:00 init [2]  
root        38     1  0 03:25 ?        Ssl    0:00 /usr/sbin/rsyslogd
root        63     1  0 03:25 ?        Ss     0:00 /usr/sbin/cron
root        74     1  0 03:25 ?        Ss     0:00 /usr/sbin/sshd
root        81    74  0 03:27 ?        Ss     0:00  \_ sshd: debian [priv]
debian      83    81  0 03:27 ?        S      0:00      \_ sshd: debian@pts/0
debian      84    83  0 03:27 pts/0    Ss     0:00          \_ -bash
debian     135    84  0 03:27 pts/0    R+     0:00              \_ ps -ef fww
```

## ports

 * TCP/22: sshd

## about rbenv

### rbenv versions, and default ruby

rbenv gloabl (/opt/rbenv/version) is not defined, and some rubies are built.

```
% docker run --rm -t minimum2scp/ruby-full:latest /bin/bash -l -c "rbenv versions"
* system (set by /opt/rbenv/version)
  2.5.8
  2.6.6
  2.7.2
% docker run --rm -t minimum2scp/ruby-full:latest /bin/bash -l -c "ruby -v"
ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-linux-gnu]
```


