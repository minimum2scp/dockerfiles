[![Docker Stars](https://img.shields.io/docker/stars/minimum2scp/fluentd-ui.svg)]()
[![Docker Pulls](https://img.shields.io/docker/pulls/minimum2scp/fluentd-ui.svg)]()
[![Docker Build Status](https://img.shields.io/docker/build/minimum2scp/fluentd-ui.svg)]()
[![Docker Automated Build](https://img.shields.io/docker/automated/minimum2scp/fluentd-ui.svg)]()

# about minimum2scp/fluentd-ui image

 * based on minimum2scp/ruby (see https://github.com/minimum2scp/dockerfiles/tree/master/ruby)
 * fluentd-ui (https://github.com/fluent/fluentd-ui) is installed
 * td-agent is installed
 * fluentd-ui is invoked by supervisor
 * use nginx-light as web server

## start container

```
docker run -d -p 10080:80 minimum2scp/fluentd-ui
```

and then open http://localhost:10080/ or http://<container ip address>/ by browser.

The default account is username: "admin", password: "changeme".

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
debian@bc44ac497e02:~$ ps -ef fww
UID        PID  PPID  C STIME TTY      STAT   TIME CMD
root         1     0  0 00:15 ?        Ss     0:00 init [2]
root       577     1  2 00:15 ?        Ssl    0:00 /usr/sbin/rsyslogd
root       602     1  0 00:15 ?        Ss     0:00 /usr/sbin/cron
root       613     1  0 00:15 ?        Ss     0:00 nginx: master process /usr/sbin/nginx
www-data   614   613  0 00:15 ?        S      0:00  \_ nginx: worker process
www-data   615   613  0 00:15 ?        S      0:00  \_ nginx: worker process
www-data   616   613  0 00:15 ?        S      0:00  \_ nginx: worker process
www-data   617   613  0 00:15 ?        S      0:00  \_ nginx: worker process
root       626     1  0 00:15 ?        Ss     0:00 /usr/sbin/sshd
root       681   626  0 00:15 ?        Ss     0:00  \_ sshd: debian [priv]
debian     701   681  0 00:15 ?        S      0:00      \_ sshd: debian@pts/0
debian     737   701  0 00:15 pts/0    Ss     0:00          \_ -bash
debian     855   737  0 00:16 pts/0    R+     0:00              \_ ps -ef fww
root       632     1  0 00:15 ?        Ss     0:00 /usr/bin/python /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
td-agent   683   632 40 00:15 ?        Rl     0:01  \_ /usr/bin/ruby2.3 bin/rails s Puma -e production -p 9292
td-agent   659     1  0 00:15 ?        Sl     0:00 /opt/td-agent/embedded/bin/ruby /usr/sbin/td-agent --log /var/log/td-agent/td-agent.log --daemon /var/run/td-agent/td-agent.pid
td-agent   662   659  5 00:15 ?        Sl     0:00  \_ /opt/td-agent/embedded/bin/ruby /usr/sbin/td-agent --log /var/log/td-agent/td-agent.log --daemon /var/run/td-agent/td-agent.pid
```

## ports

 * TCP/22: sshd
 * TCP/80: nginx
 * TCP/8888: td-agent (type http)
 * TCP/9001: supervisor
 * TCP/9292: fluentd-ui (rails s Puma)
 * TCP/9292: fluentd-ui (rails s Puma)
 * TCP/24224: td-agent (type forward)
 * TCP/24230: td-agent (type debug\_agent)

## fluentd-ui

 * installed in /opt/fluentd-ui
 * installed by git clone, and run bundle install
 * default account is "admin", and password is "changeme"
 * fluentd-ui process is running by "td-agent" user to read/write td-agent config file, log file, pid file

## td-agent

 * installed by package (https://docs.treasuredata.com/articles/td-agent#how-to-install-treasure-agent)
 * changed group of /etc/td-agent to `td-agent` group, and group-writable for fluentd-ui
 * config file, process management is controlled by fluentd-ui

