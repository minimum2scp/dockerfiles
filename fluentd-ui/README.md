# about minimum2scp/fluentd-ui image

 * based on minimum2scp/ruby (see https://github.com/minimum2scp/dockerfiles/tree/master/ruby)
 * fluentd-ui (https://github.com/fluent/fluentd-ui) is installed
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
UID        PID  PPID  C STIME TTY      STAT   TIME CMD
root         1     0  0 03:03 ?        Ss     0:00 init [2]  
root        37     1  0 03:03 ?        Ssl    0:00 /usr/sbin/rsyslogd
root        62     1  0 03:03 ?        Ss     0:00 /usr/sbin/cron
root        73     1  0 03:03 ?        Ss     0:00 nginx: master process /usr/sbin/nginx
www-data    74    73  0 03:03 ?        S      0:00  \_ nginx: worker process
www-data    75    73  0 03:03 ?        S      0:00  \_ nginx: worker process
www-data    76    73  0 03:03 ?        S      0:00  \_ nginx: worker process
www-data    77    73  0 03:03 ?        S      0:00  \_ nginx: worker process
root        88     1  0 03:03 ?        Ss     0:00 /usr/sbin/sshd
root       125    88  0 03:04 ?        Ss     0:00  \_ sshd: debian [priv]
debian     127   125  0 03:04 ?        S      0:00      \_ sshd: debian@pts/0
debian     128   127  0 03:04 pts/0    Ss     0:00          \_ -bash
debian     179   128  0 03:04 pts/0    R+     0:00              \_ ps -ef fww
root        94     1  0 03:03 ?        Ss     0:00 /usr/bin/python /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
debian      98    94 20 03:03 ?        Sl     0:01  \_ ruby2.1 /home/debian/.gem/ruby/2.1.0/bin/rails s Puma -e production -p 9292
```

## ports

| port         | process                | comment                                       |
|:-------------|:------------------     |:------------------------------------------    |
| TCP/22       | sshd                   | invoked by init                               |
| TCP/80       | nginx                  |                                               |
| TCP/9001     | supervisord            | invokes fluentd-ui process                    |
| TCP/9292     | ruby2.1 (rails s Puma) | fluentd-ui process                            |

## fluentd-ui

 * installed in /home/debian/fluentd-ui
 * installed by git clone, and run bundle install
 * default account is "admin", and password is "changeme"

