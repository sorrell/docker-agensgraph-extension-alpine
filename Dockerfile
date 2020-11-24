FROM postgres:11-alpine

RUN apk add --no-cache postgresql-dev=11.10-r0 --repository=http://dl-cdn.alpinelinux.org/alpine/v3.9/main

RUN apk add --no-cache \
  bison \
  clang \
  flex \
  g++ \
  git \
  llvm \
  make 

RUN git clone https://github.com/bitnine-oss/AgensGraph-Extension.git /age 

RUN cd /age && make install 