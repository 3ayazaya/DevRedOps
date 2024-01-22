FROM alpine AS builder

ENV DEPS_GENERAL="wget net-tools curl git gcc python3-dev python3 py3-pip musl-dev build-base libffi-dev openssl-dev krb5-dev linux-headers zeromq-dev"

RUN apk update && apk add --no-cache $DEPS_GENERAL

WORKDIR /app

RUN git clone https://github.com/lgandx/Responder.git && \
    cd Responder && \
    python3 -m venv venv && \
    venv/bin/pip3 install -r requirements.txt && \
    rm -rf .git

FROM alpine AS final

WORKDIR /app

RUN apk update && apk add --no-cache python3 py3-pip

COPY --from=builder /app/Responder /app

RUN ln -sf /dev/stdout /app/logs/Responder-Session.log

ENTRYPOINT ["venv/bin/python3", "Responder.py", "-I", "eth0", "-d", "-w", "-v"]

