# about minimum2scp/es-kibana image

 * based on minimum2scp/baseimage (see https://github.com/minimum2scp/dockerfiles/tree/master/baseimage)
 * default-jre-headless package installed
 * elasticsearch package installed from http://www.elasticsearch.org/overview/elkdownloads/
 * kibana 4.0.0 installed from http://www.elasticsearch.org/overview/kibana/installation/

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
root         1     0  0 03:05 ?        Ss     0:00 init [2]  
elastic+   349     1  2 03:05 ?        Sl     0:07 /usr/lib/jvm/java-7-openjdk-amd64//bin/java -Xms256m -Xmx1g -Xss256k -Djava.awt.headless=true -XX:+UseParNewGC -XX:+UseConcMarkSweepGC -XX:CMSInitiatingOccupancyFraction=75 -XX:+UseCMSInitiatingOccupancyOnly -XX:+HeapDumpOnOutOfMemoryError -XX:+DisableExplicitGC -Dfile.encoding=UTF-8 -Delasticsearch -Des.pidfile=/var/run/elasticsearch.pid -Des.path.home=/usr/share/elasticsearch -cp :/usr/share/elasticsearch/lib/elasticsearch-1.4.4.jar:/usr/share/elasticsearch/lib/*:/usr/share/elasticsearch/lib/sigar/* -Des.default.config=/etc/elasticsearch/elasticsearch.yml -Des.default.path.home=/usr/share/elasticsearch -Des.default.path.logs=/var/log/elasticsearch -Des.default.path.data=/var/lib/elasticsearch -Des.default.path.work=/tmp/elasticsearch -Des.default.path.conf=/etc/elasticsearch org.elasticsearch.bootstrap.Elasticsearch
root       350     1  0 03:05 ?        Ssl    0:00 /usr/sbin/rsyslogd
root       384     1  0 03:05 ?        Ss     0:00 /usr/sbin/cron
root       395     1  0 03:05 ?        Ss     0:00 /usr/sbin/sshd
root       555   395  0 03:10 ?        Ss     0:00  \_ sshd: debian [priv]
debian     557   555  0 03:10 ?        S      0:00      \_ sshd: debian@pts/0
debian     558   557  0 03:10 pts/0    Ss     0:00          \_ -bash
debian     564   558  0 03:10 pts/0    R+     0:00              \_ ps -ef fww
root       407     1  0 03:05 ?        Ss     0:00 /usr/bin/python /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
kibana     487   407  0 03:05 ?        Sl     0:01  \_ /opt/kibana/bin/../node/bin/node /opt/kibana/bin/../src/bin/kibana.js
```

## ports

 * TCP/22: sshd
 * TCP/5601: kibana
 * TCP/9200: elasticsearch (http port)
 * TCP/9300: elasticsearch (node to node communication port)

