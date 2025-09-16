create database ecommerce;
use ecommerce;

create table usuarios(
	id int auto_increment primary key,
	nome varchar(100) not null,
	email varchar(100) not null,
    senha varchar(10) not null,
    celular varchar(20),
    cpf varchar(14),
    criando_em datetime default current_timestamp
);

alter table usuarios
add column cpf varchar(14) after celular;

alter table usuarios
drop column telefone;

alter table usuarios
modify cpf varchar(14) not null;

alter table usuarios
change column criando_em criado_em datetime default current_timestamp;

insert into usuarios
	(nome,email,senha,celular,cpf,criado_em)
values
('Breno Garcia', 'alexia96@example.net', 'td2Zp35g4!', '(084) 8081-6924', '817.432.695-28', NOW()),
('Liam Barbosa', 'aragaomaite@example.net', ')bB2qDFCh1', '+55 31 6638-5493', '062.791.935-21', NOW()),
('Sophia Oliveira', 'sophia.oliveira@example.com', 'S0ph1@2024', '(011) 9876-5432', '123.456.789-00', NOW()),
('Miguel Santos', 'miguel.santos@example.net', 'M1gu3l#99', '(021) 3456-7890', '234.567.890-11', NOW()),
('Alice Costa', 'alice.costa@example.org', 'Al1c3$2024', '(031) 8765-4321', '345.678.901-22', NOW()),
('Arthur Pereira', 'arthur.pereira@example.com', 'ArtH@ur10', '(041) 2345-6789', '456.789.012-33', NOW()),
('Helena Rodrigues', 'helena.rodrigues@example.net', 'H3l3n@99', '(051) 7654-3210', '567.890.123-44', NOW()),
('Davi Almeida', 'davi.almeida@example.org', 'D@v1_2024', '(061) 1234-5678', '678.901.234-55', NOW()),
('Valentina Lima', 'valentina.lima@example.com', 'V@l3nt1n', '(071) 8765-4321', '789.012.345-66', NOW()),
('Gabriel Silva', 'gabriel.silva@example.net', 'G@br1el#', '(081) 2345-6789', '890.123.456-77', NOW()),
('Laura Mendes', 'laura.mendes@example.org', 'L@ur@2024', '(091) 7654-3210', '901.234.567-88', NOW()),
('Lucas Oliveira', 'lucas.oliveira@example.com', 'Luc@s2024', '(011) 9876-1234', '012.345.678-99', NOW()),
('Isabella Souza', 'isabella.souza@example.net', 'Is@b3ll@', '(021) 3456-1234', '123.456.789-10', NOW()),
('Matheus Costa', 'matheus.costa@example.org', 'M@th3us#', '(031) 8765-1234', '234.567.890-21', NOW()),
('Manuela Santos', 'manuela.santos@example.com', 'M@nu3l@', '(041) 2345-1234', '345.678.901-32', NOW()),
('Pedro Pereira', 'pedro.pereira@example.net', 'P3dr0_202', '(051) 7654-1234', '456.789.012-43', NOW()),
('Giovanna Rodrigues', 'giovanna.rodrigues@example.org', 'G1ov@nn@', '(061) 1234-1234', '567.890.123-54', NOW()),
('Enzo Almeida', 'enzo.almeida@example.com', '3nz0@2024', '(071) 8765-1234', '678.901.234-65', NOW()),
('Luiza Lima', 'luiza.lima@example.net', 'L@u1z@99', '(081) 2345-1234', '789.012.345-76', NOW()),
('Felipe Silva', 'felipe.silva@example.org', 'F3l1p3#', '(091) 7654-1234', '890.123.456-87', NOW()),
('Beatriz Mendes', 'beatriz.mendes@example.com', 'B3@tr1z@', '(011) 9876-5678', '901.234.567-98', NOW()),
('Rafael Oliveira', 'rafael.oliveira@example.net', 'R@f@3l20', '(021) 3456-5678', '012.345.678-09', NOW()),
('Júlia Souza', 'julia.souza@example.org', 'J@l1@202', '(031) 8765-5678', '123.456.789-20', NOW()),
('Bruno Costa', 'bruno.costa@example.com', 'Br@n0#24', '(041) 2345-5678', '234.567.890-31', NOW()),
('Larissa Santos', 'larissa.santos@example.net', 'L@r1ss@', '(051) 7654-5678', '345.678.901-42', NOW()),
('Gustavo Pereira', 'gustavo.pereira@example.org', 'Gust@v0', '(061) 1234-5678', '456.789.012-53', NOW()),
('Carolina Rodrigues', 'carolina.rodrigues@example.com', 'C@r0l#20', '(071) 8765-5678', '567.890.123-64', NOW()),
('Vinícius Almeida', 'vinicius.almeida@example.net', 'V1n1c1us', '(081) 2345-5678', '678.901.234-75', NOW()),
('Eduarda Lima', 'eduarda.lima@example.org', '3d@urd@', '(091) 7654-5678', '789.012.345-86', NOW()),
('Leonardo Silva', 'leonardo.silva@example.com', 'L3on@rd', '(011) 9876-9999', '890.123.456-97', NOW());
------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------
create table enderecos(
id int auto_increment primary key,  
cliente_id int,
rua varchar(100), 
numero varchar(10), 
bairro varchar(50), 
cidade varchar(50), 
estado char(2),
cep varchar(10)
);

use ecommerce;

alter table enderecos
add column cliente_id int;

alter table enderecos
modify column cliente_id int after id;

alter table endereco
change column complemento cep varchar(10) after estado;

ALTER TABLE enderecos
DROP COLUMN complemento;

ALTER TABLE enderecos
DROP COLUMN cliente_id;

truncate table enderecos;

INSERT INTO enderecos
(cliente_id, rua, numero, bairro, cidade, estado, cep)
VALUES
(1, 'Colônia Rodrigo Mendes','6774','Embaúbas','Ferreira','SC','18944-467'),
(2, 'Rua das Flores', '123', 'Centro', 'São Paulo', 'SP', '01001-000'),
(3, 'Avenida Brasil', '456', 'Jardim América', 'Rio de Janeiro', 'RJ', '22000-000'),
(4, 'Travessa da Paz', '789', 'Vila Nova', 'Belo Horizonte', 'MG', '30000-000'),
(5, 'Alameda Santos', '101', 'Paraíso', 'São Paulo', 'SP', '01418-000'),
(6, 'Rua Augusta', '202', 'Consolação', 'São Paulo', 'SP', '01305-000'),
(7, 'Avenida Paulista', '303', 'Bela Vista', 'São Paulo', 'SP', '01311-000'),
(8, 'Rua Oscar Freire', '404', 'Jardins', 'São Paulo', 'SP', '01426-000'),
(9, 'Rua 25 de Março', '505', 'Centro', 'São Paulo', 'SP', '01021-000'),
(10, 'Avenida Atlântica', '606', 'Copacabana', 'Rio de Janeiro', 'RJ', '22021-000'),
(11, 'Rua Visconde de Pirajá', '707', 'Ipanema', 'Rio de Janeiro', 'RJ', '22410-000'),
(12, 'Rua do Ouvidor', '808', 'Centro', 'Rio de Janeiro', 'RJ', '20040-000'),
(13, 'Avenida Afonso Pena', '909', 'Centro', 'Belo Horizonte', 'MG', '30130-000'),
(14, 'Rua da Bahia', '111', 'Centro', 'Belo Horizonte', 'MG', '30160-000'),
(15, 'Avenida Contorno', '222', 'Funcionários', 'Belo Horizonte', 'MG', '30110-000'),
(16, 'Rua Sete de Setembro', '333', 'Centro', 'Curitiba', 'PR', '80020-000'),
(17, 'Avenida República Argentina', '444', 'Água Verde', 'Curitiba', 'PR', '80620-000'),
(18, 'Rua XV de Novembro', '555', 'Centro', 'Curitiba', 'PR', '80010-000'),
(19, 'Avenida Beira Mar', '666', 'Meireles', 'Fortaleza', 'CE', '60165-000'),
(20, 'Rua Iracema', '777', 'Praia de Iracema', 'Fortaleza', 'CE', '60060-000'),
(21, 'Avenida Dom Manuel', '888', 'Centro', 'Fortaleza', 'CE', '60060-000'),
(22, 'Rua da Concórdia', '999', 'Centro', 'Recife', 'PE', '50020-000'),
(23, 'Avenida Boa Viagem', '121', 'Boa Viagem', 'Recife', 'PE', '51020-000'),
(24, 'Rua do Imperador', '232', 'Santo Antônio', 'Recife', 'PE', '50010-000'),
(25, 'Avenida Tocantins', '343', 'Setor Oeste', 'Goiânia', 'GO', '74110-000'),
(26, 'Rua 7', '454', 'Setor Oeste', 'Goiânia', 'GO', '74115-000'),
(27, 'Avenida Goiás', '565', 'Centro', 'Goiânia', 'GO', '74030-000'),
(28, 'Rua João Pessoa', '676', 'Centro', 'Porto Alegre', 'RS', '90010-000'),
(29, 'Avenida Farrapos', '787', 'São João', 'Porto Alegre', 'RS', '90200-000'),
(30, 'Rua dos Andradas', '898', 'Centro', 'Porto Alegre', 'RS', '90020-000');

select * from enderecos;
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

create table categorias(
id int auto_increment primary key,
nome varchar(100) not null,
descricao text
);

insert into categorias
(nome,descricao)
values
('Roupas','Categoria de roupas'),
('Esportes','Categoria de esportes'),
('Livros','Categoria de livros'),
('Eletrônicos', 'Produtos eletrônicos e dispositivos tecnológicos'),
('Celulares', 'Smartphones e telefones móveis'),
('Informática', 'Computadores, notebooks e acessórios'),
('Games', 'Jogos eletrônicos e consoles'),
('Móveis', 'Móveis para casa e escritório'),
('Decoração', 'Itens decorativos para ambientes'),
('Beleza', 'Produtos de beleza e cuidados pessoais'),
('Saúde', 'Produtos para saúde e bem-estar'),
('Automotivo', 'Peças e acessórios para veículos'),
('Ferramentas', 'Ferramentas para construção e manutenção'),
('Brinquedos', 'Brinquedos e jogos infantis'),
('Bebês', 'Produtos para bebês e crianças pequenas'),
('Alimentos', 'Alimentos e produtos alimentícios'),
('Bebidas', 'Bebidas em geral'),
('Casa', 'Produtos para casa e lar'),
('Jardim', 'Produtos para jardinagem e área externa'),
('Pet', 'Produtos para animais de estimação'),
('Esportes', 'Artigos esportivos e equipamentos'),
('Moda', 'Roupas, calçados e acessórios'),
('Calçados', 'Sapatos, tênis e calçados em geral'),
('Acessórios', 'Acessórios pessoais e fashion'),
('Joias', 'Joias e bijuterias'),
('Relógios', 'Relógios e cronômetros'),
('Instrumentos', 'Instrumentos musicais'),
('Livros', 'Livros e publicações'),
('Papelaria', 'Material de escritório e papelaria'),
('Construção', 'Materiais de construção'),
('Iluminação', 'Lâmpadas e iluminação'),
('Viagem', 'Produtos para viagem e turismo');

select * from categorias;

--------------------------------------------------------------
--------------------------------------------------------------

create table produtos(
id int auto_increment primary key,
nome varchar(20),
descricao text,
preco decimal(20,2),
estoque int,
categoria_id int
);

alter table produtos
drop column cliente_id;

alter table produtos
add column usuario_id int;

alter table produtos 
change column usuario_id usuario_id int after id;

alter table produtos
add column nome varchar(20) after id;

alter table produtos
add column descricao text after nome;

alter table produtos
add column preco decimal(10,2) after descricao;

alter table produtos
add column estoque int after preco;

alter table produtos
add column categoria_id int after estoque;

alter table produtos
drop column usuario_id;

alter table produtos
drop column data_pedido;

alter table produtos
drop column status;

alter table produtos
drop column	total;

INSERT INTO produtos
(nome, descricao, preco, estoque, categoria_id)
VALUES
('Fritadeira Air', 'Fritadeira elétrica sem óleo 5L', 429.90, 28, 9),
('Headphone Studio', 'Fone de ouvido profissional para estúdio', 599.90, 18, 2),
('Mochila Notebook', 'Mochila resistente para notebook até 17"', 189.90, 55, 8),
('Smartphone X', 'Celular de última geração com 128GB', 1299.99, 45, 2),
('Notebook Pro', 'Notebook i7 16GB RAM 512GB SSD', 3599.90, 20, 3),
('Tênis Run', 'Tênis esportivo para corrida', 299.50, 100, 1),
('Camiseta Basic', 'Camiseta 100% algodão', 49.90, 200, 1),
('Livro PHP', 'Aprenda PHP do zero ao avançado', 89.90, 35, 5),
('Fone Bluetooth', 'Fone sem fio com cancelamento de ruído', 399.90, 60, 2),
('Mesa Escritório', 'Mesa de madeira 140x70cm', 599.00, 15, 6),
('Cadeira Gamer', 'Cadeira ergonômica para gamers', 899.90, 25, 6),
('Smart TV 55"', 'TV LED 4K 55 polegadas', 2199.00, 30, 2),
('Tablet Lite', 'Tablet 10 polegadas 64GB', 799.90, 40, 2),
('Mouse Gamer', 'Mouse óptico 6400DPI RGB', 159.90, 80, 3),
('Teclado Mecânico', 'Teclado mecânico switches blue', 299.90, 50, 3),
('Bola Futebol', 'Bola oficial tamanho 5', 129.90, 70, 7),
('Raquete Tênis', 'Raquete profissional carbono', 459.90, 20, 7),
('Moletom Hood', 'Moletom com capuz algodão', 139.90, 90, 1),
('Calça Jeans', 'Calça jeans masculina slim', 159.90, 120, 1),
('Óculos Sol', 'Óculos de sol proteção UV', 199.90, 65, 8),
('Relógio Digital', 'Relógio smartwatch fitness', 349.90, 40, 8),
('Cafeteira', 'Máquina de café automática', 459.90, 25, 9),
('Liquidificador', 'Liquidificador 1000W 6 velocidades', 199.90, 35, 9),
('Panela Pressão', 'Panela de pressão 5L inox', 129.90, 50, 9),
('Bicicleta MTB', 'Bicicleta mountain bike 21 marchas', 1299.90, 15, 7),
('Skate Profissional', 'Skate completo shape maple', 299.90, 30, 7),
('Violão Acústico', 'Violão folk cordas aço', 499.90, 20, 10),
('Microfone USB', 'Microfone condensador para streaming', 299.90, 45, 11),
('Action Figure', 'Boneco colecionável 20cm', 89.90, 100, 12),
('Quebra-Cabeça', 'Quebra-cabeça 1000 peças', 59.90, 75, 13),
('Perfume Import', 'Perfume masculino 100ml', 299.90, 60, 14);

select * from produtos;
--------------------------------------------------------
--------------------------------------------------------
create table itens_pedido(
id int auto_increment primary key,
pedido_id int,
produto_id int,
quantidade int not null,
preco_unitario decimal(10,2) not null
);

alter table itens_pedido
add pedido_id int after id;

ALTER table itens_pedido
drop column pedido_id;

truncate table itens_pedido;
select *from itens_pedido;

INSERT INTO itens_pedido
(pedido_id, produto_id, quantidade, preco_unitario)
VALUES
(1, 7, 3, 12.97),
(2, 26, 1, 321.53),
(3, 18, 5, 186.05),
(4, 24, 5, 345.67),
(5, 15, 2, 477.32),
(6, 3, 2, 45.90),
(7, 12, 4, 29.99),
(8, 8, 1, 199.50),
(9, 21, 3, 78.25),
(10, 5, 2, 156.75),
(11, 30, 1, 425.80),
(12, 14, 5, 35.40),
(13, 9, 2, 89.90),
(14, 22, 3, 125.60),
(15, 11, 4, 42.30),
(16, 27, 1, 678.45),
(17, 6, 2, 234.99),
(18, 19, 3, 87.15),
(19, 25, 1, 512.75),
(20, 10, 4, 63.20),
(21, 28, 2, 189.30),
(22, 13, 3, 76.85),
(23, 29, 1, 345.90),
(24, 4, 5, 28.50),
(25, 20, 2, 156.40),
(26, 16, 3, 98.75),
(27, 23, 1, 432.60),
(28, 2, 4, 67.80),
(29, 17, 2, 178.95),
(30, 1, 3, 54.30);


select * from itens_pedido;
-------------------------------------------------------
-------------------------------------------------------
alter table cliente
change column telefone celular varchar(15);

rename table cliente to usuarios;

alter table usuarios
add column telefone varchar(12) after email;

alter table enderecos add column cep varchar(10) after estado;

use ecommerce;

create table pedidos(
id int auto_increment primary key, 
cliente_id int,
data_pedido datetime default current_timestamp,
status varchar(50) default 'Pendente', 
total decimal(10,2)  
);

alter table pedidos
drop column pedido_id;

alter table pedidos
change column sitacao status varchar(15) default 'Pendente';

alter table pedidos
add column cliente_id int after	id;

truncate table pedidos;

select * from pedidos;

INSERT INTO pedidos
(cliente_id, data_pedido, status, total)
VALUES
(1 , NOW(),'Cancelado', 905.56),
(2 , NOW(),'Cancelado', 598.73),
(3 , NOW(),'Pago',      886.63),
(4 , NOW(),'Enviado',  1035.27),
(5 , NOW(),'Pendente', 277.50),
(6 , NOW(),'Pago',     450.75),
(7 , NOW(),'Enviado',  899.99),
(8 , NOW(),'Entregue', 325.50),
(9 , NOW(),'Pendente', 178.30),
(10, NOW(),'Cancelado',620.45),
(11, NOW(),'Pago',    1125.80),
(12, NOW(),'Enviado',  755.25),
(13, NOW(),'Entregue', 289.90),
(14, NOW(),'Pendente', 425.60),
(15, NOW(),'Cancelado',950.15),
(16, NOW(),'Pago',     678.40),
(17, NOW(),'Enviado', 1342.75),
(18, NOW(),'Entregue', 523.10),
(19, NOW(),'Pendente', 198.85),
(20, NOW(),'Cancelado',785.20),
(21, NOW(),'Pago',    2345.90),
(22, NOW(),'Enviado',  876.35),
(23, NOW(),'Entregue', 412.65),
(24, NOW(),'Pendente', 567.80),
(25, NOW(),'Cancelado',1234.50),
(26, NOW(),'Pago',     987.25),
(27, NOW(),'Enviado',  654.70),
(28, NOW(),'Entregue', 321.95),
(29, NOW(),'Pendente', 876.40),
(30, NOW(),'Cancelado',543.20);


-----------------------------------------------------
-----------------------------------------------------
create index idx_enderecos_cliente_id ON enderecos (cliente_id);

create index idx_produtos_categoria_id ON produtos (categoria_id);

create index idx_pedidos_cliente_id ON pedidos (cliente_id);

create index idx_itens_pedido_pedido_id ON itens_pedido (pedido_id);

create index idx_itens_pedido_produto_id ON itens_pedido (produto_id);

alter table enderecos
add constraint fk_enderecos_cliente_id foreign key (cliente_id) references usuarios(id);

alter table produtos
add constraint fk_produtos_categoria_id foreign key (categoria_id) references categorias(id);

alter table pedidos
add constraint fk_pedidos_cliente_id foreign key (cliente_id) references usuarios (id);

alter table itens_pedido
add constraint fk_itens_pedido_pedido_id foreign key (pedido_id) references pedidos (id);

alter table itens_pedido
add constraint fk_itens_pedido_produto_id foreign key (produto_id) references produtos(id);
