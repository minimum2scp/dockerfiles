# about minimum2scp/jenkins image

 * based on minimum2scp/ruby-full (see https://github.com/minimum2scp/dockerfiles/tree/master/ruby-full)
 * jenkins is installed
   * http://pkg.jenkins-ci.org/debian/

## start container

```
docker run -d  minimum2scp/jenkins
```

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
root         1     0  0 05:10 ?        Ss     0:00 init [2]
root       438     1  0 05:10 ?        Ssl    0:00 /usr/sbin/rsyslogd
root       463     1  0 05:10 ?        Ss     0:00 /usr/sbin/cron
jenkins    519     1  0 05:10 ?        S      0:00 /usr/bin/daemon --name=jenkins --inherit --env=JENKINS_HOME=/var/lib/jenkins --output=/var/log/jenkins/jenkins.log --pidfile=/var/run/jenkins/jenkins.pid -- /usr/bin/java -Djava.awt.headless=true -jar /usr/share/jenkins/jenkins.war --webroot=/var/cache/jenkins/war --httpPort=8080 --ajp13Port=-1
jenkins    520   519 35 05:10 ?        Sl     0:23  \_ /usr/bin/java -Djava.awt.headless=true -jar /usr/share/jenkins/jenkins.war --webroot=/var/cache/jenkins/war --httpPort=8080 --ajp13Port=-1
root       531     1  0 05:10 ?        Ss     0:00 nginx: master process /usr/sbin/nginx
www-data   532   531  0 05:10 ?        S      0:00  \_ nginx: worker process
www-data   533   531  0 05:10 ?        S      0:00  \_ nginx: worker process
www-data   535   531  0 05:10 ?        S      0:00  \_ nginx: worker process
www-data   536   531  0 05:10 ?        S      0:00  \_ nginx: worker process
root       549     1  0 05:10 ?        Ss     0:00 /usr/sbin/sshd
root       564   549  0 05:10 ?        Ss     0:00  \_ sshd: debian [priv]
debian     571   564  0 05:10 ?        S      0:00      \_ sshd: debian@pts/0
debian     572   571  0 05:10 pts/0    Ss     0:00          \_ -bash
debian     690   572  0 05:11 pts/0    R+     0:00              \_ ps -ef fww
```

## ports

 * TCP/22: sshd
 * TCP/80: nginx
 * TCP/8080: jenkins
