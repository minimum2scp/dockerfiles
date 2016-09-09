# about minimum2scp/es-kibana image

 * based on minimum2scp/baseimage (see https://github.com/minimum2scp/dockerfiles/tree/master/baseimage)
 * default-jre-headless package is installed
 * kibana, elasticsearch packages are installed

## start container

```
docker run -d -p 5601:5601 -p 9200:9200 minimum2scp/es-kibana
```

and then open http://localhost:5601/ by browser

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
root         1     0  0 01:06 ?        Ss     0:00 init [2]
root       635     1  0 01:06 ?        Ssl    0:00 /usr/sbin/rsyslogd
root       660     1  0 01:06 ?        Ss     0:00 /usr/sbin/cron
kibana     666     1  1 01:06 ?        Sl     0:04 /opt/kibana/bin/../node/bin/node /opt/kibana/bin/../src/cli
root       677     1  0 01:06 ?        Ss     0:00 /usr/sbin/sshd
root       749   677  0 01:06 ?        Ss     0:00  \_ sshd: debian [priv]
debian     751   749  0 01:06 ?        S      0:00      \_ sshd: debian@pts/0
debian     752   751  0 01:06 pts/0    Ss     0:00          \_ -bash
debian    1104   752  0 01:13 pts/0    R+     0:00              \_ ps -ef fww
elastic+  1003     1  3 01:09 ?        Sl     0:09 /usr/bin/java -Xms256m -Xmx1g -Djava.awt.headless=true -XX:+UseParNewGC -XX:+UseConcMarkSweepGC -XX:CMSInitiatingOccupancyFraction=75 -XX:+UseCMSInitiatingOccupancyOnly -XX:+HeapDumpOnOutOfMemoryError -XX:+DisableExplicitGC -Dfile.encoding=UTF-8 -Djna.nosys=true -Des.path.home=/usr/share/elasticsearch -cp /usr/share/elasticsearch/lib/elasticsearch-2.4.0.jar:/usr/share/elasticsearch/lib/* org.elasticsearch.bootstrap.Elasticsearch start -d -p /var/run/elasticsearch/elasticsearch.pid --default.path.home=/usr/share/elasticsearch --default.path.logs=/var/log/elasticsearch --default.path.data=/var/lib/elasticsearch --default.path.conf=/etc/elasticsearch
```

## ports

 * TCP/22: sshd
 * TCP/5601: kibana
 * TCP/9200: elasticsearch (http port)
 * TCP/9300: elasticsearch (node to node communication port)

