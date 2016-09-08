# about minimum2scp/norikra image

 * based on minimum2scp/ruby (see https://github.com/minimum2scp/dockerfiles/tree/master/ruby)
 * default-jre-headless package installed
 * jruby 9.1.5.0 installed by rbenv
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
root         1     0  0 00:42 ?        Ss     0:00 init [2]
root       590     1  0 00:42 ?        Ssl    0:00 /usr/sbin/rsyslogd
root       615     1  0 00:42 ?        Ss     0:00 /usr/sbin/cron
root       624     1  0 00:42 ?        Ss     0:00 /usr/sbin/sshd
root       741   624  0 00:42 ?        Ss     0:00  \_ sshd: debian [priv]
debian     743   741  0 00:42 ?        S      0:00      \_ sshd: debian@pts/0
debian     744   743  0 00:42 pts/0    Ss     0:00          \_ -bash
debian     782   744  0 00:42 pts/0    R+     0:00              \_ ps -ef fww
root       630     1  0 00:42 ?        Ss     0:00 /usr/bin/python /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
debian     696   630 99 00:42 ?        Sl     0:08  \_ /usr/bin/java -Djdk.home= -Djruby.home=/opt/rbenv/versions/jruby-9.1.5.0 -Djruby.script=jruby -Djruby.shell=/bin/sh -Djffi.boot.library.path=/opt/rbenv/versions/jruby-9.1.5.0/lib/jni:/opt/rbenv/versions/jruby-9.1.5.0/lib/jni/arm-Linux:/opt/rbenv/versions/jruby-9.1.5.0/lib/jni/i386-Linux:/opt/rbenv/versions/jruby-9.1.5.0/lib/jni/ppc64-Linux:/opt/rbenv/versions/jruby-9.1.5.0/lib/jni/ppc64le-Linux:/opt/rbenv/versions/jruby-9.1.5.0/lib/jni/x86_64-Linux -Xmx500m -Xss2048k -Dsun.java.command=org.jruby.Main -cp /opt/rbenv/versions/jruby-9.1.5.0/lib/jruby-truffle.jar: -Xbootclasspath/a:/opt/rbenv/versions/jruby-9.1.5.0/lib/jruby.jar org/jruby/Main /opt/rbenv/versions/jruby-9.1.5.0/bin/norikra start -s /home/debian/norikra/data/stats.json
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
  jruby-9.1.5.0
```

### jruby gems

```
$ RBENV_VERSION=jruby-9.1.5.0 gem list

*** LOCAL GEMS ***

backports (3.6.8)
celluloid (0.16.0)
childprocess (0.5.9)
choice (0.2.0)
did_you_mean (default: 1.0.1)
erubis (2.7.0)
ffi (1.9.14 java)
hitimes (1.2.4 java)
httpclient (2.8.2.3)
jar-dependencies (default: 0.3.5)
jruby-launcher (1.1.1 java)
jruby-openssl (0.9.17 java)
json (1.8.3 java)
ltsv (0.1.0)
minitest (default: 5.4.1)
mizuno (0.6.11)
msgpack (1.0.0 java)
msgpack-rpc-over-http (0.1.0)
multi_json (1.12.1)
net-telnet (default: 0.1.1)
norikra (1.4.0 java)
norikra-client (1.4.0)
power_assert (default: 0.2.3)
psych (2.0.17 java)
racc (1.4.14 java)
rack (1.6.4)
rack-protection (1.5.3)
rack-test (0.6.3)
rake (default: 10.4.2)
rdoc (default: 4.2.0)
sinatra (1.4.7)
sinatra-contrib (1.4.7)
test-unit (default: 3.1.1)
thor (0.19.1)
tilt (2.0.5)
timers (4.0.4)
```

### system ruby gems

```
$ gem list

*** LOCAL GEMS ***

bigdecimal (1.2.8)
bundler (1.12.5)
celluloid (0.16.0)
coderay (1.1.1)
did_you_mean (1.0.0)
hitimes (1.2.4)
httpclient (2.8.2.3)
io-console (0.4.5)
json (1.8.3)
ltsv (0.1.0)
method_source (0.8.2)
minitest (5.9.0)
molinillo (0.5.0)
msgpack (1.0.0)
msgpack-rpc-over-http (0.1.0)
net-http-persistent (2.9.4)
net-telnet (0.1.1)
norikra-client (1.4.0)
power_assert (0.2.7)
pry (0.10.3)
psych (2.0.17)
rack (2.0.1)
rake (10.5.0)
rdoc (4.2.1)
test-unit (3.1.7)
thor (0.19.1)
timers (4.0.4)
```


