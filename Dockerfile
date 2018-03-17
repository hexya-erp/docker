FROM golang:1.10-alpine

MAINTAINER NDP Systèmes <contact@ndp-systemes.fr>

RUN apk add --no-cache git nodejs-npm

RUN go get github.com/hexya-erp/hexya

RUN cd $GOPATH/src/github.com/hexya-erp \
    && git clone https://github.com/hexya-erp/hexya-base \
    && git clone https://github.com/hexya-erp/hexya-addons

RUN npm install -g less

COPY run.sh /run.sh

CMD ["/run.sh"]