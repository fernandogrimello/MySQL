create database sistemadegestao;
use sistemadegestao;

create table clientes(
    clientes_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome varchar(50) NOT NULL,
    cnpj varchar(14) NOT NULL UNIQUE,
    contato varchar(16) NOT NULL,
    status varchar(50) DEFAULT 'Pedente'
);

create table motoristas(
    motoristas_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cnh varchar(11) NOT NULL UNIQUE,
    nome varchar(50) NOT NULL,
    telefone varchar(16) NOT NULL,
    status varchar(50) DEFAULT 'Ativo'
);

ALTER TABLE veiculos
ADD COLUMN motoristas_id INT,
ADD FOREIGN KEY (motoristas_id) REFERENCES motoristas(motoristas_id);
UPDATE veiculos SET motoristas_id = 1 WHERE veiculos_id = 1;
UPDATE veiculos SET motoristas_id = 2 WHERE veiculos_id = 2;


create table veiculos(
    veiculos_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    placa varchar(7) NOT NULL UNIQUE,
    modelo varchar(50) NOT NULL,
    ano int(4) NOT NULL,
    capacidade int NOT NULL,
    status varchar(50) DEFAULT 'Suspenso'
);

create table rotas(
    rotas_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    origem varchar(50) NOT NULL,
    destino varchar(50) NOT NULL,
    distancia int NOT NULL,
    prazo varchar(50) NOT NULL
);

create table entregas(
    entregas_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    clientes_id int,
    veiculos_id int,
    rotas_id int,
    data_saida date,
    previsao date,
    entrega_real date,
    status varchar(50) DEFAULT 'entrega pedente',
    FOREIGN KEY (clientes_id) REFERENCES clientes(clientes_id),
    FOREIGN KEY (veiculos_id) REFERENCES veiculos(veiculos_id),
    FOREIGN KEY (rotas_id) REFERENCES rotas(rotas_id)
);

create table ocorrencia(
    ocorrencia_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    entregas_id int,
    tipo varchar(50) NOT NULL,
    descricao text,
    data_ocorrencia datetime NOT NULL,
    FOREIGN KEY (entregas_id) REFERENCES entregas(entregas_id)
);

create table pagamentos(
    pagamentos_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    clientes_id int,
    entregas_id int,
    valor decimal(10,2) NOT NULL,
    forma varchar(50) NOT NULL,
    status varchar(50) DEFAULT 'Nao concluido',
    FOREIGN KEY (clientes_id) REFERENCES clientes(clientes_id),
    FOREIGN KEY (entregas_id) REFERENCES entregas(entregas_id)
);

create table funcionarios_ADM(
    funcionarios_ADM int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    matricula int(20) UNIQUE,
    nome varchar(50) NOT NULL,
    setor varchar(50) NOT NULL,
    contato varchar(17)
);