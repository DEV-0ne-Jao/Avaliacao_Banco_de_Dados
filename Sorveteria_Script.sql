/*soli Deo Gloria*/

CREATE DATABASE Sorveteria;
USE Sorveteria;

CREATE TABLE Empregado(
idempregado  INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(45),
salario DOUBLE,
cargo VARCHAR(45),
turno VARCHAR(45),
telefone VARCHAR(20),
dataContratado DATE,
dataDemitido DATE,
idUnidadeFranquia INT NOT NULL, CONSTRAINT UnidadeDaFranquia_idUnidadeFranquia_FK FOREIGN KEY (idUnidadeFranquia) REFERENCES UnidadeFranquia(idUnidadeFranquia)
);

CREATE TABLE Cliente(
idCliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(45),
cpf VARCHAR(11)
);

CREATE TABLE Venda(
idVenda INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
valorTotal DOUBLE,
dataEntrega DATE,
idEmpregado INT, CONSTRAINT Empregado_idEmpregado_FK FOREIGN KEY (idEmpregado) REFERENCES Empregado(idEmpregado),
idCliente INT, CONSTRAINT Cliente_idCliente_FK FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE UnidadeDaFranquia(
idUnidadeFranquia INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
lucroTotal DOUBLE,
idLocalizacao INT, CONSTRAINT Localizacao_idLocalizacao_FK FOREIGN KEY (idLocalizacao) REFERENCES Localizacao(idLocalizacao)
);

CREATE TABLE Localizacao(
idLocalizacao INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
estado VARCHAR(45) NOT NULL,
cidade VARCHAR(45) NOT NULL,
bairro VARCHAR(45) NOT NULL,
endereco VARCHAR(45) NOT NULL
);

CREATE TABLE item(
idItem INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
idVenda INT, CONSTRAINT Venda_idVenda_FK FOREIGN KEY (idVenda) REFERENCES Venda(idVenda),
precoTotal INT,
quantidade INT,
idProduto INT, CONSTRAINT Produto_idProduto_FK FOREIGN KEY (idProduto) REFERENCES Produto(idProduto),
idSorvete INT, CONSTRAINT Sorvete_idSorvete_FK FOREIGN KEY (idSorvete) REFERENCES Sorvete(idSorvete)
);

CREATE TABLE ingrediente(
idIngrediente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
descricao VARCHAR(45),
unidadeDeMedida VARCHAR(45),
quantidadeDisponivel VARCHAR(45)
);

CREATE TABLE Receita(
idReceita INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
idIngrediente INT, CONSTRAINT Ingrediente_idIngrediente_FK FOREIGN KEY (idIngrediente) REFERENCES Ingrediente(idIngrediente),
quantidadeIngrediente INT,
idSorvete INT, CONSTRAINT Sorvete_idSorvete_FK FOREIGN KEY (idSorvete) REFERENCES Sorvete(idSorvete)
); /* É meio que uma associativa entre ingrediente e sorvete */

CREATE TABLE Sorvete (
idSorvete INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
descricao VARCHAR(45), /*sorvet ede baunilha*/
precoKilo DOUBLE
);

CREATE TABLE Produto(
idProduto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
descricao VARCHAR(45),
precoUnidade DOUBLE,
quantidadeDisponivel INT,
idEstoque
);


CREATE TABLE estoque(
INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
);
CREATE TABLE fornecedor(
INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
);