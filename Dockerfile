FROM ubuntu:latest

LABEL "com.github.actions.name"="Markdown to PDF Generator"
LABEL "com.github.actions.description"="Create PDF files from Markdown."

#RUN DEBIAN_FRONTEND="noninteractive" apt-get -y --no-install-recommends  install tzdata
RUN apt-get -y -y --no-install-recommends  install pandoc git texlive-latex-base texlive-fonts-recommended

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
