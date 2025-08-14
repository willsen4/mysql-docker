-- Acessar o Shell do contêiner MySQL 
Bash
docker exec -it mysql-app mysql -uroot -p

-- Cria o usuário 'seu_usuario' com a senha 'sua_senha'
CREATE USER 'seu_usuario'@'%' IDENTIFIED BY 'sua_senha'; -- Cria usuários com permissões remotas (%)
CREATE USER 'seu_usuario'@'localhost' IDENTIFIED BY 'sua_senha'; -- cria usuários com permissão local (localhost)

-- Cria/atualiza para localhost com a mesma senha simples
CREATE USER IF NOT EXISTS 'seu_usuario'@'localhost' IDENTIFIED BY 'sua_senha';

-- Lista os usuários criados no MySQL
SELECT user, host FROM mysql.user;

-- Alterar senha
SQL
ALTER USER 'seu_usuario'@'%' IDENTIFIED BY 'SUA_NOVA_SENHA_FORTE';
ALTER USER 'seu_usuario'@'localhost' IDENTIFIED BY 'SUA_NOVA_SENHA_FORTE'; -- 

-- Remove todas as instâncias existentes do usuário 'seu_usuario' para evitar conflitos
DROP USER IF EXISTS 'seu_usuario'@'localhost';
DROP USER IF EXISTS 'seu_usuario'@'%';
-- Se você viu um IP específico no erro (ex: ip_da_network), adicione:
DROP USER IF EXISTS 'seu_usuario'@'ip_da_network';

-- Garante que o banco de dados 'nome_do_banco' exista
CREATE DATABASE IF NOT EXISTS nome_do_banco;





-- Concede todas as permissões no banco de dados 'nome_do_banco' para este usuário
GRANT ALL PRIVILEGES ON seu_banco.* TO 'seu_usuario'@'%';
GRANT ALL PRIVILEGES ON seu_banco.* TO 'seu_usuario'@'localhost';



-- IMPORTANTE: Recarrega as tabelas de privilégios para que as alterações entrem em vigor imediatamente.
FLUSH PRIVILEGES;

-- Saia do cliente MySQL.
EXIT;

-- Exemplo criação de banco para GLPI
CREATE DATABASE glpi_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'glpi_user'@'%' IDENTIFIED BY 'sua_senha_forte';
GRANT ALL PRIVILEGES ON glpi_db.* TO 'glpi_user'@'%';
-- Permitir que os usuarios do glpi acessem a tabela timezone do mySQL
GRANT SELECT ON mysql.time_zone_name TO 'glpi_user'@'%';
FLUSH PRIVILEGES;
