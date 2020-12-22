FROM ubuntu:xenial

ENV TERM=xterm \
TZ=Europe/Berlin

LABEL "com.github.actions.name"="Markdown to PDF Generator"
LABEL "com.github.actions.description"="Create PDF files from Markdown."

RUN ln -fs /usr/share/zoneinfo/US/Pacific-New /etc/localtime && dpkg-reconfigure -f noninteractive tzdata
#RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt-get -y install pandoc
RUN apt-get -y install git
RUN apt-get -y install texlive-latex-base
RUN DEBIAN_FRONTEND="noninteractive"  apt-get -y install texlive-fonts-recommended

RUN apt-get -y --no-install-recommends  install pandoc git texlive-latex-base texlive-fonts-recommended

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
