-- --------------------------- --
-- Banco de dados "dazblogdb" --
-- --------------------------- --

-- Apaga o banco de dados caso ele já exista
DROP DATABASE IF EXISTS dazblogdb;

-- Cria o banco de dados novamente
CREATE DATABASE dazblogdb
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_general_ci;

-- Seleciona o banco de dados para os próximos comandos
USE dazblogdb;

-- Cria a tabela "staff"
CREATE TABLE staff (
    sta_id INT PRIMARY KEY AUTO_INCREMENT,
    sta_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    sta_name VARCHAR(127) NOT NULL,
    sta_email VARCHAR(255) NOT NULL,
    sta_password VARCHAR(63) NOT NULL,
    sta_birth DATE NOT NULL,
    sta_description VARCHAR(255),
    sta_type ENUM('moderator', 'author', 'admin') DEFAULT 'moderator',
    sta_status ENUM('on', 'off', 'del') DEFAULT 'on'
);

-- Cria a tabela "article"
CREATE TABLE article (
    art_id INT PRIMARY KEY AUTO_INCREMENT,
    art_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    art_title VARCHAR(127) NOT NULL,
    art_resume VARCHAR(255) NOT NULL,
    art_thumbnail VARCHAR(255) NOT NULL,
    art_content TEXT NOT NULL,
    art_view INT DEFAULT 0,
    art_author INT,
    art_status ENUM('on', 'off', 'del') DEFAULT 'on',
    FOREIGN KEY (art_author) REFERENCES staff (sta_id)
);

-- Cria a tabela "comment"
CREATE TABLE comment (
    com_id INT PRIMARY KEY AUTO_INCREMENT,
    com_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    com_article INT,
    com_author_name VARCHAR(127) NOT NULL,
    com_author_email VARCHAR(255) NOT NULL,
    com_comment TEXT NOT NULL,
    com_status ENUM('on', 'off', 'del') DEFAULT 'on',
    FOREIGN KEY (com_article) REFERENCES article (art_id)
);

-- Cria a tabela "contact"
CREATE TABLE contact (
    id INT PRIMARY KEY AUTO_INCREMENT,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    name VARCHAR(127) NOT NULL,
    email VARCHAR(127) NOT NULL,
    subject VARCHAR(127) NOT NULL,
    message TEXT NOT NULL,
    status ENUM('received', 'readed', 'responded', 'deleted') DEFAULT 'received'
);

-- Tabela "staff"
INSERT INTO staff (
    sta_name,
    sta_email,
    sta_password,
    sta_birth,
    sta_description,
    sta_type

) VALUES (
    'Maria Silva',
    'mariasilva@gmail.com',
    SHA1('Senha123'),
    '2000-11-05',
    'Escritora e revisora de textos',
    'author'
);

-- Inserindo um artigo
INSERT INTO article (
    art_title,
    art_resume,
    art_thumbnail,
    art_content,
    art_author

) VALUES (
    'Primeiro Artigo',
    'Lorem ipsum, dolor sit amet consectetur adipisicing elit.',
    'https://picsum.photos/300',
    '
    <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Aliquam aliquid fugiat quam deleniti nam. Doloremque accusantium quidem quod iste? Asperiores, laudantium consectetur! Atque modi dolore quis, nesciunt odio minima suscipit.</p>
    <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolorem at optio blanditiis delectus, assumenda dolorum perspiciatis dolor aliquid ea, neque numquam. Autem iste animi alias eligendi repellat vero ipsum temporibus.</p>
    <img src="https://picsum.photos/200/300" alt="Imagem Aleatória">
    <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nihil doloremque quibusdam natus, sint nam officiis, modi perferendis repellendus alias fuga aperiam! Corrupti eligendi eos voluptatum unde fugiat aliquam reiciendis totam!</p>
    <h4>Lista de Links:</h4>
    <ul>
        <li><a href="https://github.com" target="_blank">Github</a></li>
        <li><a href="https://innature.com" target="_blank">In Nature</a></li>
    </ul>
    <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sed adipisci ea ipsa, aspernatur temporibus dolore exercitationem molestiae odit vero. Repudiandae nobis aspernatur, corrupti eligendi sunt quisquam mollitia? Ab, officiis vero!</p>
    ',
    '2'
);
