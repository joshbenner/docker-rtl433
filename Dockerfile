FROM alpine:3.16.0

RUN apk add --no-cache rtl_433

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
