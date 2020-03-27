[![Docker Build Status](https://img.shields.io/docker/build/minimum2scp/nodejs.svg)]()
[![Docker Automated Build](https://img.shields.io/docker/automated/minimum2scp/nodejs.svg)]()

# about minimum2scp/nodejs image

 * based on minimum2scp/baseimage (see https://github.com/minimum2scp/dockerfiles/tree/master/baseimage)
 * node.js v13.12.0 is installed with [nodenv](https://github.com/nodenv/nodenv)
 * nodenv is installed in /opt/nodenv
 * [yarn](https://yarnpkg.com/) is installed with deb package

## start container

```
docker run -d  minimum2scp/nodejs
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
root         1     0  0 03:42 ?        Ss     0:00 init [2]
root        37     1  0 03:42 ?        Ssl    0:00 /usr/sbin/rsyslogd
root        62     1  0 03:42 ?        Ss     0:00 /usr/sbin/cron
root        88     1  0 03:42 ?        Ss     0:00 /usr/sbin/sshd
root       124    88  0 03:42 ?        Ss     0:00  \_ sshd: debian [priv]
debian     126   124  0 03:42 ?        S      0:00      \_ sshd: debian@pts/0
debian     127   126  0 03:42 pts/0    Ss     0:00          \_ -bash
debian     178   127  0 03:42 pts/0    R+     0:00              \_ ps -ef fww
```

## ports

 * TCP/22: sshd

## nodenv

nodenv is installed in `/opt/nodenv`, and enabled by `/etc/profile.d/nodenv.sh`.

If you need root privilege, use `sudo bash -lc "..."`.
For example, install LTS version of nodejs:

```
sudo bash -lc "nodenv install 12.16.1"
```


