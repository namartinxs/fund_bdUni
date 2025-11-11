CREATE DATABASE achados_e_perdidos_Uni_ddl_GB;
USE achados_e_perdidos_Uni_ddl_GB;

CREATE TABLE `Usuario` (
  `id` integer PRIMARY KEY,
  `nome` varchar(120) NOT NULL,
  `email` varchar(320) NOT NULL,
  `status` ENUM ('ativo', 'inativo') NOT NULL
);

CREATE TABLE `Administrador` (
  `id` integer PRIMARY KEY,
  `id_usuario` integer UNIQUE,
  `cargo` varchar(200) NOT NULL,
  FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`id`)
);

CREATE TABLE `Aluno` (
  `id_usuario` integer UNIQUE,
  `matricula` integer PRIMARY KEY,
  `curso` varchar(100) NOT NULL,
  FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`id`)
);

CREATE TABLE `Localizacao` (
  `id` integer PRIMARY KEY,
  `nome` varchar(100) NOT NULL,
  `descricao` varchar(180) NOT NULL
);

CREATE TABLE `Item` (
  `id` integer PRIMARY KEY,
  `id_local` integer,
  `nome` varchar(100) NOT NULL,
  `descricao` varchar(180) NOT NULL,
  `data_encontrado` datetime NOT NULL,
  `status` ENUM ('encontrado', 'entregue', 'devolvido', 'descartado') NOT NULL,
  `foto` VARCHAR(500),
  FOREIGN KEY (`id_local`) REFERENCES `Localizacao` (`id`)
);

CREATE TABLE `Reivindicacao` (
  `id` integer PRIMARY KEY,
  `id_item` integer,
  `id_reivindicador` integer,
  `analisado_por` integer,
  `data_reivindicacao` datetime NOT NULL,
  `justificativa` varchar(300) NOT NULL,
  `status` ENUM ('pendente', 'aprovada', 'recusada') NOT NULL,
  `data_analise` datetime,
  FOREIGN KEY (`id_item`) REFERENCES `Item` (`id`),
  FOREIGN KEY (`id_reivindicador`) REFERENCES `Usuario` (`id`),
  FOREIGN KEY (`analisado_por`) REFERENCES `Administrador` (`id`)
);

CREATE TABLE `Registro` (
  `id` integer PRIMARY KEY,
  `id_item` integer,
  `id_encontrado_por` integer,
  `id_entregue_por` integer,
  `id_recebido_por` integer,
  `id_retirado_por` integer,
  `data_entrega` timestamp,
  `data_retirada` datetime,
  FOREIGN KEY (`id_item`) REFERENCES `Item` (`id`),
  FOREIGN KEY (`id_encontrado_por`) REFERENCES `Usuario` (`id`),
  FOREIGN KEY (`id_entregue_por`) REFERENCES `Usuario` (`id`),
  FOREIGN KEY (`id_recebido_por`) REFERENCES `Administrador` (`id`),
  FOREIGN KEY (`id_retirado_por`) REFERENCES `Usuario` (`id`)
);


