# about minimum2scp/sphinx image

 * based on minimum2scp/baseimage (see https://github.com/minimum2scp/dockerfiles/tree/master/baseimage)
 * installed python-sphinx package.

## start container

bind mount document and run make:

```
docker run -v /path/to/your-document:/doc minimum2scp/sphinx:latest "cd /doc; make html"
```

## about sphinx related packages

packages installed:

 * python-sphinx
 * python-sphinxcontrib.blockdiag
 * python-sphinxcontrib.actdiag
 * python-sphinxcontrib.seqdiag
 * python-sphinxcontrib.nwdiag
 * python-pip
 * python-pil
 * fonts-ipafont-gothic
 * fonts-ipafont-mincho

installed sphinx themes (installed by pip):

 * sphinxjp.themecore
 * sphinxjp.themes.sphinxjp
 * sphinx_rtd_theme

## ssh login to container

Run /sbin/init in container:

```
docker run -d --name sphinx -p 2222:22 --user root --entrypoint /opt/init-wrapper/sbin/entrypoint.sh minimum2scp/sphinx:latest /sbin/init
```

ssh login to container:

```
ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no debian@<container IP address>
```

or use published port:

```
ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -p 2222 debian@localhost
```

See [minimum2scp/baseimage](https://github.com/minimum2scp/dockerfiles/tree/master/baseimage) for details.


