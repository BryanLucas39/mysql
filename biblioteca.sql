CREATE DATABASE biblioteca;

USE biblioteca;

CREATE TABLE publicacao(

id_livro int auto_increment primary key,
titulo varchar (50) not null,
autor varchar(150) not null,
data_publicacao date not null,
editora varchar(30) not null,
isbn varchar (15) not null unique,
genero varchar(25) not null,
tipo_publicacao enum ("livro","revista","jornal"),
palavra_chave varchar(200) not null,
quantidade int not null,
localizacao varchar(200) not  null
);

CREATE TABLE  aluno(

id_aluno int auto_increment primary key,
nome varchar(150) not null,
matricula varchar(10) not null unique,
email varchar(200) not null unique,
curso varchar(50) not null,
telefone varchar(25) not null
);

CREATE TABLE bibliotecario(

id_bibliotecario int auto_increment primary key,
email varchar(100) not null unique,
telefone varchar(25) not null
);

CREATE TABLE emprestimo(
id_emprestimo int auto_increment primary key,
data_emprestimo date default current_timestamp,
data_devolucao_prev date not null,
data_devolucao_real date not null,
id_bibliotecario int not null,
id_aluno int not null,
id_livro int not null
);


-- vamos alterar o nome da coluna
alter table emprestimo
change column id_livro id_publicacao int not null;

alter table publicacao
change column id_livro id_publicacao int not null;

describe emprestimo;

Alter table emprestimo
add constraint fk_emprestimo_pk_publicacao
foreign key emprestimo(id_publicacao)
references publicacao(id_publicacao);

alter table emprestimo
add constraint fk_emprestimo_pk_bibliotecario
foreign key emprestimo(id_bibliotecario)
references bibliotecario(id_bibliotecario);

alter table emprestimo
add constraint fk_emprestimo_pk_aluno
foreign key emprestimo(id_aluno)
references aluno(id_aluno)



