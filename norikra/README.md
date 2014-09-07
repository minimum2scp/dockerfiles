# about minimum2scp/norikra image

 * based on minimum2scp/ruby (see https://github.com/minimum2scp/dockerfiles/tree/master/ruby)
 * default-jre-headless package installed
 * jruby 1.7.14 installed by rbenv
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
root         1     0  0 03:31 ?        Ss     0:00 init [2]
root        37     1  0 03:31 ?        Ssl    0:00 /usr/sbin/rsyslogd
root        62     1  0 03:31 ?        Ss     0:00 /usr/sbin/cron
root        73     1  0 03:31 ?        Ss     0:00 /usr/sbin/sshd
root       161    73  1 03:33 ?        Ss     0:00  \_ sshd: debian [priv]
debian     163   161  0 03:33 ?        S      0:00      \_ sshd: debian@pts/0
debian     164   163  0 03:33 pts/0    Ss     0:00          \_ -bash
debian     215   164  0 03:33 pts/0    R+     0:00              \_ ps -ef fww
root        79     1  0 03:31 ?        Ss     0:00 /usr/bin/python /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
debian      82    79 31 03:31 ?        Sl     0:28  \_ /usr/bin/java -Djdk.home= -Djruby.home=/opt/rbenv/versions/jruby-1.7.14 -Djruby.script=jruby -Djruby.shell=/bin/sh -Djffi.boot.library.path=/opt/rbenv/versions/jruby-1.7.14/lib/jni:/opt/rbenv/versions/jruby-1.7.14/lib/jni/arm-Linux:/opt/rbenv/versions/jruby-1.7.14/lib/jni/i386-Linux:/opt/rbenv/versions/jruby-1.7.14/lib/jni/x86_64-Linux -Xmx500m -Xss2048k -Dsun.java.command=org.jruby.Main -cp  -Xbootclasspath/a:/opt/rbenv/versions/jruby-1.7.14/lib/jruby.jar -server -XX:-UseGCOverheadLimit -XX:+UseConcMarkSweepGC -XX:+UseCompressedOops -XX:CMSInitiatingOccupancyFraction=70 -XX:+UseCMSInitiatingOccupancyOnly -XX:NewRatio=1 -XX:SurvivorRatio=2 -XX:MaxTenuringThreshold=15 -XX:TargetSurvivorRatio=80 -XX:SoftRefLRUPolicyMSPerMB=200 org/jruby/Main /opt/rbenv/versions/jruby-1.7.14/lib/ruby/gems/shared/gems/norikra-1.0.6-java/bin/norikra serverproc -s /home/debian/norikra/data/stats.json
```

## ports

| port         | process              | comment                                       |
|:-------------|:------------------   |:------------------------------------------    |
| TCP/22       | sshd                 | invoked by init                               |
| TCP/80       | nginx                | disabled autostart                            |
| TCP/9001     | supervisord          |                                               |
| TCP/26571    | java (norikra)       | Norikra RPC port                              |
| TCP/26578    | java (norikra)       | Norikra Web UI port                           |

## about rbenv

### rbenv versions, and default ruby

rbenv gloabl (/opt/rbenv/version) is not defined, and jruby is installed by rbenv

```
$ rbenv versions
* system (set by /opt/rbenv/version)
  jruby-1.7.14
```

### jruby gems

```
$ RBENV_VERSION=jruby-1.7.14 gem list 

*** LOCAL GEMS ***

axiom-types (0.1.1)
backports (3.6.0)
bundler (1.7.2)
celluloid (0.12.4)
childprocess (0.5.3)
choice (0.1.6)
coderay (1.1.0)
coercible (1.0.0)
descendants_tracker (0.0.4)
equalizer (0.0.9)
erubis (2.7.0)
facter (2.2.0)
ffi (1.9.3 java)
hitimes (1.2.2 java)
httpclient (2.4.0)
ice_nine (0.11.0)
jar-dependencies (0.0.7)
jruby-launcher (1.1.0 java)
jruby-openssl (0.9.5 java)
json (1.8.0 java)
krypt (0.0.2)
krypt-core (0.0.2 universal-java)
krypt-provider-jdk (0.0.2)
ltsv (0.1.0)
maven-tools (1.0.4)
method_source (0.8.2)
mizuno (0.6.8)
msgpack-jruby (1.3.2 java)
msgpack-rpc-over-http-jruby (0.0.7)
multi_json (1.10.1)
norikra (1.0.6 java)
norikra-client-jruby (1.0.0 java)
pry (0.10.1 java)
rack (1.5.2)
rack-protection (1.5.3)
rack-test (0.6.2)
rake (10.1.0)
rdoc (4.0.1)
ruby-maven (3.1.1.0.8)
ruby-maven-libs (3.1.1)
sinatra (1.4.5)
sinatra-contrib (1.4.2)
slop (3.6.0)
spoon (0.0.4)
thor (0.19.1)
thread_safe (0.3.4 java)
tilt (1.4.1)
timers (4.0.0)
virtus (1.0.3)
```

### system ruby gems

```
$ gem list 

*** LOCAL GEMS ***

bigdecimal (1.2.4)
bundler (1.7.2)
celluloid (0.12.4)
facter (2.2.0)
hitimes (1.2.2)
httpclient (2.4.0)
io-console (0.4.2)
json (1.8.1)
ltsv (0.1.0)
minitest (4.7.5)
msgpack (0.5.8)
msgpack-rpc-over-http (0.0.6)
net-http-persistent (2.9)
norikra-client (1.0.0)
pry (0.10.0)
psych (2.0.5)
rack (1.6.0.beta)
rake (10.1.1, 10.1.0)
rdoc (4.1.0)
slop (3.6.0)
test-unit (2.1.2.0)
thor (0.19.1)
timers (4.0.0)
```


