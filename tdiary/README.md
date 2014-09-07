# about minimum2scp/tdiary image

 * based on minimum2scp/ruby (see https://github.com/minimum2scp/dockerfiles/tree/master/ruby)
 * tdiary (http://www.tdiary.org/) is installed
 * supervisor invokes tdiary server
 * use nginx-light as web server

## start container

```
docker run -d -p 18080:80 minimum2scp/tdiary
```

and then open http://localhost:18080/ or http://<container ip address>/ by browser.

The default account is username: "admin", password: "debian".

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
root        73     1  0 03:42 ?        Ss     0:00 nginx: master process /usr/sbin/nginx
www-data    74    73  0 03:42 ?        S      0:00  \_ nginx: worker process
www-data    75    73  0 03:42 ?        S      0:00  \_ nginx: worker process
www-data    76    73  0 03:42 ?        S      0:00  \_ nginx: worker process
www-data    78    73  0 03:42 ?        S      0:00  \_ nginx: worker process
root        88     1  0 03:42 ?        Ss     0:00 /usr/sbin/sshd
root       124    88  0 03:42 ?        Ss     0:00  \_ sshd: debian [priv]
debian     126   124  0 03:42 ?        S      0:00      \_ sshd: debian@pts/0
debian     127   126  0 03:42 pts/0    Ss     0:00          \_ -bash
debian     178   127  0 03:42 pts/0    R+     0:00              \_ ps -ef fww
root        94     1  0 03:42 ?        Ss     0:00 /usr/bin/python /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
debian     101    94  0 03:42 ?        S      0:00  \_ /bin/sh /home/debian/tdiary/tdiary-core/start.sh
debian     117   101 33 03:42 ?        Sl     0:01      \_ ruby2.1 /home/debian/tdiary/tdiary-core/vendor/bundle/ruby/2.1.0/bin/tdiary server
```

## ports

| port         | process                 | comment                                       |
|:-------------|:------------------      |:------------------------------------------    |
| TCP/22       | sshd                    | invoked by init                               |
| TCP/80       | nginx                   |                                               |
| TCP/9001     | supervisord             | invokes tdiary server process                 |
| TCP/9292     | ruby2.1 (tdiary server) | tdiary server process                         |

## about tDiary

tDiary is installed in /home/debian/tdiary,
all components are installed by git-clone (with master branch)

### directory layout

```
$ tree -L 1 tdiary
tdiary
|-- data
|-- tdiary-contrib
|-- tdiary-core
|-- tdiary-style-gfm
`-- tdiary-style-rd

5 directories, 0 files
```

 * data: data directory
 * tdiary-contrib: https://github.com/tdiary/tdiary-contrib
 * tdiary-core: https://github.com/tdiary/tdiary-core
 * tdiary-style-gfm: https://github.com/tdiary/tdiary-style-gfm
 * tdiary-style-rd: https://github.com/tdiary/tdiary-style-rd

### configuration

~/tdiary/tdiary-core/.htpasswd:

 * user is "debian", and password is "debian"

~/tdiary/tdiary-core/tdiary.conf:

 * `@data_path`: points ~/tdiary/data directory
 * `@style`: changed to 'GFM'

~/tdiary/tdiary-core/Gemfile.local:

 * add git cloned directories (~/tdiary/tdiary-xxx)

~/tdiary/tdiary-core/start.sh:

 * setenv and run tdiary server from supervisor (/etc/supervisor/conf.d/tdiary.conf)

