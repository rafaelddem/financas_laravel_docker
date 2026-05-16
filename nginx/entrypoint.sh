#!/bin/sh

DOMINIO="rafaelsolucoesdigitais.com.br"
CERT_DIR="/etc/letsencrypt/live/$DOMINIO"

if [ ! -f "$CERT_DIR/fullchain.pem" ]; then
    echo "Certificado real não encontrado. Criando certificado temporário..."
    mkdir -p "$CERT_DIR"
    openssl req -x509 -nodes -days 1 -newkey rsa:2048 \
        -keyout "$CERT_DIR/privkey.pem" \
        -out "$CERT_DIR/fullchain.pem" \
        -subj "/CN=localhost"
fi

echo "Iniciando o Nginx normalmente..."
exec nginx -g 'daemon off;'