#!/bin/sh

if [ "$ENVIRONMENT" = "dev" ]; then
    echo "Ambiente de Desenvolvimento detectado. Usando localhost."
    DOMINIO="localhost"
    DAYS_TO_EXPIRE=365
else
    echo "Ambiente de Produção/Padrão detectado."
    DOMINIO="rafaelsolucoesdigitais.com.br"
    DAYS_TO_EXPIRE=1
fi

CERT_DIR="/etc/letsencrypt/live/$DOMINIO"

if [ ! -f "$CERT_DIR/fullchain.pem" ]; then
    echo "Certificado não encontrado. Criando certificado para $DOMINIO..."
    mkdir -p "$CERT_DIR"
    openssl req -x509 -nodes -days $DAYS_TO_EXPIRE -newkey rsa:2048 \
        -keyout "$CERT_DIR/privkey.pem" \
        -out "$CERT_DIR/fullchain.pem" \
        -subj "/CN=$DOMINIO"
fi

echo "Iniciando o Nginx normalmente..."
exec nginx -g 'daemon off;'
