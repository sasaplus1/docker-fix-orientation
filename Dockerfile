FROM ubuntu:bionic

ENV DEBIAN_FRONTEND=noninteractive

RUN apt --yes update && \
  apt --yes install tzdata && \
  apt --yes install exiv2 git hugin xvfb

WORKDIR /root

RUN Xvfb :1 -screen 0 1024x768x24 &

ENV DISPLAY=:1

RUN alias realpath='readlink -f'

RUN git clone https://github.com/mbirth/ricoh-theta.git

RUN chmod +x ./ricoh-theta/*.sh

ENTRYPOINT ["./ricoh-theta/convert.sh"]
