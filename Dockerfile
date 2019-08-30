FROM ubuntu:18.04

RUN apt update --yes && apt install --yes \
  exiv2 git hugin xvfb

WORKDIR /root

RUN Xvfb :1 -screen 0 1024x768x24 &

ENV DISPLAY=:1

RUN alias realpath='readlink -f'

RUN git clone https://github.com/mbirth/ricoh-theta.git

RUN chmod +x ./ricoh-theta/*.sh

CMD ["/bin/bash", "-c", "find ./share -type f -iname \\*.jpg -or -iname \\*.jpeg | xargs ./ricoh-theta/convert.sh"]
