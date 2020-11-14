FROM alpine:3.12

ENV RTL433_VERSION=20.11

RUN apk add --no-cache libusb librtlsdr && \
    apk add --no-cache --virtual .deps cmake build-base libtool libusb-dev librtlsdr-dev && \
    wget https://github.com/merbanan/rtl_433/archive/${RTL433_VERSION}.tar.gz && \
    tar -xzvf ${RTL433_VERSION}.tar.gz && \
    cd rtl_433-${RTL433_VERSION} && \
    mkdir build && cd build && cmake .. && make && make install && \
    cd / && \
    rm -rf rtl_433-${RTL433_VERSION} ${RTL433_VERSION}.tar.gz && \
    apk del .deps

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
