FROM golang:1.10-alpine

MAINTAINER NDP Systèmes <contact@ndp-systemes.fr>

RUN apk add --no-cache git nodejs-npm

RUN go get github.com/hexya-erp/hexya

RUN go get -d github.com/hexya-erp/hexya-base/... || true
RUN go get -d github.com/hexya-erp/hexya-addons/... || true

RUN npm install -g less

COPY run.sh /run.sh

CMD ["/run.sh"]