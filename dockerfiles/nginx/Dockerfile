FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN rm -f /etc/nginx/sites-enabled/default && \
    rm -f /etc/nginx/conf.d/default.conf

RUN mkdir -p /var/log/nginx && \ 
    mkdir -p /var/cache/nginx && \ 
    chown -R www-data:www-data /var/log/nginx /var/cache/nginx && \ 
    touch /var/log/nginx/financas_access.log /var/log/nginx/financas_error.log && \ 
    chmod 644 /var/log/nginx/*

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
