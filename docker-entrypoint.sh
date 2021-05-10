#!/bin/sh

CONF="/etc/snell/snell-server.conf"
TEMPLATE="/etc/snell/snell-server.conf.template"

run() {
    if [ -f ${CONF} ]; then
        echo "Found existing config..."
    else
        if [ -z ${PSK} ]; then
            PSK=$(hexdump -n 16 -e '4/4 "%08x" 1 "\n"' /dev/urandom)
            echo "Using generated PSK: ${PSK}"
        fi

        envsubst ' \
            ${PORT} \
            ${PSK} \
            ${OBFS} \
        ' < ${TEMPLATE} > ${CONF}
    fi
}

run

exec "$@"
