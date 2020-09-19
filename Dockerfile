FROM alpine

COPY . /usr/src/amicc

RUN \
  apk update && \
  apk add \
    musl-dev gcc make \
  && \
  cd /usr/src/amicc && \
  make && \
  apk del --purge \
    make \
  && \
  rm -rf /var/cache/apk/* && \
  echo '/usr/src/amicc/amicc "$1" > tmp.s;gcc -o dockerrun tmp.s;./dockerrun' > /usr/src/amicc/dockerrun.sh

ENTRYPOINT ["sh", "/usr/src/amicc/dockerrun.sh"]
