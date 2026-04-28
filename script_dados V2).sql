drop database if exists venda;

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

create table produto(
	 idProduto int not null auto_increment,
	 Nome varchar(45),
	 descricao varchar(45),
     categoria  varchar(20),
	 Preco decimal(10,2),
     primary key(idProduto)
)auto_increment=100;
 
create table venda(
	idVenda int auto_increment,
	dtVenda datetime null default now(),
	fkcliente int,    
	Total   decimal(10,2),    
    primary key(idVenda),
	constraint fkcliente foreign key (fkcliente) 
        references cliente(idcliente)
 )auto_increment=10;
  
CREATE TABLE quantidade_venda (
	fkVenda int ,
	fkProduto int,
	Qtd decimal(15,3),
	precoUnitario decimal(15,2),
	Desconto decimal(15,2),
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

insert into Produto (Nome, descricao, categoria, Preco)
values ('dogtown','rodas', 'Categoria-1', 129.90),
   	   ('Freedom','truck', 'Categoria-2',219.90),
	   ('Element','shape', 'Categoria-3',119.90);
 
select * from produto;

insert into venda (idVenda, dtVenda, Total, fkcliente)
values (10, '2026-04-27 16:19:48', 1, 2.00),
		(11, '2026-04-27 16:19:48', 2, 1.00),
		(12, '2026-04-27 16:19:48', 3, 3.00),
		(13, '2026-04-27 16:19:48', 4, 1.00),
		(14, '2026-03-01 00:00:00', 1, 2.00),
		(15, '2026-03-01 00:00:00', 2, 1.00),
		(16, '2026-03-01 00:00:00', 3, 3.00),
		(17, '2026-03-01 00:00:00', 4, 1.00),
		(18, '2026-02-01 00:00:00', 1, 2.00),
		(19, '2026-02-01 00:00:00', 2, 1.00),
		(20, '2026-02-01 00:00:00', 3, 3.00),
		(21, '2026-02-01 00:00:00', 4, 1.00),
		(25, '2026-04-27 16:19:48', 2, 1.00),
		(26, '2026-04-27 16:19:48', 1, 2.00),
		(27, '2026-04-27 16:19:48', 3, 3.00),
		(28, '2026-04-27 16:19:48', 1, 4.00),
		(29, '2026-03-01 00:00:00', 2, 1.00),
		(30, '2026-03-01 00:00:00', 1, 2.00),
		(31, '2026-03-01 00:00:00', 3, 3.00),
		(32, '2026-03-01 00:00:00', 1, 4.00),
		(33, '2026-02-01 00:00:00', 2, 1.00),
		(34, '2026-02-01 00:00:00', 1, 2.00),
		(35, '2026-02-01 00:00:00', 3, 3.00),
		(36, '2026-02-01 00:00:00', 1, 4.00);
    
insert into quantidade_venda (fkVenda, fkProduto, Qtd, precoUnitario, Desconto)
values (10, 100, 10.000, 129.90, 0.00),
		(10, 101, 12.000, 219.90, 10.00),
		(11, 102, 14.000, 119.90, 15.50),
		(12, 100, 18.000, 129.90, 10.00),
		(12, 101, 16.000, 219.90, 0.00),
		(13, 100, 10.000, 129.90, 1.00),
		(13, 101, 12.000, 219.90, 5.00),
		(13, 102, 14.000, 119.90, 0.00),
		(14, 100, 10.000, 129.90, 0.00),
		(14, 101, 12.000, 219.90, 10.00),
		(15, 102, 14.000, 119.90, 15.50),
		(16, 100, 18.000, 129.90, 10.00),
		(16, 101, 16.000, 219.90, 0.00),
		(17, 100, 10.000, 129.90, 1.00),
		(17, 101, 12.000, 219.90, 5.00),
		(17, 102, 14.000, 119.90, 0.00),
		(18, 100, 10.000, 129.90, 0.00),
		(18, 101, 12.000, 219.90, 10.00),
		(19, 102, 14.000, 119.90, 15.50),
		(20, 100, 18.000, 129.90, 10.00),
		(20, 101, 16.000, 219.90, 0.00),
		(21, 100, 10.000, 129.90, 1.00),
		(21, 101, 12.000, 219.90, 5.00),
		(21, 102, 14.000, 119.90, 0.00),
		(25, 100, 10.000, 129.90, 0.00),
		(25, 101, 12.000, 219.90, 10.00),
		(26, 102, 14.000, 119.90, 15.50),
		(27, 100, 18.000, 129.90, 10.00),
		(27, 101, 16.000, 219.90, 0.00),
		(28, 100, 10.000, 129.90, 1.00),
		(28, 101, 12.000, 219.90, 5.00),
		(28, 102, 14.000, 119.90, 0.00),
		(29, 100, 10.000, 129.90, 0.00),
		(29, 101, 12.000, 219.90, 10.00),
		(30, 102, 14.000, 119.90, 15.50),
		(31, 100, 18.000, 129.90, 10.00),
		(31, 101, 16.000, 219.90, 0.00),
		(32, 100, 10.000, 129.90, 1.00),
		(32, 101, 12.000, 219.90, 5.00),
		(32, 102, 14.000, 119.90, 0.00),
		(33, 100, 10.000, 129.90, 0.00),
		(33, 101, 12.000, 219.90, 10.00),
		(34, 102, 14.000, 119.90, 15.50),
		(35, 100, 18.000, 129.90, 10.00),
		(35, 101, 16.000, 219.90, 0.00),
		(36, 100, 10.000, 129.90, 1.00),
		(36, 101, 12.000, 219.90, 5.00),
		(36, 102, 14.000, 119.90, 0.00);

