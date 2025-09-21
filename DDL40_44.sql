CREATE DATABASE DDL40_44;
USE DDL40_44;

CREATE TABLE Transportadoras (
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    nome VARCHAR(120) NOT NULL,
    cnpj CHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(120) NOT NULL
    );

CREATE TABLE Entregas (
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    pedido_id INT,
    data_prevista DATE NOT NULL,
    data_entrega DATE NOT NULL,
    status VARCHAR(20),
    FOREIGN KEY (pedido_id)
        REFERENCES Pedidos_Compras (id)
);
CREATE TABLE Produtos (
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    nome VARCHAR(120) NOT NULL,
    preco DECIMAL(10 , 2 ) NOT NULL,
    categoria VARCHAR(60) NOT NULL,
    estoque INT NOT NULL
); 
CREATE TABLE Estoque (
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    produto_id INT,
    quantidade INT NOT NULL,
    localizacao VARCHAR(60) NOT NULL,
    minimo INT NOT NULL,
    FOREIGN KEY (produto_id) REFERENCES  Produtos (id)
    );
    
CREATE TABLE Fornecedores (
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    razao_social VARCHAR(150) NOT NULL,
    cnpj CHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(120) UNIQUE NOT NULL
);

CREATE TABLE Pedidos_Compra (
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    fornecedor_id INT,
    data_emissao DATE NOT NULL,
    valor_total DECIMAL(12 , 2 ) NOT NULL,
    status VARCHAR(20),
    FOREIGN KEY (fornecedor_id)
        REFERENCES Fornecedores (id)
);

CREATE TABLE Itens_Pedido (
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    pedido_id INT,
    produto_id INT,
    quantidade INT NOT NULL,
    preco_unit DECIMAL(10 , 2 ) NOT NULL,
    FOREIGN KEY (pedido_id)
        REFERENCES Pedidos_Compras (id),
    FOREIGN KEY (produto_id)
        REFERENCES Produtos (id)
)