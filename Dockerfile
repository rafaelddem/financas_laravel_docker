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

RUN git config --global user.name "Rafael"
RUN git config --global user.email "rafaelddem@gmail.com"

RUN mkdir -p /var/git/

WORKDIR /var/git/

RUN git clone https://github.com/rafaelddem/Financas_laravel.git

WORKDIR /var/git/Financas_laravel/

RUN composer update

RUN git checkout adicao_front && git pull

RUN cp .env.example .env

RUN php artisan key:generate

ENTRYPOINT sleep infinity
