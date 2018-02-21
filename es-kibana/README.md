[![Docker Stars](https://img.shields.io/docker/stars/minimum2scp/es-kibana.svg)]()
[![Docker Pulls](https://img.shields.io/docker/pulls/minimum2scp/es-kibana.svg)]()
[![Docker Build Status](https://img.shields.io/docker/build/minimum2scp/es-kibana.svg)]()
[![Docker Automated Build](https://img.shields.io/docker/automated/minimum2scp/es-kibana.svg)]()

# about minimum2scp/es-kibana image

 * based on minimum2scp/baseimage (see https://github.com/minimum2scp/dockerfiles/tree/master/baseimage)
 * default-jre-headless package is installed
 * kibana, elasticsearch packages are installed

## start container

```
sysctl -w vm.max_map_count=262144
docker run -d -p 5601:5601 -p 9200:9200  minimum2scp/es-kibana
```

and then open http://localhost:5601/ by browser.

See [Virtual memory](https://www.elastic.co/guide/en/elasticsearch/reference/current/vm-max-map-count.html) about `vm.max_map_count`.

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

```console
UID        PID  PPID  C STIME TTY      STAT   TIME CMD
root         1     0  0 01:46 ?        Ss     0:00 init [2]
elastic+   549     1 60 01:46 ?        Sl     0:15 /usr/bin/java -Xms1g -Xmx1g -XX:+UseConcMarkSweepGC -XX:CMSInitiatingOccupancyFraction=75 -XX:+UseCMSInitiatingOccupancyOnly -XX:+AlwaysPreTouch -Xss1m -Djava.awt.headless=true -Dfile.encoding=UTF-8 -Djna.nosys=true -XX:-OmitStackTraceInFastThrow -Dio.netty.noUnsafe=true -Dio.netty.noKeySetOptimization=true -Dio.netty.recycler.maxCapacityPerThread=0 -Dlog4j.shutdownHookEnabled=false -Dlog4j2.disable.jmx=true -Djava.io.tmpdir=/tmp/elasticsearch.TaUdrp5E -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/var/lib/elasticsearch -XX:+PrintGCDetails -XX:+PrintGCDateStamps -XX:+PrintTenuringDistribution -XX:+PrintGCApplicationStoppedTime -Xloggc:/var/log/elasticsearch/gc.log -XX:+UseGCLogFileRotation -XX:NumberOfGCLogFiles=32 -XX:GCLogFileSize=64m -Des.path.home=/usr/share/elasticsearch -Des.path.conf=/etc/elasticsearch -cp /usr/share/elasticsearch/lib/* org.elasticsearch.bootstrap.Elasticsearch -d -p /var/run/elasticsearch/elasticsearch.pid
root       582     1  1 01:46 ?        Ssl    0:00 /usr/sbin/rsyslogd
root       625     1  0 01:46 ?        Ss     0:00 /usr/sbin/cron
kibana     631     1 15 01:46 ?        Sl     0:03 /usr/share/kibana/bin/../node/bin/node --no-warnings /usr/share/kibana/bin/../src/cli -c /etc/kibana/kibana.yml
root       642     1  0 01:46 ?        Ss     0:00 /usr/sbin/sshd
root       844   642  0 01:46 ?        Ss     0:00  \_ sshd: debian [priv]
debian     850   844  0 01:46 ?        S      0:00      \_ sshd: debian@pts/0
debian     851   850  0 01:46 pts/0    Ss     0:00          \_ -bash
debian     857   851  0 01:47 pts/0    R+     0:00              \_ ps -ef fww
```

## ports

 * TCP/22: sshd
 * TCP/5601: kibana
 * TCP/9200: elasticsearch (http port)
 * TCP/9300: elasticsearch (node to node communication port)

