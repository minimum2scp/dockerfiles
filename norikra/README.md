# about minimum2scp/norikra image

 * based on minimum2scp/ruby (see https://github.com/minimum2scp/dockerfiles/tree/master/ruby)
 * default-jre-headless package installed
 * jruby 1.7.19 installed by rbenv
 * norikra (http://norikra.github.io/) gem installed, with JRuby
 * norikra-client gem installed, with system ruby

## start container

```
docker run -d -p 26571:26571 -p 26578:26578 minimum2scp/norikra
```

and open http://localhost:26578 or http://<container ip address>:26578 by browser.

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
root         1     0  0 00:40 ?        Ss     0:00 init [2]  
root       338     1  0 00:40 ?        Ssl    0:00 /usr/sbin/rsyslogd
root       363     1  0 00:40 ?        Ss     0:00 /usr/sbin/cron
root       372     1  0 00:40 ?        Ss     0:00 /usr/sbin/sshd
root       434   372  0 00:40 ?        Ss     0:00  \_ sshd: debian [priv]
debian     437   434  0 00:40 ?        S      0:00      \_ sshd: debian@pts/0
debian     438   437  0 00:40 pts/0    Ss     0:00          \_ -bash
debian     515   438  0 00:40 pts/0    R+     0:00              \_ ps -ef fww
root       378     1  0 00:40 ?        Ss     0:00 /usr/bin/python /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
debian     381   378 99 00:40 ?        Sl     0:23  \_ /usr/bin/java -Djdk.home= -Djruby.home=/opt/rbenv/versions/jruby-1.7.19 -Djruby.script=jruby -Djruby.shell=/bin/sh -Djffi.boot.library.path=/opt/rbenv/versions/jruby-1.7.19/lib/jni:/opt/rbenv/versions/jruby-1.7.19/lib/jni/arm-Linux:/opt/rbenv/versions/jruby-1.7.19/lib/jni/i386-Linux:/opt/rbenv/versions/jruby-1.7.19/lib/jni/x86_64-Linux -Xmx500m -Xss2048k -Dsun.java.command=org.jruby.Main -cp  -Xbootclasspath/a:/opt/rbenv/versions/jruby-1.7.19/lib/jruby.jar -server -XX:-UseGCOverheadLimit -XX:+UseConcMarkSweepGC -XX:+UseCompressedOops -XX:CMSInitiatingOccupancyFraction=70 -XX:+UseCMSInitiatingOccupancyOnly -XX:NewRatio=1 -XX:SurvivorRatio=2 -XX:MaxTenuringThreshold=15 -XX:TargetSurvivorRatio=80 -XX:SoftRefLRUPolicyMSPerMB=200 org/jruby/Main /opt/rbenv/versions/jruby-1.7.19/lib/ruby/gems/shared/gems/norikra-1.2.2-java/bin/norikra serverproc -s /home/debian/norikra/data/stats.json
```

## ports

 * TCP/22: sshd
 * TCP/9001: supervisor
 * TCP/26571: norikra (rpc port)
 * TCP/26578: norikra (web ui port)

## about rbenv

### rbenv versions, and default ruby

rbenv gloabl (/opt/rbenv/version) is not defined, and jruby is installed by rbenv

```
$ rbenv versions
* system (set by /opt/rbenv/version)
  jruby-1.7.19
```

### jruby gems

```
$ RBENV_VERSION=jruby-1.7.19 gem list

*** LOCAL GEMS ***

axiom-types (0.1.1)
backports (3.6.4)
bundler (1.8.7)
celluloid (0.12.4)
childprocess (0.5.6)
choice (0.2.0)
coderay (1.1.0)
coercible (1.0.0)
descendants_tracker (0.0.4)
equalizer (0.0.9)
erubis (2.7.0)
facter (2.4.3)
ffi (1.9.3 java)
hitimes (1.2.2 java)
httpclient (2.6.0.1)
ice_nine (0.11.1)
jar-dependencies (0.1.2)
jruby-launcher (1.1.1 java)
jruby-openssl (0.9.5 java)
json (1.8.0 java)
krypt (0.0.2)
krypt-core (0.0.2 universal-java)
krypt-provider-jdk (0.0.2)
ltsv (0.1.0)
maven-tools (1.0.7)
method_source (0.8.2)
mizuno (0.6.9)
msgpack-jruby (1.3.2 java)
msgpack-rpc-over-http-jruby (0.0.7)
multi_json (1.11.0)
norikra (1.2.2 java)
norikra-client-jruby (1.1.0 java)
pry (0.10.1 java)
rack (1.6.0)
rack-protection (1.5.3)
rack-test (0.6.3)
rake (10.1.0)
rdoc (4.1.2)
ruby-maven (3.1.1.0.8)
ruby-maven-libs (3.1.1)
sinatra (1.4.6)
sinatra-contrib (1.4.2)
slop (3.6.0)
spoon (0.0.4)
thor (0.19.1)
thread_safe (0.3.4 java)
tilt (1.4.1)
timers (4.0.1)
virtus (1.0.4)
```

### system ruby gems

```
$ gem list

*** LOCAL GEMS ***

bigdecimal (1.2.4)
bundler (1.8.5)
celluloid (0.16.0)
coderay (1.1.0)
hitimes (1.2.2)
httpclient (2.6.0.1)
io-console (0.4.2)
json (1.8.1)
ltsv (0.1.0)
method_source (0.8.2)
minitest (4.7.5)
msgpack (0.5.11)
msgpack-rpc-over-http (0.0.7)
net-http-persistent (2.9)
norikra-client (1.1.0)
pry (0.10.1)
psych (2.0.5)
rack (1.6.0)
rake (10.3.2, 10.1.0)
rdoc (4.1.0)
slop (3.6.0)
test-unit (2.1.5.0)
thor (0.19.1)
timers (4.0.1)
```


