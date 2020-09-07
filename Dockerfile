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
    musl-dev gcc make \
  && \
  rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/src/amicc/amicc"]
