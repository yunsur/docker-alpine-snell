FROM yunsur/alpine-glibc

ARG PACKAGE_URL="https://github.com/surge-networks/snell/releases/download"
ARG PACKAGE_VERSION="v2.0.4"
ARG PACKAGE_PREFIX="snell-server-${PACKAGE_VERSION}-linux-amd64"
ARG PACKAGE_SUFFIX=".zip"
ARG PACKAGE_FILENAME="$PACKAGE_PREFIX$PACKAGE_SUFFIX"

ENV PORT=443
ENV OBFS=tls
ENV PSK=

COPY docker-entrypoint.sh /usr/local/bin/

RUN wget --no-check-certificate $PACKAGE_URL/$PACKAGE_VERSION/$PACKAGE_FILENAME && \
    unzip $PACKAGE_FILENAME && \
    cp snell-server /usr/local/bin/ && \
    chmod +x snell-server && \
    chmod +x /usr/local/bin/docker-entrypoint.sh && \
    rm -f $PACKAGE_FILENAME

VOLUME /etc/snell

ENTRYPOINT ["docker-entrypoint.sh"]
