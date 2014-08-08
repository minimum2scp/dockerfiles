## start container:

run /sbin/init and init invokes sshd, rsyslog, cron daemons.

```
docker run -d -p 2222:22 minimum2scp/baseimage:latest
```

## ssh login to container

```
ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -p 2222 debian@localhost
```
(password is "debian")
