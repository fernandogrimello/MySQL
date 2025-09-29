-- Criando arquivo
create database ecommerce;
-- Acessando arquivo
use ecommerce;
-- Criado tabelas
-- Create the database schema
CREATE TABLE usuarios (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    senha VARCHAR(255),
    celular VARCHAR(255),
    cpf VARCHAR(14) UNIQUE,
    criado_em TIMESTAMP
);

CREATE TABLE enderecos (
    id INT PRIMARY KEY,
    cliente_id INT,
    rua VARCHAR(255),
    numero VARCHAR(50),
    bairro VARCHAR(255),
    cidade VARCHAR(255),
    estado VARCHAR(2),
    cep VARCHAR(10)
);

CREATE TABLE categorias (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    descricao TEXT
);

CREATE TABLE produtos (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    descricao TEXT,
    preco DECIMAL(10, 2),
    estoque INT,
    categoria_id INT
);

CREATE TABLE pedidos (
    id INT PRIMARY KEY,
    cliente_id INT,
    data_pedido TIMESTAMP,
    status VARCHAR(50),
    total DECIMAL(10, 2)
);

CREATE TABLE itens_pedido (
    id INT PRIMARY KEY,
    pedido_id INT,
    produto_id INT,
    quantidade INT,
    preco_unitario DECIMAL(10, 2)
);
