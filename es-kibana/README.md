# about minimum2scp/es-kibana image

 * based on minimum2scp/baseimage (see https://github.com/minimum2scp/dockerfiles/tree/master/baseimage)
 * default-jre-headless package installed
 * elasticsearch package installed from http://www.elasticsearch.org/overview/elkdownloads/
 * kibana latest zip installed from http://download.elasticsearch.org/kibana/kibana/kibana-latest.tar.gz
 * use nginx-light as web server

## start container

```
docker run -d -p 8080:80 -p 9200:9200 minimum2scp/apt-cacher-ng
```

and then open http://localhost:8080/ by browser

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
root         1     0  0 02:17 ?        Ss     0:00 init [2]
elastic+    54     1 24 02:17 ?        Sl     0:03 /usr/lib/jvm/java-7-openjdk-amd64//bin/java -Xms256m -Xmx1g -Xss256k -Djava.awt.headless=true -XX:+UseParNewGC -XX:+UseConcMarkSweepGC -XX:CMSInitiatingOccupancyFraction=75 -XX:+UseCMSInitiatingOccupancyOnly -XX:+HeapDumpOnOutOfMemoryError -XX:+DisableExplicitGC -Delasticsearch -Des.pidfile=/var/run/elasticsearch.pid -Des.path.home=/usr/share/elasticsearch -cp :/usr/share/elasticsearch/lib/elasticsearch-1.3.2.jar:/usr/share/elasticsearch/lib/*:/usr/share/elasticsearch/lib/sigar/* -Des.default.config=/etc/elasticsearch/elasticsearch.yml -Des.default.path.home=/usr/share/elasticsearch -Des.default.path.logs=/var/log/elasticsearch -Des.default.path.data=/var/lib/elasticsearch -Des.default.path.work=/tmp/elasticsearch -Des.default.path.conf=/etc/elasticsearch org.elasticsearch.bootstrap.Elasticsearch
root        55     1  0 02:17 ?        Ssl    0:00 /usr/sbin/rsyslogd
root        89     1  0 02:17 ?        Ss     0:00 /usr/sbin/cron
root       100     1  0 02:17 ?        Ss     0:00 nginx: master process /usr/sbin/nginx
www-data   101   100  0 02:17 ?        S      0:00  \_ nginx: worker process
www-data   102   100  0 02:17 ?        S      0:00  \_ nginx: worker process
www-data   103   100  0 02:17 ?        S      0:00  \_ nginx: worker process
www-data   104   100  0 02:17 ?        S      0:00  \_ nginx: worker process
root       115     1  0 02:17 ?        Ss     0:00 /usr/sbin/sshd
root       168   115  1 02:18 ?        Ss     0:00  \_ sshd: debian [priv]
debian     170   168  0 02:18 ?        S      0:00      \_ sshd: debian@pts/0
debian     171   170  0 02:18 pts/0    Ss     0:00          \_ -bash
debian     176   171  0 02:18 pts/0    R+     0:00              \_ ps -ef fww
```

## ports

| port         | process              | comment                                       |
|:-------------|:------------------   |:------------------------------------------    |
| TCP/22       | sshd                 | invoked by init                               |
| TCP/80       | nginx                | enabled, serves kibana                        |
| TCP/9001     | supervisord          | disabled autostart                            |
| TCP/9200     | java (elasticsearch) | elasticsearch http port                       |
| TCP/9300     | java (elasticsearch) | elasticsearch node to node communication port |

