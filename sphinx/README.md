# about minimum2scp/sphinx image

 * based on minimum2scp/baseimage (see https://github.com/minimum2scp/dockerfiles/tree/master/baseimage)
 * installed python-sphinx package.

## start container

bind mount document and run make:

```
docker run -v /path/to/your-document:/doc minimum2scp/sphinx "cd /doc; make html"
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

