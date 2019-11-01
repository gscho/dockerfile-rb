MAINTAINER greg.c.schofield@gmail.com

FROM opensuse/leap:15.0 AS test

USER 0:0

WORKDIR /path/to/workdir

COPY --chown=cheese:bagels my/src /my/dest

COPY dir_one dir_two


COPY --chown=wheel:admin ["src with whitespace",  "dest with whitespace"]

ARG TEST_ARG=0.82.0

CMD ["executable","param1","param2"]

CMD command param1 param2

ENTRYPOINT ["top", "-b"]
CMD ["-c"]
