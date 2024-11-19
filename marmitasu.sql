create database marmitasdb;
 
use marmitasdb;
 
create table login(
id_login int auto_increment primary key,
email varchar(255) not null unique,
senha varchar(255) not null,
nivel_acesso int not null
);
 
create table cliente(
telefone varchar(255) not null unique,
nome varchar(255) not null,
endereco varchar(255) not null,
ponto_referencia varchar(255),
nascimento date
);
 
 
 
create table pedido(
id_pedido int auto_increment primary key,
telefone_cliente varchar(255) not null,
id_entregador int not null,
status varchar(255) not null,
taxa_entrega varchar(255),
data datetime
);
 
 
create table entregador(
id_entregador int auto_increment primary key,
id_empresa int not null,
nome varchar(255) not null,
cpf varchar(255) not null unique,
rg varchar(255) not null unique,
celular varchar(255) not null unique
);
 
create table empresa(
id_empresa int auto_increment primary key,
nome varchar(255) not null,
cnpj varchar(255) not null unique,
email varchar(255) not null unique,
telefone varchar(255),
endereco varchar(255) not null
);
 
create table item_pedido(
id_marmita int not null,
id_pedido int not null,
quantidade int not null
);
 
create table marmita(
id_marmita int auto_increment primary key,
nome varchar(255) not null,
descricao mediumtext,
tamanho varchar(255) not null,
valor varchar(255) not null
);


ALTER TABLE entregador
ADD CONSTRAINT fk_entregador_pk_empresa -- < funcionando
FOREIGN KEY entregador(id_empresa)
REFERENCES empresa(id_empresa);

ALTER TABLE item_pedido
add constraint fk_item_pedido_pk_marmita -- < funcionando
foreign key item_pedido(id_marmita)
REFERENCES marmita(id_marmita);

ALTER TABLE pedido
add constraint fk_pedido_pk_item_pedido
foreign key item_pedido(id_pedido)	-- < nao funcionando
REFERENCES pedido(id_pedido);

ALTER TABLE pedido
add constraint fk_pedido_pk_entregador           -- < ja foi executado funcionando
foreign key pedido(id_entregador)
REFERENCES entregador(id_entregador);

ALTER TABLE pedido 
add constraint fk_pedido_pk_cliente
foreign key pedido(telefone_cliente)			-- < funcionando
REFERENCES cliente(telefone);
-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

describe marmita;
insert into marmita(nome,descricao,tamanho,valor)
values("macarronada", 'macarrão com molho vermelho',"grande", "20R$");
select * from marmita;
 
 
describe empresa;
insert into empresa(nome,cnpj,email,telefone,endereco)
values("tempero bom", '243843ir',"temperobom@gmail.com", "(11)98581-4567", 'rua joão henrrique,76');
select * from empresa;
 
describe cliente;
insert into cliente(telefone,nome,endereco,ponto_referencia,nascimento)
values("(11)98264-9267", 'juliana baltar',"Rua Pedro Dias,2687", "perto da pizzaria", '2000-10-30');
select * from cliente;
 
describe entregador;
insert into entregador(id_empresa,nome,cpf,rg,celular)
values(1, 'pedro silva',"975.075.457-64", "45.789.943-6", '(11)98364-3738');
select * from entregador;
 
describe pedido;
insert into pedido(telefone_cliente,id_entregador,status,taxa_entrega,data)
values('(11)98264-9267',1,"preparando", "5R$", '2024-10-16');
select * from pedido;
 
describe item_pedido;
insert into item_pedido(id_marmita,id_pedido,quantidade)
values(1,2,300);
select * from item_pedido;
 
describe login;
insert into login(email,senha,nivel_acesso)
values('julianabalt@gmail.com', 'jujuca1', 30059);
select * from login
