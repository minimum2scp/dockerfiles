# about minimum2scp/hubot image

 * based on minimum2scp/nodejs (see https://github.com/minimum2scp/dockerfiles/tree/master/nodejs)
 * hubot is installed

## start container

```
docker run -d  minimum2scp/hubot
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

## running hubot

### using redis

launch redis container:

```
docker run -d --name redis redis:latest
```

and launch hubot:

```
docker run --rm -ti --name hubot --link redis:redis -u debian -w /home/debian/bot minimum2scp/hubot:latest bash -l -c "bin/hubot -a shell -n botname"
```

### using redis and slack

launch redis container:

```
docker run -d --name redis redis:latest
```

and launch hubot:

```
docker run -d --name hubot --link redis:redis -u debian -w /home/debian/bot -e HUBOT_SLACK_TOKEN=********** minimum2scp/hubot:latest bash -l -c "bin/hubot -a slack -n botname"
```


