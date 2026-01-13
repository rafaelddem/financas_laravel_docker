# financas_laravel_docker
Configuracao de um ambiente de desenvolvimento com Docker para o projeto Financas_laravel.
Para executar os containers, e criar o ambiente de desenvolvimento, serão necessários os seguintes passos:

### 1. Arquivos necessários

Baixar os arquivos desse projeto na pasta que será utilizada para manter o sistema


### 2. Preparar ambiente

Para testes usando o Nginx, será necessário altere o arquivo hosts. Se for esse o caso, adicione a seguinte linha ao hosts do sistema
```127.0.0.1      financas```


### 3. IDE e extensões (opcional)

Atualmente utilizo a IDE VSCode para o desenvolvimento do projeto. Caso opte pelo mesmo software, recomendo as seguintes extenções:
- Dev Containers (publisher: Microsoft)
- Database Client (publisher: database-client.com)

A primeira extensão permitirá abrir o projeto na IDE diretamente do container, o que facilitará o desenvolvimento, não precisando comitar as alterações cada vez que for testar. A segunda extensão permitirá acessar o banco de dados diretamente do VSCode, sem a necessidade de um terceiro software.


### 4. Preparar sistema

Para iniciar o sistema, execute o seguinte comando, usando o prompt, no mesmo diretório onde os arquivos do projeto foram baixados:
- ```docker-compose up -d --build```

Aqui já é possível testar se o sistema está funcional através do link "http://financas", entretanto o sistema possui somente dados default, não contendo nada além dos dados do próprio sistema.
Caso seja interessante adicionar alguma seeder, serão necessários os seguintes passos:
- Entre no container do backend (Laravel) com o comando: ```docker-compose exec -it <nome_container> bash```
- Adicione o seeder desejado a pasta dos seeders (.\Database\Seeders)
- Execute o seguinte comando: ```php artisan db:prepare --restore=<nome_do_seeder>```

O sistema já possui dados de acesso ao banco, mas caso seja necessário atualizar os dados de acesso, altere as seguintes infomações do arquivo .env:

```
DB_CONNECTION=mysql
DB_HOST=<nome_container_banco>
DB_PORT=3306
DB_DATABASE=<nome_banco>
DB_USERNAME=<nome_usuario>
DB_PASSWORD=<senha_usuario>
```

Obs.: O projeto atualmente utiliza o banco MariaDB, caso seja alterado, será necessário alterar também os dados das variáveis DB_CONNECTION e DB_PORT.

Em caso de alteração de configurações que precise reiniciar o sistema, execute os comandos
- ```docker-compose down```
- ```docker-compose up -d --build```

Obs.: Dependendo das alterações aplicadas ao projeto (Financas_laravel), pode ser necessário rodar o build sem nenhum cache. Nesse caso, rode os comandos: 
- ```docker-compose down```
- ```docker-compose up build --no-cache```
- ```docker-compose up -d```

OS COMANDOS A SEGUIR PRECISAO DE REVISAO: 
Para reinciar o sistema, sem reinciar o container teste: ```pkill -f "php artisan serve"``` e ```php artisan serve --host=0.0.0.0 --port=8000```


### 5. Acessar sistema

Como comentado no item anterior, o sismtema já está disponível, basta usar um dos seguintes links:

[Acesso direto com Laravel](http://localhost:8000)

[Acesso passando pelo Nginx](http://financas:80)
