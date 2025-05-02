# financas_laravel_docker
Configuracao de um ambiente de desenvolvimento com Docker para o projeto Financas_laravel.
Para executar os containers, e criar o ambiente de desenvolvimento, serão necessários os seguintes passos:

### 1. Arquivos necessários

Baixar os arquivos desse projeto na pasta que será utilizada para manter o sistema


### 2. IDE e extensões (opcional)

Atualmente utilizo a IDE VSCode para o desenvolvimento do projeto. Caso opte pelo mesmo software, recomendo as seguintes extenções:
    - Dev Containers (publisher: Microsoft)
    - Database Client (publisher: database-client.com)

A primeira extensão permitirá abrir o projeto na IDE diretamente do container, o que facilitará o desenvolvimento, não precisando comitar as alterações cada vez que for testar. A segunda extensão permitirá acessar o banco de dados diretamente do VSCode, sem a necessidade de um terceiro software.


### 3. Comandos

Para iniciar o ambiente, execute os seguintes comandos, usando o prompt, no mesmo diretório onde os arquivos do projeto foram baixados (docker-compose.yml e Dockerfile):
    - docker-compose build
    - docker-compose up -d



### 4. Preparar sistema

As próximas alterações serão diretamente no container. Para isso, entre no container utilizando o comando:
    - docker-compose exec -it <nome_projeto> bash

Obs.: No momento, o valor de <nome_projeto> é "ubuntu", mas atente-se a possibilidade de o valor ser diferente. Caso precise alterar, busque no arquivo "docker-compose.yml" o nome dado ao container correspondente ao sistema.

Dentro do container atualize (caso necessário) os dados do arquivo .env. Os valores que precisão ser verificados são os seguintes:

'''
DB_CONNECTION=mysql
DB_HOST=<nome_container_banco>
DB_PORT=3306
DB_DATABASE=<nome_banco>
DB_USERNAME=<nome_usuario>
DB_PASSWORD=<senha_usuario>
'''

Obs.: O projeto atualmente utiliza o banco MariaDB, caso seja alterado, será necessário alterar também os dados das variáveis DB_CONNECTION e DB_PORT. Além disso, atualmente os demais valores são:

'''
DB_CONNECTION=mysql
DB_HOST=mariadb
DB_PORT=3306
DB_DATABASE=financas
DB_USERNAME=root
DB_PASSWORD=root
'''




