# about minimum2scp/debian image

 * Almost same as semi official debian image (https://registry.hub.docker.com/_/debian/)
 * This image follows updates of debian sid, almost every week.

## build minimum2scp/debian image

Run following commands on your Debian (requires debootstrap)

```
$ git clone https://github.com/minimum2scp/dockerfiles.git
$ cd dockerfiles/debian
$ rake TAG=minimum2scp/debian:latest
```

to speed up build, use apt-cacher-ng:

```
$ docker run -d -p 3142:3142 minimum2scp/apt-cacher-ng
$ rake TAG=minimum2scp/debian:latest http_proxy=http://127.0.0.1:3142
```

