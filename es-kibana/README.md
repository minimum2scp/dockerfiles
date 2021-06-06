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
UID          PID    PPID  C STIME TTY      STAT   TIME CMD
root           1       0  0 00:13 ?        Ss     0:00 init [2]
elastic+     694       1 99 00:13 ?        Sl     0:34 /usr/share/elasticsearch/jdk/bin/java -Xshare:auto -Des.networkaddress.cache.ttl=60 -Des.networkaddress.cache.negative.ttl=10 -XX:+AlwaysPreTouch -Xss1m -Djava.awt.headless=true -Dfile.encoding=UTF-8 -Djna.nosys=true -XX:-OmitStackTraceInFastThrow -XX:+ShowCodeDetailsInExceptionMessages -Dio.netty.noUnsafe=true -Dio.netty.noKeySetOptimization=true -Dio.netty.recycler.maxCapacityPerThread=0 -Dio.netty.allocator.numDirectArenas=0 -Dlog4j.shutdownHookEnabled=false -Dlog4j2.disable.jmx=true -Djava.locale.providers=SPI,COMPAT --add-opens=java.base/java.io=ALL-UNNAMED -XX:+UseG1GC -Djava.io.tmpdir=/tmp/elasticsearch-15226944111224953006 -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/var/lib/elasticsearch -XX:ErrorFile=/var/log/elasticsearch/hs_err_pid%p.log -Xlog:gc*,gc+age=trace,safepoint:file=/var/log/elasticsearch/gc.log:utctime,pid,tags:filecount=32,filesize=64m -Xms512m -Xmx512m -XX:MaxDirectMemorySize=268435456 -XX:G1HeapRegionSize=4m -XX:InitiatingHeapOccupancyPercent=30 -XX:G1ReservePercent=15 -Des.path.home=/usr/share/elasticsearch -Des.path.conf=/etc/elasticsearch -Des.distribution.flavor=default -Des.distribution.type=deb -Des.bundled_jdk=true -cp /usr/share/elasticsearch/lib/* org.elasticsearch.bootstrap.Elasticsearch -d -p /var/run/elasticsearch/elasticsearch.pid
elastic+     725     694  0 00:13 ?        Sl     0:00  \_ /usr/share/elasticsearch/modules/x-pack-ml/platform/linux-x86_64/bin/controller
root         740       1  3 00:13 ?        Ssl    0:00 /usr/sbin/rsyslogd
root         764       1  0 00:13 ?        Ss     0:00 /usr/sbin/cron
kibana       771       1 16 00:13 ?        Sl     0:00 /usr/share/kibana/bin/../node/bin/node /usr/share/kibana/bin/../src/cli/dist --logging.dest=/var/log/kibana/kibana.log
kibana       847     771 99 00:13 ?        Rl     0:03  \_ /usr/share/kibana/node/bin/node --preserve-symlinks-main --preserve-symlinks /usr/share/kibana/src/cli/dist --logging.dest=/var/log/kibana/kibana.log
root         786       1  0 00:13 ?        Ss     0:00 sshd: /usr/sbin/sshd [listener] 0 of 10-100 startups
root         937     786  0 00:13 ?        Ss     0:00  \_ sshd: debian [priv]
debian       943     937  0 00:13 ?        S      0:00      \_ sshd: debian@pts/0
debian       944     943  0 00:13 pts/0    Ss     0:00          \_ -bash
debian       955     944  0 00:14 pts/0    R+     0:00              \_ ps -ef fww
```

## ports

 * TCP/22: sshd
 * TCP/5601: kibana
 * TCP/9200: elasticsearch (http port)
 * TCP/9300: elasticsearch (node to node communication port)

