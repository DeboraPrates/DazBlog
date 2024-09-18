-- Banco de Dados "DazBlog"

-- apaga o banco de dados, caso ele já exista
-- não é recomendado fazer isso em modo de produção 
DROP DATABASE IF EXISTS dazblogdb;

-- cria o banco de dados novamente
-- não é recomendado fazer isso em modo de produção
CREATE DATABASE dazblogdb;

    --usando o conjunto de caracteres UTF-8
    CHARACTER SET utf8mb4

    -- buscas em UTF-8 e case insesitive
    COLLATE utf8mb4_general_cl;

-- seleciona o banco de dados para os próximos comandos
USE dazblogdb;

-- cria a tabela "staff"
CREATE TABLE staff (
    sta_id INT PRIMARY KEY AUTO_INCREMENT,
    sta_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    sta_name VARCHAR (127) NOT NULL,
    sta_email VARCHAR (255) NOT NULL,
    sta_password VARCHAR (63) NOT NULL,
    sta_birth DATE NOT NULL,
    sta_description VARCHAR (255),
    sta_type ENUM('moderator', 'author' 'admin') DEFAULT 'moderator',
    sta_status ENUM('on', 'off', 'del') DEFAULT 'on'
);