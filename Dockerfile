FROM yunsur/alpine-glibc

ARG SNELL_SERVER_PACKAGE_URL="https://github.com/surge-networks/snell/releases/download"
ARG SNELL_SERVER_PACKAGE_VERSION="v2.0.3"

ENV PORT=443
ENV OBFS=tls
ENV PSK=

COPY docker-entrypoint.sh /usr/local/bin/

RUN SNELL_SERVER_PACKAGE_FILENAME="snell-server-$SNELL_SERVER_PACKAGE_VERSION-linux-amd64.zip" && \
    echo "$SNELL_SERVER_PACKAGE_URL/$SNELL_SERVER_PACKAGE_VERSION/$SNELL_SERVER_PACKAGE_FILENAME" && \
    wget --no-check-certificate "$SNELL_SERVER_PACKAGE_URL/$SNELL_SERVER_PACKAGE_VERSION/$SNELL_SERVER_PACKAGE_FILENAME" && \
    unzip "$SNELL_SERVER_PACKAGE_FILENAME" && \
    rm -f "$SNELL_SERVER_PACKAGE_FILENAME" && \
    chmod +x snell-server && \
    mv snell-server /usr/local/bin/ && \
    chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
