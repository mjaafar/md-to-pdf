FROM ubuntu:latest

LABEL "com.github.actions.name"="Markdown to PDF Generator"
LABEL "com.github.actions.description"="Create PDF files from Markdown."

RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN DEBIAN_FRONTEND="noninteractive"  apt-get -y install pandoc
RUN DEBIAN_FRONTEND="noninteractive"  apt-get -y install git
RUN DEBIAN_FRONTEND="noninteractive"  apt-get -y install texlive-latex-base
RUN DEBIAN_FRONTEND="noninteractive"  apt-get -y install texlive-fonts-recommended

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
