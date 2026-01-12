# Baseado em Ubuntu
FROM ubuntu:22.04

# Evita prompts interativos
ENV DEBIAN_FRONTEND=noninteractive

# Atualiza pacotes e instala Nginx
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Remove configuração padrão do Nginx
RUN rm /etc/nginx/sites-enabled/default || true
RUN rm /etc/nginx/conf.d/default.conf || true

# Expõe portas HTTP e HTTPS
EXPOSE 80 443

# Comando padrão: iniciar Nginx em foreground
CMD ["nginx", "-g", "daemon off;"]