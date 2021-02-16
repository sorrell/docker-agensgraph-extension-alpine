FROM postgres:11-alpine

RUN apk add --no-cache postgresql-dev=11.10-r0 postgresql-plpython2=11.10-r0 --repository=http://dl-cdn.alpinelinux.org/alpine/v3.9/main
RUN apk add --no-cache \
  bison=3.6.2-r0 \
  flex=2.6.4-r2 \
  g++=9.3.0-r2 \
  --repository=http://dl-cdn.alpinelinux.org/alpine/v3.12/main
RUN apk add --no-cache \
  clang \
  flex \
  git \
  llvm \
  make 

RUN git clone https://github.com/apache/incubator-age /age 

RUN cd /age && make install 

RUN  ln -s /usr/lib/postgresql/plpython2.so /usr/local/lib/postgresql/plpython2.so \
  && ln -s /usr/share/postgresql/extension/plpython2u.control /usr/local/share/postgresql/extension/plpythonu.control \
  && ln -s /usr/share/postgresql/extension/plpython2u--1.0.sql /usr/local/share/postgresql/extension/plpythonu--1.0.sql \
  && ln -s /usr/share/postgresql/extension/plpython2u--unpackaged--1.0.sql /usr/local/share/postgresql/extension/plpythonu--unpackaged--1.0.sql