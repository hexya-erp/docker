FROM golang:1.13 AS builder

ENV HEXYA_VERSION "v0.0.43"
ENV CGO_ENABLED 0
ENV USER root

RUN apt-get update && apt-get install -y --no-install-recommends node-less git

RUN cd / && git clone -b $HEXYA_VERSION https://github.com/hexya-erp/hexya.git
RUN cd /hexya && go install && cd /

RUN cd / && git clone https://github.com/hexya-erp/hexya-demo.git

COPY run.sh /run.sh

CMD ["/run.sh"]