MAINTAINER greg.c.schofield@gmail.com

LABEL "com.example.vendor"="ACME Incorporated"
# Comment
# Comment2
LABEL com.example.label-with-value="foo"

LABEL multi.label1="value1" multi.label2="value2" other="value3"

LABEL multi.label1="value1" \
      multi.label2="value2" \
      other="value3"

FROM opensuse/leap:15.0 AS test

USER 0:0

STOPSIGNAL SIGTERM

WORKDIR /path/to/workdir

EXPOSE 3000/tcp

COPY --chown=cheese:bagels my/src /my/dest

COPY dir_one dir_two

COPY --chown=wheel:admin ["src with whitespace",  "dest with whitespace"]

ADD --chown=cheese:bagels my/src /my/dest

ADD dir_one dir_two

ADD --chown=wheel:admin ["src with whitespace",  "dest with whitespace"]

ARG TEST_ARG=0.82.0

CMD ["executable","param1","param2"]

CMD command param1 param2

ENTRYPOINT ["top", "-b"]
CMD ["-c"]

ENV myDog Rex The Dog
ENV myCat fluffy

ENV myName="John Doe" myDog=Rex\ The\ Dog \
    myCat=fluffy
VOLUME ["/var/log", "/data"]
HEALTHCHECK NONE

RUN set -eux; \
  groupadd -r postgres --gid=999; \
# https://salsa.debian.org/postgresql/postgresql-common/blob/997d842ee744687d99a2b2d95c1083a2615c79e8/debian/postgresql-common.postinst#L32-35
  useradd -r -g postgres --uid=999 --home-dir=/var/lib/postgresql --shell=/bin/bash postgres; \
# also create the postgres user's home directory with appropriate permissions
# see https://github.com/docker-library/postgres/issues/274
  mkdir -p /var/lib/postgresql; \
  chown -R postgres:postgres /var/lib/postgresql
