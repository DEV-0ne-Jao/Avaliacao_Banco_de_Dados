drop database if exists lojatenis;
create database lojatenis;
use lojatenis;

create table Vendedor(
    idVendedor int not null auto_increment primary key,
    nome varchar(50),
    CPF varchar(11),
    EstadoCivil varchar(20),
    Sexo char(2),
    dataNasc date,
    telefone varchar(11),
    bairro varchar(45),
    idCidade int,
    constraint fk_cidade foreign key (idCidade)
references Cidade(idCidade)
);

create table Cliente(
    idCliente int not null auto_increment primary key,
    nome varchar(50),
    CPF varchar(11),
    EstadoCivil varchar(20),
    Sexo char(2),
    dataNasc date,
    telefone varchar(11),
    bairro varchar(45),
    idVendedor int not null,
    constraint fk_vendedor foreign key (idVendedor)
        references Vendedor(idVendedor),
	idCidade int,
    constraint fk_cidade foreign key (idCidade)
references Cidade(idCidade)
);

create table Produto(
idProduto int not null primary key auto_increment,
    idDeposito int not null,
    constraint fk_deposito foreign key (idDeposito)
references Deposito(idDeposito),
tamanho int,
cor varchar(30),
marca varchar(30),
genero varchar(30),
descricao varchar(45),
preco double
);

create table Cidade(
idCidade int not null primary key auto_increment,
nome varchar(45),
    UF char (2)
);

create table Pedido(
idPedido int not null primary key auto_increment,
    idCliente int not null,
    constraint fk_cliente foreign key (idCliente)
        references Cliente(idCliente),
    idVendedor int not null,
    constraint fk_vendedor foreign key (idVendedor)
references Vendedor(idVendedor),
    dataPedido date,
    valorTotal double
);

create table Deposito(
idDeposito int not null primary key auto_increment,
idCidade int not null,
    constraint fk_cidade foreign key (idCidade)
references Cidade(idCidade)
);

create table item(
idItem int not null primary key auto_increment,
    idProduto int not null,
    constraint fk_produto foreign key(idProduto)
references produto(idProduto),
    idPedido int,    
constraint fk_pedido foreign key (idPedido)
references Pedido(idPedido),
quant int,
    valorCotado int
);

CREATE TABLE estoque (
    idEstoque INT not null PRIMARY KEY AUTO_INCREMENT,
    idProduto int not null,
    constraint fk_produto foreign key (idProduto)
references Produto(idProduto),
    tipo CHAR(1),
    dataMov DATE,
    quant INT
);

insert into cidade (nome, UF) values
("Erechim", "RS"),
("Aratiba", "RS"),
("Maravilha", "SC"),
("Joaçaba" ,"SC"),
("Foz do Iguaçu", "PR");

insert into cliente (nome, CPF, EstadoCivil, Sexo, dataNasc, telefone, bairro, idCidade) values
("Nathan",   "03579206064", "Solteiro", "M", "2008-05-04", "54991439390", "Loteamento Motter",    2),
("Bernardo", "03512854079", "Solteiro", "M", "2008-05-26", "54991177079", "Aeroporto, Vitória I", 3),
("Riciery",  "02112345601", "Solteiro", "T", "2008-11-03", "54996284884", "Rua do hospital",      1),
("Tiago",    "06906906924", "Viúvo",    "M", "2009-03-09", "54996934556", "Centro",               5),
("Marilia",  "04655678031", "Casada",   "F", "2008-05-30", "54999947538", "Centro",               2),
("Leticia",  "04841702094", "Casada",   "F", "2008-05-15", "54992759508", "Esperança",            2),
("Eloisa",   "05808897026", "Casada",   "F", "2008-08-25", "54996013473", "Centro",               4);

insert into vendedor (nome, CPF, EstadoCivil, Sexo, dataNasc, telefone, bairro) values
("Nicolas",    "03579206065", "Solteiro", "M", "2008-07-04", "54991439380", "Centro"),
("Follador",   "03579267064", "Casado",   "M", "2008-09-07", "54991899390", "Atlantico"),
("Lucas Both", "03579203038", "Solteiro", "M", "2009-12-30", "54991789390", "Economico"),
("Amanda",     "09856341989", "Casado",   "F", "2001-03-13", "54991364321", "Centro");

INSERT INTO Deposito (idCidade) VALUES
(1),
(2),
(3);

INSERT INTO Produto (idDeposito, tamanho, cor, marca, genero, descricao, preco) VALUES
(1, 40, 'Preto',    'Nike',   'Masculino', 'Nike Air Zoom Pegasus', 599.90),
(1, 41, 'Branco',   'Nike',   'Masculino', 'Nike Air Force 1',      699.90),
(1, 38, 'Vermelho', 'Nike',   'Feminino',  'Nike Revolution 6',     319.90),
(1, 39, 'Azul',     'Nike',   'Unissex',   'Nike Court Vision',     449.00),
(2, 42, 'Preto',    'Adidas', 'Masculino', 'Adidas Ultraboost 22',  749.50),
(2, 40, 'Branco',   'Adidas', 'Feminino',  'Adidas Superstar',      399.00),
(2, 37, 'Rosa',     'Adidas', 'Feminino',  'Adidas Forum Bold',     549.90),
(2, 41, 'Cinza',    'Adidas', 'Masculino', 'Adidas Run Falcon',     299.90),
(3, 42, 'Azul',     'Puma',   'Masculino', 'Puma Running Pro',      429.00),
(3, 39, 'Preto',    'Puma',   'Unissex',   'Puma Smash V2',         279.90),
(3, 38, 'Verde',    'Puma',   'Masculino', 'Puma RS-X',             599.00);

INSERT INTO estoque (idProduto, tipo, dataMov, quant) VALUES
(1, "E", "2025-09-03", 10), 
(2, "E", "2025-08-12", 1), 
(1, "E", "2025-04-05", 2), 
(5, "E", "2025-10-12", 1), 
(7, "E", "2024-08-12", 7);

INSERT INTO Pedido (idCliente, idVendedor, dataPedido, valorTotal) VALUES
(1, 1, '2025-08-25', 599.90),
(2, 2, '2025-08-26', 749.50),
(3, 1, '2025-08-27', 319.90),
(1, 3, '2015-02-23', 122.30),
(2, 3, '2017-12-20', 513.20);

INSERT INTO item (idProduto, idPedido, quant, valorCotado) VALUES
(1, 1, 1, 599.90),
(5, 2, 1, 749.50),
(3, 3, 1, 319.90);


update estoque set quant="3" Where idEstoque = '3';
update estoque set quant="5", tipo="S"  Where idEstoque = '2';
update estoque set tipo="S", dataMov="2025-05-26"  Where idEstoque = '3';

update cliente set telefone="54991402700" where idCliente="2";
Update cliente set EstadoCivil="Casado", sexo="M" where idCliente="3";
update cliente set EstadoCivil="Solteira" where idCliente="7";

UPDATE cliente
SET idVendedor = CASE 
    WHEN idCliente = 1 THEN 1
    WHEN idCliente = 2 THEN 2
    WHEN idCliente = 3 THEN 3
    WHEN idCliente = 4 THEN 1
    WHEN idCliente = 5 THEN 2
    WHEN idCliente = 6 THEN 3
    WHEN idCliente = 7 THEN 1
END;


ALTER TABLE cliente 
CHANGE Sexo Sexo CHAR(1) AFTER dataNasc;

ALTER TABLE produto 
CHANGE tamanho tamanho int AFTER cor;

ALTER TABLE estoque 
CHANGE dataMov dataMov Date AFTER quant;

select * from estoque  order by  quant desc ;
select * from Vendedor order by  nome asc ;
select * from Cliente  order by  idCliente desc ;
select * from Produto  order by  preco asc ;
select * from cidade  order by  nome asc ;

select * from estoque where tipo ="E";

select nome from cliente where nome not Like "%a";
select descricao from produto where marca not Like "%a";
select * from produto where preco between 300 and 500;
select * from pedido where valorTotal between 300 and 600;
select * from produto where marca = "Nike" or marca = "Puma";
select * from cliente where EstadoCivil = "Casada";
select * from cidade where UF = "SC";
select * from cliente where bairro not like "%a%" ;
select * from produto where tamanho between 40 and 42;
select * from cidade where nome like "e%" ;

/*a partir daqui é o trabalho do terceiro trimestre*/

/*group by*/
select deposito.idDeposito, count(produto.idProduto) 'Quantidade de Produtos' 
from produto
inner join deposito on produto.idDeposito = deposito.idDeposito
group by deposito.idDeposito;

select cliente.idCliente, cliente.nome, sum(pedido.valorTotal) 'Valor Total dos Pedidos'
from pedido
inner join cliente on pedido.idCliente = cliente.idCliente
group by cliente.idCliente;

select vendedor.idVendedor, vendedor.nome, count(pedido.idPedido) 'Quantidade de Pedidos Realizados'
from pedido
inner join vendedor on pedido.idVendedor = vendedor.idVendedor
group by vendedor.idVendedor;

select estoque.tipo, count(estoque.tipo)'Quant. entrada/saída' from estoque
group by estoque.tipo;

select cidade.UF 'Estados', count(cidade.uf)'Cidades por estado' from cidade
group by cidade.uf;

/*João Paulo Filipini - Soli Deo Gloria*/
SELECT Sexo "Sexo", COUNT(Sexo) "Quantidade"
FROM vendedor
GROUP BY Sexo
ORDER BY COUNT(Sexo) ASC;

SELECT produto.marca "Marca", ROUND(AVG(produto.preco)*100)/100 "Preço médio arredondado"
FROM produto
GROUP BY produto.marca
ORDER BY COUNT(produto.preco) DESC;

/*inner join*/
select produto.idProduto, produto.descricao, estoque.quant 'Quantidade no Estoque'
from produto
inner join estoque on produto.idProduto = estoque.idProduto;

select cliente.nome  'Cliente', vendedor.nome 'Vendedor'
from cliente
inner join vendedor on cliente.idVendedor = vendedor.idVendedor;

select pedido.idPedido, produto.descricao  'Produto', item.quant 'Quantidade'
from pedido
inner join item on pedido.idPedido = item.idPedido
inner join produto on item.idProduto = produto.idProduto
order by idPedido asc;

select cliente.nome, cliente.cpf, pedido.idPedido, pedido.dataPedido from cliente
inner join pedido on pedido.idCliente = cliente.idCliente;

select vendedor.nome 'Nome', pedido.idPedido'Código do Pedido', pedido.dataPedido 'Data do Pedido', pedido.valorTotal 'Valor total'from vendedor
inner join pedido on pedido.idVendedor = vendedor.idVendedor;

/*João Paulo Filipini - Soli Deo Gloria*/
SELECT v.nome "Vendedor", SUM(p.valorTotal) "total vendido"
FROM vendedor v
INNER JOIN pedido p
ON p.idVendedor = v.idVendedor
GROUP BY v.nome;

SELECT * FROM pedido;

/*left*/
select cliente.nome 'Cliente', pedido.idPedido, pedido.dataPedido
from cliente
left join pedido on cliente.idCliente = pedido.idCliente;

select vendedor.nome'Vendedor', pedido.idPedido, pedido.valorTotal
from vendedor
left join pedido on vendedor.idVendedor = pedido.idVendedor;

select produto.descricao 'Produto', estoque.quant 'Quantidade no Estoque'
from produto
left join estoque on produto.idProduto = estoque.idProduto;

/*João Paulo Filipini - Soli Deo Gloria*/
SELECT cidade.nome "Nome da cidade", COUNT(cliente.idCidade) "Clientes nesta cidade"
FROM cidade
LEFT JOIN cliente
ON cidade.idCidade = cliente.idCidade
GROUP BY cliente.idCidade
ORDER BY COUNT(cliente.idCidade);








/*Criar as entidade e atributos do DER desenvolvido no Trabalho Avaliativo do 1º Trimestre com seus Inserts.

Criar 3 UPDATES em quaisquer das tabelas.
Criar 3 UPDATES com Where em quaisquer das tabelas.
Criar 3 ALTER TABLE em quaisquer das tabelas, podendo utilizar change ou modify.
Criar 10 SELECT com Where (LIKE, IN, BETWEEN ETC)
Criar 5 SELECT que contenham ORDER BY*

TRABALHO DO 3 TRIMESTRE
5 Group by (3 com função de agregação)
5 inner join 
3 left join

/