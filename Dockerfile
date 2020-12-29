FROM node:alpine
MAINTAINER heifeng

RUN apk add --no-cache python3 python3-dev \
    git ca-certificates && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    rm -rf /root/.cache

RUN apk add --no-cache tzdata && \
    cp /usr/share/zoneinfo/Asia/Chongqing /etc/localtime && \
    echo "Asia/Chongqing" > /etc/timezone

RUN pip3 install requests
RUN pip3 install PyExecJS

