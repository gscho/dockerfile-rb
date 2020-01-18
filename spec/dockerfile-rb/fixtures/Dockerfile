MAINTAINER greg.c.schofield@gmail.com

LABEL "com.example.vendor"="ACME Incorporated"
LABEL com.example.label-with-value="foo"

LABEL multi.label1="value1" multi.label2="value2" other="value3"

LABEL multi.label1="value1" \
      multi.label2="value2" \
      other="value3"

FROM opensuse/leap:15.0 AS test

USER 0:0

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
