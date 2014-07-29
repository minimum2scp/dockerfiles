FROM minimum2scp/debian:latest
MAINTAINER YAMADA Tsuyoshi <tyamada@minimum2scp.org>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get dist-upgrade -y
RUN apt-get install -y libfreetype6 libjpeg8 python-pip python-pil
RUN apt-get install -y python-sphinx python-sphinxcontrib.blockdiag python-sphinxcontrib.actdiag python-sphinxcontrib.seqdiag python-sphinxcontrib.nwdiag
RUN apt-get install -y fonts-ipafont-gothic fonts-ipafont-mincho && mkdir /usr/share/fonts/ipa-gothic && ln -s /usr/share/fonts/opentype/ipafont-gothic/ipag.ttf /usr/share/fonts/ipa-gothic/ipag.ttf
RUN pip install sphinxjp.themecore sphinxjp.themes.sphinxjp sphinx_rtd_theme
RUN apt-get clean

CMD ["/bin/bash"]

