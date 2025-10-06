CREATE DATABASE locadora_bikes;
USE locadora_bikes;

CREATE TABLE cliente (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    cpf VARCHAR(14),
    telefone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE bicicleta (
    id INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(10) UNIQUE,
    status ENUM('disponível', 'locada', 'manutenção') DEFAULT 'disponível'
);

CREATE TABLE manutencao (
    id INT PRIMARY KEY AUTO_INCREMENT,
    bicicleta_id INT,
    descricao TEXT,
    data DATE,
    FOREIGN KEY (bicicleta_id) REFERENCES bicicleta(id)
);

CREATE TABLE locacao (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    bicicleta_id INT,
    data_inicio DATETIME,
    data_fim DATETIME,
    status ENUM('ativa', 'finalizada'),
    FOREIGN KEY (cliente_id) REFERENCES cliente(id),
    FOREIGN KEY (bicicleta_id) REFERENCES bicicleta(id)
);

