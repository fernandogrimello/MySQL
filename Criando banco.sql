create database ecommerce;
use ecommerce;

create table cliente(
	id int auto_increment primary key,
	nome varchar(100) not null,
	email varchar(100) not null,
    senha varchar(10) not null,
    telefone varchar(20),
    criando_em datetime default current_timestamp
);

use ecommerce;

create table enderecos(
id int auto_increment primary key,
cliente_id int,
rua varchar(100),
numero varchar(10),
complemento varchar(100),
bairro varchar(50),
cidade varchar(50),
estado char(2)
);

use ecommerce;

create table categorias(
id int auto_increment primary key,
nome varchar(100) not null,
descricao text
);

create table produtos(
id int auto_increment primary key,
cliente_id int,
data_pedido datetime default current_timestamp,
status varchar(50) default 'Pendente',
total decimal(10,2)
);

create table itens_pedido(
id int auto_increment primary key,
pedido_id int,
produto_id int,
quantidade int not null,
preco_unitario decimal(10,2) not null
);

alter table cliente
change column telefone celular varchar(15);

rename table cliente to usuarios;
alter table usuario
add column telefone varchar(12) after email;

alter table enderecos add column cep varchar(10) after estado;

use ecommerce;
create table pedidos(
id int auto_increment primary key,
pedido_id int,
data_pedido datetime default current_timestamp,
sitacao varchar(50) default 'Pendente',
total decimal(10,2)
);

alter table usuarios
add index idx_email (email);
