FROM alpine:3.17.3

LABEL maintainer="Daniil Zaytsev <danyazaytsev@gmail.com>"

RUN  apk update \
  && apk upgrade \
  && apk add ca-certificates \
  && update-ca-certificates \
  && apk add --update coreutils && rm -rf /var/cache/apk/*   \
  && apk add --update openjdk11 tzdata curl unzip bash \
  && apk add --no-cache nss \
  && rm -rf /var/cache/apk/*

COPY ./src /opt/cobaltstrike

WORKDIR /opt/cobaltstrike

RUN chmod +x ./teamserver \
  && mkdir /opt/cobaltstrike/artifacts \

VOLUME [ "/opt/cobaltstrike/data", \
         "/opt/cobaltstrike/downloads", \
         "/opt/cobaltstrike/logs", \
         "/opt/cobaltstrike/uploads" ]

EXPOSE 50050 443 80 53/udp 53/tcp

ENTRYPOINT [ "./teamserver" ]