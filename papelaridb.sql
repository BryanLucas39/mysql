create database papelaria;
use papelaria;
create table produtos (
id_produto INT AUTO_INCREMENT PRIMARY KEY,  
nome VARCHAR(100),  
descricao TEXT,  
preco DECIMAL(10,2),  
quantidade INT,  
categoria VARCHAR(50));
 
CREATE TABLE clientes ( 
id_cliente INT AUTO_INCREMENT PRIMARY KEY,  
nome VARCHAR(100),
cpf VARCHAR(11) not null UNIQUE,
endereco TEXT,
telefone VARCHAR(20));
 
CREATE TABLE pedidos ( 
id_pedido INT AUTO_INCREMENT PRIMARY KEY,
data_pedido DATE, 
id_cliente INT);
 
CREATE TABLE itens_pedido (
id_item INT AUTO_INCREMENT PRIMARY KEY,
id_pedido INT,
id_produto INT,
quantidade INT);
 
 
/*
 
 
*/
 
alter table pedidos 
add constraint fk_pedidos_pk_cliente
foreign key pedidos(id_cliente)
references clientes(id_cliente);
 
alter table itens_pedido 
add constraint fk_itens_pedido_pk_pedidos
foreign key itens_pedido (id_pedido)
references pedidos(id_pedido);
 
alter table itens_pedido 
add constraint fk_itens_pedido_pk_produtos
foreign key itens_pedido (id_produto)
references produtos(id_produto);
 
 
insert into produtos(nome,descricao,preco,quantidade,categoria)
values("caderno",'caderno 400pg',25.39,30,'escolar');
select * from produtos;
 
insert into produtos(nome,descricao,preco,quantidade,categoria)
values("mouse",'mouse sem fio',25.39,46,'computador');
select * from produtos;
 
 
insert into clientes(nome,cpf,endereco,telefone)
values("avulso",'111.111.111-22',"Rua Nova","(11) 99999-9999");
select * from clientes;
 
insert into clientes(nome,cpf,endereco,telefone)
values("vanessa olivera",'111.654.345-22',"Rua angelica","(11) 87765-9999");
select * from clientes;
 