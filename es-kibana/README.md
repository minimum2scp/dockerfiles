# about minimum2scp/es-kibana image

 * based on minimum2scp/baseimage (see https://github.com/minimum2scp/dockerfiles/tree/master/baseimage)
 * default-jre-headless package installed
 * elasticsearch package installed from http://www.elasticsearch.org/overview/elkdownloads/
 * kibana 4.0.0-BETA2 installed from http://www.elasticsearch.org/overview/kibana/installation/

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
elastic+   266     1  2 01:06 ?        Sl     0:09 /usr/lib/jvm/java-7-openjdk-amd64//bin/java -Xms256m -Xmx1g -Xss256k -Djava.awt.headless=true -XX:+UseParNewGC -XX:+UseConcMarkSweepGC -XX:CMSInitiatingOccupancyFraction=75 -XX:+UseCMSInitiatingOccupancyOnly -XX:+HeapDumpOnOutOfMemoryError -XX:+DisableExplicitGC -Delasticsearch -Des.pidfile=/var/run/elasticsearch.pid -Des.path.home=/usr/share/elasticsearch -cp :/usr/share/elasticsearch/lib/elasticsearch-1.4.1.jar:/usr/share/elasticsearch/lib/*:/usr/share/elasticsearch/lib/sigar/* -Des.default.config=/etc/elasticsearch/elasticsearch.yml -Des.default.path.home=/usr/share/elasticsearch -Des.default.path.logs=/var/log/elasticsearch -Des.default.path.data=/var/lib/elasticsearch -Des.default.path.work=/tmp/elasticsearch -Des.default.path.conf=/etc/elasticsearch org.elasticsearch.bootstrap.Elasticsearch
root       269     1  0 01:06 ?        Ssl    0:00 /usr/sbin/rsyslogd
root       303     1  0 01:06 ?        Ss     0:00 /usr/sbin/cron
root       320     1  0 01:06 ?        Ss     0:00 /usr/sbin/sshd
root       394   320  0 01:06 ?        Ss     0:00  \_ sshd: debian [priv]
debian     397   394  0 01:06 ?        S      0:00      \_ sshd: debian@pts/0
debian     398   397  0 01:06 pts/0    Ss     0:00          \_ -bash
debian     470   398  0 01:13 pts/0    R+     0:00              \_ ps -ef fww
root       326     1  0 01:06 ?        Ss     0:00 /usr/bin/python /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
kibana     338   326  4 01:06 ?        Sl     0:20  \_ /usr/bin/java -Xmx512m -jar /opt/kibana/bin/../lib/kibana.jar
```

## ports

 * TCP/22: sshd
 * TCP/5601: kibana
 * TCP/9200: elasticsearch (http port)
 * TCP/9300: elasticsearch (node to node communication port)

