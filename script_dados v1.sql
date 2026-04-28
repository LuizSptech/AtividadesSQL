create database venda;
use venda;

create table cliente(
	idcliente int auto_increment,
	nome varchar(45),
	Email varchar(55),
	endereco varchar(45),
	fkindicacao int,
	primary key(idcliente),
	constraint fkindicacao foreign key (fkindicacao) 
    references cliente(idcliente)
 );

create table Produto(
	 idProduto int not null auto_increment,
	 Nome varchar(45),
	 descricao varchar(45),
	 Preco decimal(10,2),
     primary key(idProduto)
)auto_increment=100;
 
create table venda(
	idVenda int auto_increment,
	dtVenda datetime null default now(),
	Total   decimal(10,2),    
	fkcliente int,
    primary key(idVenda),
	constraint fkcliente foreign key (fkcliente) 
        references cliente(idcliente)
 )auto_increment=10;
  
CREATE TABLE Quantidade_Venda (
	fkVenda int ,
	fkProduto int,
	Qtd int,
	precoUnitario decimal(10,2),
	Desconto decimal(10,2),
	constraint pkComposta primary key (fkVenda, fkProduto),
	constraint fkVenda foreign key (fkVenda) 
          references venda(idVenda),
	constraint fkProduto foreign key (fkProduto) references Produto(idProduto)
);
 
insert into cliente (nome, Email, endereco, fkindicacao) 
values ('Marcos','marcos,atlas@sptech.school','Paulista',null),
       ('Rafael','rafa.el@sptech.school','Tatuape',1),
	   ('Sara','sara.silva@sptech.school','Carrão',2),
	   ('Andreia','andreia.santos@sptech.school','Dom Bosco',1);

select * from cliente;

insert into Produto (Nome, descricao, Preco)
values ('dogtown','rodas',129.90),
   	   ('Freedom','truck',219.90),
	   ('Element','shape',119.90);
 
select * from produto;

insert into venda (dtVenda, Total, fkcliente)
values (default, 2, 1), 
	(default, 1, 2),
	(default, 3, 3),
	(default, 1, 4);

select * from venda;

insert into Quantidade_Venda (fkVenda, fkProduto, Qtd, precoUnitario, Desconto)
values (10, 100, 10, 129.90, 0),
       (10, 101, 12, 219.90, 10),
       (11, 102, 14, 119.9, 15.5),
       (12, 101, 16, 219.90, 0),
       (12, 100, 18, 129.90, 10),
       (13, 100, 10, 129.90, 1),
       (13, 101, 12, 219.90, 5),
       (13, 102, 14, 119.9, 0); 