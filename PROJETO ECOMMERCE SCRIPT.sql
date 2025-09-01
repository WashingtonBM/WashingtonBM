-- criação de banco de dados para o cenário de E-commerce
drop database ecommerce;
create database ecommerce;
use ecommerce;
-- criar tabela cliente
 create table client(
 idCLIENTE int auto_increment primary key,
 Pnome VARCHAR(10) not null,
NmeioInicial char(3),
Sobrenome varchar(20),
CPF char(11) not null,
constraint Unico_cpf_cliente unique (CPF)
);

alter table client auto_increment=1;

-- desc client;

-- criar tabela produto
create table produto(
idPRODUTO int auto_increment primary key,
CATEGORIA varchar(45) not null,
DESCRIÇÃO varchar(45) not null,
VALOR_PRODUTO varchar(45) not null
);
desc produto;

-- criar tabela pagamentos
create table pagamentO(
idCLIENTE int,
idPAGAMENTO int,
Tipo_de_pagamento enum("Boleto", "Pix", "Cartão"),
VALOR_PEDIDO float,
primary key (idCLIENTE, idPAGAMENTO)
);

desc pagamento;
-- criar tabela pedido
create table pedido(
idPEDIDO int auto_increment primary key,
idCLIENTE int,
STATUSD_DO_PEDIDO Enum("Andamento", "Processando", "Enviado", "Entregue", "Cancelado") default "Processando",
DESCRIÇÃO varchar(45),
FRETE  float default 10 not null
);

desc pedido;

-- criar tabela fornrcedor
create table Fornecedor (
idFORNECEDOR int auto_increment primary key not null,
Razão_Social varchar (255) not null unique,
CNPJ char (14) not null unique,
Nome_Fantasia varchar (45) not null,
Contato varchar (11) not null,
constraint Umico_Fornecedor unique (CNPJ)
);
desc fornecedor;
-- criar tabela vendedor CNPJ
create table VendedorCNPJ (
idVENDEDOR_CNPJ int auto_increment primary key not null,
Razão_Social varchar (255) not null unique,
CNPJ char (14) not null unique,
Nome_Fantasia varchar (45) not null,
Local_Endereço varchar (255),
Contato varchar (11) not null,
constraint Umico_VendedorCNPJ unique (CNPJ)
);

desc vendedorcnpj;
-- cria tabela Vendedor_CPF
create table VendedorCPF (
idVENDEDOR_CPF int auto_increment primary key not null,
CPF char (11) not null unique,
Local_Endereço varchar (255),
Contato varchar (11) not null,
constraint Umico_VendedorCPF unique (CPF)
);

desc vendedorcpf;
-- cria tabela Produto_PorVendedor
create table ProdutoPorVendedor (
idPRODUTO int,
idVENDEDOR_CNPJ int,
idVENDEDOR_CPF int,
QUANTIDADE int default 1,
primary key (idPRODUTO,idVENDEDOR_CNPJ,idVENDEDOR_CPF)
);

desc produtoporvendedor;

-- cria tabela Estoque_de_Produtos
create table Estoque_de_Produtos (
idESTOQUE int,
idPRODUTO int,
QUANTIDADE_EM_ESTOQUE int default 1,
STATUS_ESTOQUE enum ("Disponível", "Sem Estoque") default ("Disponível"),
primary key (idESTOQUE,idPRODUTO)
);

desc estoque_de_produtos;

-- cria tabela LocalEstoque
create table LocalEstoque (
idESTOQUE int,
idPRODUTO int,
Local_estoque varchar (255) not null,
primary key (idESTOQUE,idPRODUTO)
);

desc localestoque;

show tables;
show databases;
use information_schema;
show tables;
desc table_constraints;
desc referential_constraints;
select * from referential_constraints;

