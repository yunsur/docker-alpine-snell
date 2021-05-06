FROM yunsur/alpine-glibc

ARG PKG_URL="https://github.com/surge-networks/snell/releases/download"
ARG PKG_VERSION="v2.0.4"
ARG PKG_PREFIX="snell-server-${PKG_VERSION}-linux-amd64"
ARG PKG_SUFFIX=".zip"
ARG PKG_NAME="$PKG_PREFIX$PKG_SUFFIX"

ENV PORT=443
ENV OBFS=tls
ENV PSK=

COPY docker-entrypoint.sh /usr/local/bin/
COPY snell-server.conf.template /etc/snell/snell-server.conf.template

RUN wget --no-check-certificate $PKG_URL/$PKG_VERSION/$PKG_NAME && \
    unzip $PKG_NAME && \
    cp snell-server /usr/local/bin/ && \
    chmod +x snell-server && \
    chmod +x /usr/local/bin/docker-entrypoint.sh && \
    rm -f $PKG_NAME

VOLUME /etc/snell

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["/usr/local/bin/snell-server", "-c", "/etc/snell/snell-server.conf"]
