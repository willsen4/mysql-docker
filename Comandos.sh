#Comandos úteis
Acessa a pasta
cd mysql-docker

Logs
docker logs mysql-app

#Remover o conteiner
docker compose down

#Altera o arquivo de configuração
nano docker-compose.yml

#Recria o conteiner
docker compose up -d
----------------------------------------------
#Comandos no shell do MySQL:

#Acesse o Shell do conteiner
Bash
docker exec -it glpi-app bash

#Acesse o Cliente do container MySQL
docker exec -it mysql-app mysql -uroot -p

#Lista os usuários criados no MySQL (localhost são usuários com permissão local / % são usuários permissões remotas)
SELECT user, host FROM mysql.user;

#Alterar senha
SQL
ALTER USER 'seu_user'@'%' IDENTIFIED BY 'SUA_NOVA_SENHA_FORTE';
ALTER USER 'seu_user'@'localhost' IDENTIFIED BY 'SUA_NOVA_SENHA_FORTE'; -- Mantenha se você criou para localhost
FLUSH PRIVILEGES;
EXIT;
---------------------------------------------

#Comando para criar usuário e senha no MySQL
-- 1. Garante que o banco de dados 'nome_do_banco' exista
CREATE DATABASE IF NOT EXISTS nome_do_banco;

-- 2. Remove todas as instâncias existentes do usuário 'seu_usuario' para evitar conflitos
DROP USER IF EXISTS 'seu_usuario'@'localhost';
DROP USER IF EXISTS 'seu_usuario'@'%';
-- Se você viu um IP específico no erro (ex: ip_da_network), adicione:
-- DROP USER IF EXISTS 'seu_usuario'@'ip_da_network';

-- 3. Cria o usuário 'seu_usuario' com a NOVA SENHA SIMPLES e permite conexão de qualquer host ('%')
CREATE USER 'seu_usuario'@'%' IDENTIFIED BY 'sua_senha';

-- 4. Concede todas as permissões no banco de dados 'nome_do_banco' para este usuário
GRANT ALL PRIVILEGES ON seu_banco.* TO 'seu_usuario'@'%';

-- 5. Opcional, para garantir: cria/atualiza para localhost com a mesma senha simples
CREATE USER IF NOT EXISTS 'seu_usuario'@'localhost' IDENTIFIED BY 'teampass123';
GRANT ALL PRIVILEGES ON seu_banco.* TO 'seu_usuario'@'localhost';

-- 6. IMPORTANTE: Recarrega as tabelas de privilégios para que as alterações entrem em vigor imediatamente.
FLUSH PRIVILEGES;

-- 7. Saia do cliente MySQL.
EXIT;