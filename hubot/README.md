# about minimum2scp/hubot image

 * based on minimum2scp/nodejs (see https://github.com/minimum2scp/dockerfiles/tree/master/nodejs)
 * hubot is available
   * without `HUBOT_REPO_URI`: new hubot is created on /home/debian/hubot after boot, and launched by supervisor
   * with `HUBOT_REPO_URI`: git cloned from `HUBOT_REPO_URI` into /home/debian/hubot after boot, and launched by supervisor

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
debian@d8537f2f1715:~$ ps -ef fw
UID        PID  PPID  C STIME TTY      STAT   TIME CMD
root         1     0  0 04:27 ?        Ss     0:00 init [2]  
root       387     1  0 04:27 ?        Ssl    0:00 /usr/sbin/rsyslogd
root       412     1  0 04:27 ?        Ss     0:00 /usr/sbin/cron
root       421     1  0 04:27 ?        Ss     0:00 /usr/sbin/sshd
root       441   421  0 04:27 ?        Ss     0:00  \_ sshd: debian [priv]
debian     443   441  0 04:27 ?        S      0:00      \_ sshd: debian@pts/0
debian     444   443  0 04:27 pts/0    Ss     0:00          \_ -bash
debian    2210   444  0 04:31 pts/0    R+     0:00              \_ ps -ef fw
root       425     1  0 04:27 ?        Ss     0:00 /usr/bin/python /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
debian    2065   425  8 04:30 ?        Sl     0:00  \_ node node_modules/hubot/node_modules/.bin/coffee node_modules/.bin/hubot --name hubot -a slack -n hubot
```

## ports

 * TCP/22: sshd
 * TCP/8080: hubot
 * TCP/9001: supervisor

## running hubot

### using redis and slack adapter

launch redis container:

```
docker run -d --name redis redis:latest
```

and launch hubot:

```
docker run -d --name hubot --link redis:redis -p 8080:8080 -e HUBOT_SLACK_TOKEN=********** minimum2scp/hubot:latest
```

If you have hubot repository, add `HUBOT_REPO_URI`

```
docker run -d --name hubot --link redis:redis -p 8080:8080 -e HUBOT_SLACK_TOKEN=********** -e HUBOT_REPO_URI=https://github.com/yourname/your-hubot minimum2scp/hubot:latest
```

### use docker-compose

```
cp -a docker-compose.yml.example docker-compose.yml
vi docker-compose.yml
docker-compose up -d
```

