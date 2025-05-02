FROM ubuntu

ARG PORT=8000
EXPOSE $PORT

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y 
RUN apt-get install -y git 
RUN apt-get install -y php8.3 
RUN apt-get install -y php8.3-xml
RUN apt-get install -y php8.3-mysql
RUN apt-get install -y composer 
RUN apt-get install -y mysql-client

RUN mkdir -p /var/git/
WORKDIR /var/git/

RUN cd /var/git && \
    git clone https://github.com/rafaelddem/Financas_laravel.git

RUN cd Financas_laravel && composer update

WORKDIR /var/git/Financas_laravel/

RUN cp .env.example .env

ENTRYPOINT sleep infinity
