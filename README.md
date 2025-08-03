
# Instalando MySQL com Docker

### Usando Docker Compose (Recomendado para projetos e ambientes de desenvolvimento) O Docker Compose permite definir e executar aplicativos multi-container Docker usando um arquivo YAML. É ideal para gerenciar o MySQL junto com outras aplicações (como um servidor web ou backend).
-----------
Crie um diretório para o seu projeto
```Bash
mkdir mysql-docker
cd mysql-docker
```
-----------
Crie um arquivo docker-compose.yml:
```Bash
nano docker-compose.yml
```
-------------
### Cole o conteúdo YAML
### Salve e feche o arquivo. (Em nano, pressione Ctrl+X, depois Y e Enter).
--------------
Suba os serviços com Docker Compose:
```Bash
docker compose up -d
````
---------------
Isso criará e iniciará o container MySQL em segundo plano.
----------
Verifique o status dos serviços:
````Bash
docker compose ps
````
-------------
Acessar o shell do contêiner MySQL
````Bash
docker exec -it mysql-app mysql -uroot -p
````
--------------
Será solicitada a senha que você definiu (sua_senha_segura).
Conectando-se ao MySQL
Após a instalação, você pode se conectar ao seu servidor MySQL usando um cliente MySQL, 
como o mysql-client (instalado na sua VM Debian) ou uma ferramenta gráfica como o DBeaver ou MySQL Workbench, 
usando os seguintes dados:
* Host: localhost (se você estiver na mesma VM Debian) ou o endereço IP da sua VM Proxmox/Debian (se estiver acessando de outra máquina na rede).
* Porta: 3306
* Usuário: root (ou o usuário que você criou via Docker Compose)
* Senha: A senha que você definiu (sua_senha_segura ou senha_do_usuario).
