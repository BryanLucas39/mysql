CREATE DATABASE marmitexdb;
USE marmitexdb;

CREATE TABLE login(

id integer auto_increment primary key,
email varchar(255) not null,
senha varchar(255)  not null,
nivel_acesso integer not null
);

CREATE TABLE empresa(

id integer auto_increment primary key,
nome varchar(255) not null,
cnpj varchar(255) not null,
email varchar(255) not null,
telefone varchar(255) not null,
endereco varchar(255) not null
);

CREATE TABLE entregador(

id integer auto_increment primary key,
id_empresa integer,
nome varchar(255),
cpf varchar(255),
rg varchar(255),
celular varchar(255)
);

CREATE TABLE marmita(

id integer auto_increment primary key,
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
telefone varchar(255) not null,
nome varchar(255) not null,
endereco varchar(255) not null,
pontode_referencia varchar(255),
nascimento date
);


CREATE TABLE pedido(

id integer auto_increment primary key,
telefone_cliente varchar(255),
id_entregador integer,
status_pedido varchar(255),
taxa_entrega varchar(255) not null,
data_entrega DATETIME 
);


ALTER TABLE entregador
ADD CONSTRAINT fk_entregador_pk_empresa -- < funcionando
FOREIGN KEY entregador(id_empresa)
REFERENCES empresa(id);

ALTER TABLE item_pedido
add constraint fk_item_pedido_pk_marmita -- < funcionando
foreign key item_pedido(id_marmita)
REFERENCES marmita(id);

ALTER TABLE item_pedido
add constraint fk_item_pedido_pk_pedido
foreign key item_pedido(id_pedido)			-- < funcionando
REFERENCES pedido(id);

ALTER TABLE pedido
add constraint fk_pedido_pk_entregador           -- < ja foi executado funcionando
foreign key pedido(id_entregador)
REFERENCES entregador(id);

ALTER TABLE pedido 
add constraint fk_pedido_pk_cliente
foreign key pedido(telefone_cliente)			-- < nao funcionando
REFERENCES cliente(telefone);



