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
root         1     0  0 00:48 ?        Ss     0:00 init [2]
elastic+   570     1 99 00:48 ?        Sl     0:27 /usr/share/elasticsearch/jdk/bin/java -Xms1g -Xmx1g -XX:+UseConcMarkSweepGC -XX:CMSInitiatingOccupancyFraction=75 -XX:+UseCMSInitiatingOccupancyOnly -Des.networkaddress.cache.ttl=60 -Des.networkaddress.cache.negative.ttl=10 -XX:+AlwaysPreTouch -Xss1m -Djava.awt.headless=true -Dfile.encoding=UTF-8 -Djna.nosys=true -XX:-OmitStackTraceInFastThrow -Dio.netty.noUnsafe=true -Dio.netty.noKeySetOptimization=true -Dio.netty.recycler.maxCapacityPerThread=0 -Dlog4j.shutdownHookEnabled=false -Dlog4j2.disable.jmx=true -Djava.io.tmpdir=/tmp/elasticsearch-4002864792651189135 -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/var/lib/elasticsearch -XX:ErrorFile=/var/log/elasticsearch/hs_err_pid%p.log -Xlog:gc*,gc+age=trace,safepoint:file=/var/log/elasticsearch/gc.log:utctime,pid,tags:filecount=32,filesize=64m -Djava.locale.providers=COMPAT -Dio.netty.allocator.type=unpooled -Des.path.home=/usr/share/elasticsearch -Des.path.conf=/etc/elasticsearch -Des.distribution.flavor=default -Des.distribution.type=deb -Des.bundled_jdk=true -cp /usr/share/elasticsearch/lib/* org.elasticsearch.bootstrap.Elasticsearch -d -p /var/run/elasticsearch/elasticsearch.pid
elastic+   585   570  0 00:48 ?        Sl     0:00  \_ /usr/share/elasticsearch/modules/x-pack-ml/platform/linux-x86_64/bin/controller
root       602     1  8 00:48 ?        Ssl    0:00 /usr/sbin/rsyslogd
root       627     1  0 00:48 ?        Ss     0:00 /usr/sbin/cron
kibana     633     1 99 00:48 ?        Rl     0:07 /usr/share/kibana/bin/../node/bin/node --no-warnings --max-http-header-size=65536 /usr/share/kibana/bin/../src/cli -c /etc/kibana/kibana.yml
root       645     1  0 00:48 ?        Ss     0:00 /usr/sbin/sshd
root       669   645  0 00:48 ?        Ss     0:00  \_ sshd: debian [priv]
debian     676   669  0 00:48 ?        S      0:00      \_ sshd: debian@pts/0
debian     678   676  0 00:48 pts/0    Ss     0:00          \_ -bash
debian     686   678  0 00:48 pts/0    R+     0:00              \_ ps -ef fww

## ports

 * TCP/22: sshd
 * TCP/5601: kibana
 * TCP/9200: elasticsearch (http port)
 * TCP/9300: elasticsearch (node to node communication port)

