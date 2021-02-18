#!/bin/ash

BIN="/usr/local/bin/snell-server"
CONF="/etc/snell/snell-server.conf"

# reuse existing config when the container restarts
run() {
    if [ -f ${CONF} ]; then
        echo "Found existing config..."
    else
    if [ -z ${PSK} ]; then
        PSK=$(hexdump -n 16 -e '4/4 "%08x" 1 "\n"' /dev/urandom)
        echo "Using generated PSK: ${PSK}"
    else
        echo "Using predefined PSK: ${PSK}"
    fi
        echo "Generating new config..."
        mkdir /etc/snell/
        echo "[snell-server]" >> ${CONF}
        echo "listen = 0.0.0.0:${PORT}" >> ${CONF}
        echo "psk = ${PSK}" >> ${CONF}
        echo "obfs = ${OBFS}" >> ${CONF}
    fi
    ${BIN} -c ${CONF}
}

run
