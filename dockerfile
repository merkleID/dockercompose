FROM alpine:latest
RUN apk update && apk add \
    tor bash nano \
#    --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
    --update-cache --repository https://dl-3.alpinelinux.org/alpine/latest-stable/main/ \
    && rm -rf /var/cache/apk/*
EXPOSE 9050
COPY torrc.default /etc/tor/torrc.default
RUN chown -R tor /etc/tor
USER tor
ENTRYPOINT [ "tor" ]
CMD [ "-f", "/etc/tor/torrc.default" ]
