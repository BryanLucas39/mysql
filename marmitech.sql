CREATE DATABASE marmitechdb;
USE marmitechdb;

CREATE TABLE login(

id_login integer auto_increment primary key,
email varchar(255) not null,
senha varchar(255)  not null,
nivel_acesso integer not null
);

CREATE TABLE empresa(

id_empresa integer auto_increment primary key,
nome varchar(255) not null,
cnpj varchar(255) not null,
email varchar(255) not null,
telefone varchar(255) not null,
endereco varchar(255) not null
);

CREATE TABLE entregador(

id_entregador integer auto_increment primary key,
id_empresa integer,
nome varchar(255),
cpf varchar(255),
rg varchar(255),
celular varchar(255)
);

CREATE TABLE marmita(

id_marmita integer auto_increment primary key,
nome varchar(255) not null,
descricao mediumtext not null,
tamanho varchar(255) not null,
valor varchar(255) not null
);

CREATE TABLE item_pedido(

id_marmita integer,
id_pedido integer,
quantidade integer
);

CREATE TABLE cliente(
telefone varchar(255) primary key, 
nome varchar(255) not null,
endereco varchar(255) not null,
pontode_referencia varchar(255),
nascimento date
);


CREATE TABLE pedido(

id_pedido integer auto_increment primary key,
telefone_cliente varchar(255),
id_entregador integer,
status_pedido varchar(255),
taxa_entrega varchar(255) not null,
data_entrega DATETIME 
);


ALTER TABLE entregador
ADD CONSTRAINT fk_entregador_pk_empresa -- < funcionando
FOREIGN KEY entregador(id_empresa)
REFERENCES empresa(id_empresa);

ALTER TABLE item_pedido
add constraint fk_item_pedido_pk_marmita -- < funcionando
foreign key item_pedido(id_marmita)
REFERENCES marmita(id_marmita);

ALTER TABLE item_pedido
add constraint fk_item_pedido_pk_pedido -- funcionando
foreign key item_pedido(id_pedido)
REFERENCES pedido(id_pedido);

ALTER TABLE pedido
add constraint fk_pedido_pk_entregador           -- < ja foi executado funcionando
foreign key pedido(id_entregador)
REFERENCES entregador(id_entregador);

ALTER TABLE pedido
add constraint fk_cliente_pk_pedido
foreign key pedido(telefone_cliente)
REFERENCES cliente(telefone);		--  funcionando
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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

SELECT * FROM 