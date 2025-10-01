-- CREATE DATABASE sisGestao_Farmacia;
-- use sisGestao_farmacia;

CREATE TABLE medicamentos(
	med_id int auto_increment primary key,
    nome varchar(255) not null,
    principio_atv varchar(255) not null,
    tipo varchar(50) not null,
    validade date not null,
    preco decimal(5,2) not null
);

CREATE TABLE fornecedores(
	cnpj int(14) not null primary key,
    razao_social varchar(50) not null,
    contato varchar(14) not null
);


-- drop table fornecedores;

CREATE TABLE estoque(
	estoque_id int not null primary key,
    med_id int not null,
    foreign key (med_id) references medicamentos(med_id),
    quantidade int(100) not null,
    lote varchar(255) not null,
    validade_lt date not null,
    data_ent date not null
);

CREATE TABLE clientes(
	cpf varchar(14) not null primary key,
    nome varchar(100) not null,
    telefone varchar(14) not null unique
);

CREATE TABLE receitas_medicas(
	receitasMed_id int not null primary key,
    cpf varchar(14) not null,
    foreign key(cpf) references clientes(cpf),
    -- CRM_medico int not null,
    -- foreing key(CRM_medico) references medicos(CRM_medico),
    med_id int auto_increment,
    foreign key (med_id) references medicamentos(med_id),
    validade_receita date not null,
    data_emissao date not null
);

CREATE TABLE vendas (
	vendas_id int not null auto_increment primary key,
	cpf varchar(14) not null,
    foreign key(cpf) references clientes(cpf),
    -- matri_funci int not null,
    -- foreing key(matri_funci) references funcionarios(matri_funci),
    data_venda date not null,
    valor_total decimal (10,2) not null
);

CREATE TABLE itensVendas(
	iVendas_id int not null auto_increment primary key,
    vendas_id int not null,
    foreign key(vendas_id) references vendas(vendas_id),
	med_id int not null,
    foreign key (med_id) references medicamentos(med_id),
    quantidade int(100) not null,
    valor_unitario decimal(10,2) not null 
);

CREATE TABLE pagamentos(
	pagamentos_id int not null auto_increment primary key,
    vendas_id int not null,
    foreign key(vendas_id) references vendas(vendas_id),
	med_id int not null,
    foreign key (med_id) references medicamentos(med_id),
    quantidade int(100) not null,
    forma varchar(50) not null,
    status varchar(50) default 'cancelado'
);

CREATE TABLE funcionarios(
	matri_funci int not null auto_increment primary key,
    nome varchar(100) not null,
    cargo varchar(50) not null,
    turno varchar(30) not null
);

CREATE TABLE medicos(
	CRM_medico int auto_increment primary key,
    nome varchar(100) not null,
    cargo varchar(50) not null,
    especialidade varchar(50) not null,
    contato varchar(20) not null unique
);
