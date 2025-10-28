CREATE DATABASE Exemple;
USE Exemple;

-- Tabela TipoEnd
CREATE TABLE TipoEnd (
  Cod_TipoEnd INT NOT NULL AUTO_INCREMENT,
  Nome_TipoEnd VARCHAR(30) NOT NULL,
  PRIMARY KEY (Cod_TipoEnd),
  UNIQUE (Nome_TipoEnd)
) ENGINE=InnoDB;

-- Tabela Estado
CREATE TABLE Estado (
  Sigla_Est CHAR(2) NOT NULL,
  Nome_Est VARCHAR(100) NOT NULL,
  PRIMARY KEY (Sigla_Est),
  UNIQUE (Nome_Est)
) ENGINE=InnoDB;

-- Tabela Cidade
CREATE TABLE Cidade (
  Cod_Cid INT NOT NULL AUTO_INCREMENT,
  Sigla_Est CHAR(2) NOT NULL,
  Nome_Cid VARCHAR(100) NOT NULL,
  PRIMARY KEY (Cod_Cid),
  CONSTRAINT FK_Cid FOREIGN KEY (Sigla_Est) REFERENCES Estado(Sigla_Est),
  UNIQUE (Sigla_Est, Nome_Cid)
) ENGINE=InnoDB;

-- Tabela TipoCli
CREATE TABLE TipoCli (
  Cod_TipoCli INT NOT NULL AUTO_INCREMENT,
  Nome_TipoCli VARCHAR(100) NOT NULL,
  PRIMARY KEY (Cod_TipoCli),
  UNIQUE (Nome_TipoCli)
) ENGINE=InnoDB;

-- Tabela Cliente
CREATE TABLE Cliente (
  Cod_Cli INT NOT NULL AUTO_INCREMENT,
  Cod_TipoCli INT NOT NULL,
  Nome_Cli VARCHAR(100) NOT NULL,
  Data_CadCli DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  Renda_Cli DECIMAL(10,2) NOT NULL DEFAULT 0,
  Sexo_Cli CHAR(1) NOT NULL DEFAULT 'F',
  PRIMARY KEY (Cod_Cli),
  CONSTRAINT FK_Cli FOREIGN KEY (Cod_TipoCli) REFERENCES TipoCli(Cod_TipoCli),
  CHECK (Renda_Cli >= 0),
  CHECK (Sexo_Cli IN ('F','M'))
) ENGINE=InnoDB;

-- Tabela Conjuge
CREATE TABLE Conjuge (
  Cod_Cli INT NOT NULL,
  Nome_Conj VARCHAR(30) NOT NULL,
  Renda_Conj DECIMAL(10,2) NOT NULL DEFAULT 0,
  Sexo_Conj CHAR(1) NOT NULL DEFAULT 'M',
  PRIMARY KEY (Cod_Cli),
  CONSTRAINT FK_Conj FOREIGN KEY (Cod_Cli) REFERENCES Cliente(Cod_Cli),
  CHECK (Renda_Conj >= 0),
  CHECK (Sexo_Conj IN ('F','M'))
) ENGINE=InnoDB;

-- Tabela Endereco
CREATE TABLE Endereco (
  Cod_End INT NOT NULL AUTO_INCREMENT,
  Cod_TipoEnd INT NOT NULL,
  Cod_Cid INT NOT NULL,
  Cod_Cli INT NOT NULL,
  Nome_Rua VARCHAR(100) NOT NULL,
  Nome_Bairro VARCHAR(100) NOT NULL,
  Compl_End VARCHAR(100),
  PRIMARY KEY (Cod_End),
  FOREIGN KEY (Cod_TipoEnd) REFERENCES TipoEnd(Cod_TipoEnd),
  FOREIGN KEY (Cod_Cid) REFERENCES Cidade(Cod_Cid),
  FOREIGN KEY (Cod_Cli) REFERENCES Cliente(Cod_Cli)
) ENGINE=InnoDB;

-- Tabela Credito
CREATE TABLE Credito (
  Num_Lanc INT NOT NULL AUTO_INCREMENT,
  Cod_Cli INT NOT NULL,
  Cred_Cli DECIMAL(10,2) NOT NULL,
  Data_CredCli DATETIME NOT NULL,
  PRIMARY KEY (Num_Lanc),
  FOREIGN KEY (Cod_Cli) REFERENCES Cliente(Cod_Cli),
  CHECK (Cred_Cli > 0)
) ENGINE=InnoDB;

-- Tabela Fone
CREATE TABLE Fone (
  Num_Lanc INT NOT NULL AUTO_INCREMENT,
  Cod_Cli INT NOT NULL,
  Num_Fone CHAR(10) NOT NULL,
  Num_DDD CHAR(3) NOT NULL DEFAULT '011',
  PRIMARY KEY (Num_Lanc),
  FOREIGN KEY (Cod_Cli) REFERENCES Cliente(Cod_Cli)
) ENGINE=InnoDB;

-- Tabela Email
CREATE TABLE Email (
  Num_Lanc INT NOT NULL AUTO_INCREMENT,
  Cod_Cli INT NOT NULL,
  EMail_Cli VARCHAR(255) NOT NULL,
  PRIMARY KEY (Num_Lanc),
  FOREIGN KEY (Cod_Cli) REFERENCES Cliente(Cod_Cli)
) ENGINE=InnoDB;

-- Tabela StatusPedido
CREATE TABLE StatusPedido (
  Cod_Sta SMALLINT NOT NULL AUTO_INCREMENT,
  Sta_Ped VARCHAR(100) NOT NULL,
  PRIMARY KEY (Cod_Sta),
  UNIQUE (Sta_Ped)
) ENGINE=InnoDB;

-- Tabela Funcionario
CREATE TABLE Funcionario (
  Cod_Func INT NOT NULL AUTO_INCREMENT,
  Nome_Func VARCHAR(100) NOT NULL,
  Data_CadFunc DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  Sexo_Func CHAR(1) NOT NULL DEFAULT 'F',
  Sal_Func DECIMAL(10,2) NOT NULL DEFAULT 200,
  End_Func VARCHAR(100) NOT NULL,
  PRIMARY KEY (Cod_Func),
  CHECK (Sal_Func >= 0),
  CHECK (Sexo_Func IN ('F','M'))
) ENGINE=InnoDB;

-- Tabela Bonus
CREATE TABLE Bonus (
  Num_Lanc INT NOT NULL AUTO_INCREMENT,
  Cod_Func INT NOT NULL,
  Data_Bonus DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  Val_Bonus DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (Num_Lanc),
  FOREIGN KEY (Cod_Func) REFERENCES Funcionario(Cod_Func),
  CHECK (Val_Bonus > 0)
) ENGINE=InnoDB;

-- Tabela Pontuacao
CREATE TABLE Pontuacao (
  Num_Lanc INT NOT NULL AUTO_INCREMENT,
  Cod_Func INT NOT NULL,
  Data_Pto DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  Pto_Func DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (Num_Lanc),
  FOREIGN KEY (Cod_Func) REFERENCES Funcionario(Cod_Func),
  CHECK (Pto_Func > 0)
) ENGINE=InnoDB;

-- Tabela Historico
CREATE TABLE Historico (
  Num_Lanc INT NOT NULL AUTO_INCREMENT,
  Cod_Func INT NOT NULL,
  Data_Hist DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  Sal_Ant DECIMAL(10,2) NOT NULL,
  Sal_Atual DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (Num_Lanc),
  FOREIGN KEY (Cod_Func) REFERENCES Funcionario(Cod_Func),
  CHECK (Sal_Ant >= 0),
  CHECK (Sal_Atual >= 0)
) ENGINE=InnoDB;

-- Tabela Dependente
CREATE TABLE Dependente (
  Cod_Dep INT NOT NULL AUTO_INCREMENT,
  Cod_Func INT NOT NULL,
  Nome_Dep VARCHAR(100) NOT NULL,
  Data_NascDep DATETIME NOT NULL,
  Sexo_Dep CHAR(1) NOT NULL DEFAULT 'F',
  PRIMARY KEY (Cod_Dep),
  FOREIGN KEY (Cod_Func) REFERENCES Funcionario(Cod_Func),
  CHECK (Sexo_Dep IN ('F','M'))
) ENGINE=InnoDB;

-- Tabela Pedido
CREATE TABLE Pedido (
  Num_Ped INT NOT NULL AUTO_INCREMENT,
  Cod_Cli INT NOT NULL,
  Cod_Func INT NOT NULL,
  Cod_Sta SMALLINT NOT NULL,
  Data_Ped DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  Val_Ped DECIMAL(10,2) NOT NULL DEFAULT 0 CHECK (Val_Ped >= 0),
  PRIMARY KEY (Num_Ped),
  
  CONSTRAINT FK_Pedido_Cliente
    FOREIGN KEY (Cod_Cli) REFERENCES Cliente(Cod_Cli)
    ON DELETE RESTRICT ON UPDATE CASCADE,
    
  CONSTRAINT FK_Pedido_Funcionario
    FOREIGN KEY (Cod_Func) REFERENCES Funcionario(Cod_Func)
    ON DELETE RESTRICT ON UPDATE CASCADE,
    
  CONSTRAINT FK_Pedido_Status
    FOREIGN KEY (Cod_Sta) REFERENCES StatusPedido(Cod_Sta)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

-- Tabela Parcela
CREATE TABLE Parcela (
  Num_Par SMALLINT NOT NULL,
  Num_Ped INT NOT NULL,
  Data_Venc DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  Val_Venc DECIMAL(10,2) NOT NULL,
  Data_Pgto DATETIME NULL,
  Val_Pgto DECIMAL(10,2) GENERATED ALWAYS AS (
    CASE
      WHEN Data_Pgto < Data_Venc THEN Val_Venc * 0.9
      WHEN Data_Pgto = Data_Venc THEN Val_Venc
      WHEN Data_Pgto > Data_Venc THEN Val_Venc * 1.1
    END
  ) STORED,
  PRIMARY KEY (Num_Par, Num_Ped),
  FOREIGN KEY (Num_Ped) REFERENCES Pedido(Num_Ped),
  CHECK (Val_Venc >= 0)
) ENGINE=InnoDB;

-- Tabela TipoProd
CREATE TABLE TipoProd (
  Cod_TipoProd INT NOT NULL AUTO_INCREMENT,
  Nome_TipoProd VARCHAR(100) NOT NULL,
  PRIMARY KEY (Cod_TipoProd),
  UNIQUE (Nome_TipoProd)
) ENGINE=InnoDB;

-- Tabela Produto
CREATE TABLE Produto (
  Cod_Prod INT NOT NULL AUTO_INCREMENT,
  Cod_TipoProd INT NOT NULL,
  Nome_Prod VARCHAR(100) NOT NULL,
  Qtd_EstqProd INT NOT NULL DEFAULT 0,
  Val_UnitProd DECIMAL(10,2) NOT NULL,
  Val_Total DECIMAL(10,2) GENERATED ALWAYS AS (Qtd_EstqProd * Val_UnitProd) STORED,
  PRIMARY KEY (Cod_Prod),
  FOREIGN KEY (Cod_TipoProd) REFERENCES TipoProd(Cod_TipoProd),
  UNIQUE (Nome_Prod),
  CHECK (Qtd_EstqProd >= 0),
  CHECK (Val_UnitProd > 0)
) ENGINE=InnoDB;

-- Tabela Itens
CREATE TABLE Itens (
  Num_Ped INT NOT NULL,
  Cod_Prod INT NOT NULL,
  Qtd_Vend INT NOT NULL,
  Val_Vend DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (Num_Ped, Cod_Prod),
  FOREIGN KEY (Num_Ped) REFERENCES Pedido(Num_Ped),
  FOREIGN KEY (Cod_Prod) REFERENCES Produto(Cod_Prod),
  CHECK (Qtd_Vend > 0),
  CHECK (Val_Vend > 0)
) ENGINE=InnoDB;
