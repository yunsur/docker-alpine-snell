FROM yunsur/alpine-glibc

ARG SNELL_SERVER_VERSION=v2.0.3
ARG SNELL_SERVER_PACKAGE=https://github.com/surge-networks/snell/releases/download/${SNELL_SERVER_VERSION}/snell-server-${SNELL_SERVER_VERSION}-linux-amd64.zip

ENV LANG=C.UTF-8
ENV PORT=443
ENV PSK=
ENV OBFS=tls

COPY entrypoint.sh /usr/bin/

RUN wget --no-check-certificate -O snell.zip $SNELL_SERVER_PACKAGE && \
    unzip snell.zip && \
    rm -f snell.zip && \
    chmod +x snell-server && \
    mv snell-server /usr/local/bin/ && \
    chmod +x /usr/bin/local/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
