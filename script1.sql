CREATE DATABASE ExempleGO;

USE  ExempleGO;

/* **************************************************************************/
/* Criando as tabelas do database                                */
/* **************************************************************************/
CREATE TABLE TipoEnd
(
  Cod_TipoEnd   int  not null,
  Nome_TipoEnd  varchar(30)     not null,
  Constraint PK_TipoEnd Primary Key(Cod_TipoEnd),
  Constraint UQ_TipoEnd Unique(Nome_TipoEnd)
);

CREATE TABLE Estado
(
  Sigla_Est  char(02)     not null,
  Nome_Est   varchar(100) not null,
  
  Constraint PK_Est Primary Key(Sigla_Est),
  Constraint UQ_Est Unique(Nome_Est)
);

CREATE TABLE Cidade
(
  Cod_Cid    int  Not Null,
  Sigla_Est  char(02)     Not Null,
  Nome_Cid   varchar(100) Not Null,
 
  Constraint PK_Cid Primary Key(Cod_Cid),
  Constraint FK_Cid Foreign Key(Sigla_Est) References Estado(Sigla_Est),
  Constraint UQ_Cid Unique(Sigla_Est,Nome_Cid)
);

CREATE TABLE TipoCli
(
  Cod_TipoCli  int  not null,
  Nome_TipoCli varchar(100) not null,
 
  Constraint PK_TipoCli Primary key(Cod_TipoCli),
  Constraint UQ_TipoCli Unique(Nome_TipoCli)
);

CREATE TABLE Cliente
(
  Cod_Cli         int   not null,
  Cod_TipoCli int                     not null,
  Nome_Cli      varchar(100)   not null,
  Data_CadCli datetime not null Default NOW(),
  Renda_Cli     decimal(10,2) not null Default 0,
  Sexo_Cli       char(01)           not null Default 'F',

  Constraint PK_Cli  Primary Key(Cod_Cli),
  Constraint FK_Cli  Foreign Key(Cod_TipoCli)References TipoCli(Cod_TipoCli),
  Constraint CH_Cli1  Check(Renda_Cli >=0),
  Constraint CH_Cli2  Check(Sexo_Cli IN('F','M'))
);

CREATE TABLE Conjuge (
    Cod_Cli INT NOT NULL,
    Nome_Conj CHAR(30) NOT NULL,
    Renda_Conj DECIMAL(10 , 2 ) NOT NULL DEFAULT 0,
    Sexo_Conj CHAR(01) NOT NULL DEFAULT 'M',
    CONSTRAINT PK_Conj PRIMARY KEY (Cod_Cli),
    CONSTRAINT FK_Conj FOREIGN KEY (Cod_Cli)
        REFERENCES Cliente (Cod_Cli),
    CONSTRAINT CH_Conj1 CHECK (Renda_Conj >= 0),
    CONSTRAINT CH_Conj2 CHECK (Sexo_Conj IN ('F' , 'M'))
);

CREATE TABLE Endereco
(
  Cod_End          int    not null,
  Cod_TipoEnd  int                 not null,
  Cod_Cid          int                  not null,
  Cod_Cli           int                   not null,
  Nome_Rua     varchar(100)  not null,
  Nome_Bairro  varchar(100)  not null,
  Compl_End    varchar(100)        null,

  Constraint PK_End Primary Key(Cod_End),
  Constraint FK_End1 Foreign Key(Cod_TipoEnd) References TipoEnd(Cod_TipoEnd),
  Constraint FK_End2 Foreign Key(Cod_Cid) References Cidade(Cod_Cid),
  Constraint FK_End3 Foreign Key(Cod_Cli) References Cliente(Cod_Cli)
);
CREATE TABLE Credito
(
  Num_Lanc     int       not null,
  Cod_Cli         int                     not null,
  Cred_Cli        decimal(10,2) not null,
  Data_CredCli datetime not null,
  Constraint PK_Cred Primary Key(Num_Lanc),
  Constraint FK_Cred Foreign Key(Cod_Cli) References Cliente(Cod_Cli),
  Constraint CH_Cred Check(Cred_Cli > 0)
);
CREATE TABLE Fone
(
  Num_Lanc int   not null, 
  Cod_Cli  int                    not null,
  Num_Fone char(10)      not null,
  Num_DDD  char(05)     not null Default '011',
  Constraint PK_Fone Primary Key(Num_Lanc),
  Constraint FK_Fone Foreign Key(Cod_Cli) References Cliente(Cod_Cli)
);
CREATE TABLE EMail
(
  Num_Lanc  int   not null, 
  Cod_Cli      int                  not null,
  EMail_Cli    varchar(255) not null,
  Constraint PK_Email Primary Key(Num_Lanc),
  Constraint FK_Emails Foreign Key(Cod_Cli) References Cliente(Cod_Cli)
);
CREATE TABLE StatusPedido
(
  Cod_Sta    smallint  not null,
  Sta_Ped    varchar(100)       not null,
  Constraint PK_StatusPed Primary Key(Cod_Sta),
  Constraint UQ_StatusPed Unique(Sta_Ped)
);
CREATE TABLE Funcionario
(
  Cod_Func        int  not null,
  Nome_Func     varchar(100)  not null,
  Data_CadFunc datetime not null Default now(),
  Sexo_Func       char(01)      not null Default 'F',
  Sal_Func     decimal(10,2) not null Default 200,
  End_Func     varchar(100)  not null,

  Constraint PK_Func  Primary Key(Cod_Func),
  Constraint CH_Func2  Check(Sexo_Func IN ('F','M')),
  Constraint CH_Func3  Check(Sal_Func >=0)
); 


CREATE TABLE Bonus
(
  Num_Lanc   int not null,
  Cod_Func   int           not null,
  Data_Bonus datetime not null default NOW(),
  Val_Bonus  decimal(10,2) not null, 

  Constraint PK_Bonus Primary Key(Num_Lanc),
  Constraint FK_Bonus Foreign Key(Cod_Func) References Funcionario(Cod_Func),
  Constraint CH_Bonus2 Check(Val_Bonus > 0)
);



CREATE TABLE Pontuacao
(
  Num_Lanc   int  not null,
  Cod_Func   int           not null,
  Data_Pto   datetime not null default NOW(),
  Pto_Func   decimal(4,2)  not null, 

  Constraint PK_Pto Primary Key(Num_Lanc),
  Constraint FK_Pto Foreign Key(Cod_Func) References Funcionario(Cod_Func),
  Constraint CH_Pto2 Check(Pto_Func > 0)
);

CREATE TABLE Historico
(
  Num_Lanc  int  not null,
  Cod_Func  int           not null, 
  Data_Hist datetime not null Default now(),
  Sal_Ant   decimal(10,2) not null, 
  Sal_Atual decimal(10,2) not null, 

  Constraint PK_Hist  Primary Key(Num_Lanc),
  Constraint FK_Hist  Foreign Key(Cod_Func) References Funcionario(Cod_Func),
  Constraint CH_Hist2 Check(Sal_Ant >= 0),
  Constraint CH_Hist3 Check(Sal_Ant > 0)
);

CREATE TABLE Dependente
(
  Cod_Dep         int   not null,
  Cod_Func        int           not null,
  Nome_Dep       varchar(100)  not null,
  Data_NascDep datetime not null,
  Sexo_Dep        char(01)      not null Default 'F',
 
  Constraint PK_Dep Primary Key(Cod_Dep),
  Constraint FK_Dep Foreign Key(Cod_Func)References Funcionario(Cod_Func),
  Constraint CH_Dep Check(Sexo_Dep IN ('F','M'))
);

CREATE TABLE Pedido
(
  Num_Ped  int   not null,
  Cod_Cli  int           not null,
  Cod_Func int           not null,
  Cod_Sta  smallint      not null,
  Data_Ped datetime not null Default now(),
  Val_Ped  decimal(10,2) not null Default 0,

  Constraint PK_Pedido  Primary Key(Num_Ped),
  Constraint FK_Pedido1 Foreign Key(Cod_Cli) References Cliente(Cod_Cli),
  Constraint FK_Pedido2 Foreign Key(Cod_Cli) References Funcionario(Cod_Func),
  Constraint CH_Pedido2  Check(Val_Ped >=0)
);

CREATE TABLE Parcela (
  Num_Par   SMALLINT NOT NULL,
  Num_Ped   INT NOT NULL,
  Data_Venc DATETIME NOT NULL DEFAULT NOW(),
  Val_Venc  DECIMAL(10,2) NOT NULL,
  Data_Pgto DATETIME NULL,

  Val_Pgto DECIMAL(10,2) GENERATED ALWAYS AS (
    CASE 
      WHEN Data_Pgto IS NULL THEN NULL
      WHEN Data_Pgto < Data_Venc THEN Val_Venc * 0.9
      WHEN Data_Pgto = Data_Venc THEN Val_Venc
      WHEN Data_Pgto > Data_Venc THEN Val_Venc * 1.1
      ELSE NULL
    END
  ) STORED,

  CONSTRAINT PK_Parcela PRIMARY KEY (Num_Par, Num_Ped),
  CONSTRAINT FK_Parcela FOREIGN KEY (Num_Ped) REFERENCES Pedido(Num_Ped),
  CONSTRAINT CH_Parcela2 CHECK (Val_Venc >= 0)
);





CREATE TABLE TipoProd
(
  Cod_TipoProd  int  not null,
  Nome_TipoProd varchar(100) not null,
  
  Constraint PK_TipoProd Primary Key(Cod_TipoProd),
  Constraint UQ_TipoProd Unique(Nome_TipoProd)
); 

CREATE TABLE Produto (
  Cod_Prod        INT NOT NULL,
  Cod_TipoProd    INT NOT NULL,
  Nome_Prod       VARCHAR(100) NOT NULL,
  Qtd_EstqProd    INT NOT NULL DEFAULT 0,
  Val_UnitProd    DECIMAL(10,2) NOT NULL,
  
  Val_Total       DECIMAL(10,2) GENERATED ALWAYS AS (Qtd_EstqProd * Val_UnitProd) STORED,

  CONSTRAINT PK_Prod PRIMARY KEY (Cod_Prod),
  CONSTRAINT FK_Prod FOREIGN KEY (Cod_TipoProd) REFERENCES TipoProd(Cod_TipoProd),
  CONSTRAINT UQ_Prod UNIQUE (Nome_Prod),
  CONSTRAINT CH_Prod1 CHECK (Qtd_EstqProd >= 0),
  CONSTRAINT CH_Prod2 CHECK (Val_UnitProd > 0)
);





CREATE TABLE Itens
(
  Num_Ped    int           not null,
  Cod_Prod   int           not null,
  Qtd_Vend   int           not null,
  Val_Vend   decimal(10,2) not null,

  Constraint PK_Itens   Primary Key(Num_Ped,Cod_Prod),
  Constraint FK_Itens1  Foreign Key(Num_Ped)  References Pedido(Num_Ped),
  Constraint FK_Itens2  Foreign Key(Cod_Prod) References Produto(Cod_Prod),
  Constraint CH_Itens1  Check(Qtd_Vend > 0),
  Constraint CH_Itens2  Check(Val_Vend > 0)
); 


/* *********************************************************************************/
/* Verificando a Criação da Tabelas do Database SYSAMPLES           */
/* *********************************************************************************/
SELECT * FROM Information_Schema.Tables
WHERE Table_Type = 'Base Table'
/* *********************************************************************************/



