drop database Oficina;
-- -----------------------------------------------------
-- Schema Oficina
-- -----------------------------------------------------
CREATE database IF NOT EXISTS Oficina;
USE Oficina ;

-- -----------------------------------------------------
-- Tabela Pessoa
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Pessoa (
  idPessoa INT NOT NULL AUTO_INCREMENT,
  Nome VARCHAR(45) NOT NULL,
  Endereco VARCHAR(45) NULL,
  Telefone VARCHAR(45) NOT NULL,
  email VARCHAR(45) NULL,
  PRIMARY KEY (idPessoa))
;

alter table Pessoa auto_increment=1;
-- -----------------------------------------------------
-- Tabela Clientes
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Clientes (
  idClientes INT NOT NULL AUTO_INCREMENT,
  Pessoa_idPessoa INT NOT NULL,
  Situacao TINYINT NOT NULL COMMENT 'Cliente Ativo ou inativo',
  Data_ultimo_contato DATE NULL COMMENT 'Preenchida quando a oficina faz contato com o cliente relembrando de uma revisão periódica ou de alguma promoção',
  PRIMARY KEY (idClientes, Pessoa_idPessoa),
  INDEX fk_Clientes_Pessoa_idx (Pessoa_idPessoa ASC) VISIBLE,
  CONSTRAINT fk_Clientes_Pessoa
    FOREIGN KEY (Pessoa_idPessoa)
    REFERENCES Pessoa (idPessoa)
)
;
alter table Clientes auto_increment=1;

-- -----------------------------------------------------
-- Tabela Equipes
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Equipes (
  idEquipes INT NOT NULL AUTO_INCREMENT,
  idFuncionarios_Lider_equipe INT  COMMENT 'FK que associa a identificacao do funcionario que é lider dessa equipe',
  Descricao VARCHAR(45) NULL,
  PRIMARY KEY (idEquipes)
);

alter table Equipes auto_increment=1;
-- -----------------------------------------------------
-- Tabela Funcionarios
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Funcionarios (
  idFuncionarios INT NOT NULL AUTO_INCREMENT,
  Pessoa_idPessoa INT NOT NULL,
  Matricula VARCHAR(45) NULL,
  Especialidade VARCHAR(45) NULL,
  Equipes_idEquipes INT NOT NULL,
  PRIMARY KEY (idFuncionarios, Pessoa_idPessoa, Equipes_idEquipes),
  CONSTRAINT fk_Funcionarios_Pessoa1
    FOREIGN KEY (Pessoa_idPessoa)
    REFERENCES Pessoa (idPessoa)
,
  CONSTRAINT fk_Funcionarios_Equipes1
    FOREIGN KEY (Equipes_idEquipes)
    REFERENCES Equipes (idEquipes)
)
;
alter table Funcionarios auto_increment=1;

-- adicionando a FK na tabela equipes
alter table Equipes add 
  CONSTRAINT fk_Equipes_Funcionarios_lider
    FOREIGN KEY (idFuncionarios_Lider_equipe)
    REFERENCES Funcionarios (idFuncionarios);

-- -----------------------------------------------------
-- Tabela Veiculos
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Veiculos (
  idVeiculos INT NOT NULL AUTO_INCREMENT,
  Marca VARCHAR(45) NOT NULL,
  Modelo VARCHAR(45) NOT NULL,
  Placa VARCHAR(45) NOT NULL,
  Ano INT NOT NULL,
  Situacao TINYINT NOT NULL DEFAULT 1 COMMENT '1: indica se esse carro ainda está com o cliente.\n0 sinaliza que o cliente não possui mais esse carro.',
  Data_ultima_Revisao DATE NULL COMMENT 'Registrando a ultima vez que o veiculo veio para revisao periódica. O sistema poderá gerar alarmes baseado nessa data.',
  Clientes_idClientes INT NOT NULL,
  PRIMARY KEY (idVeiculos, Clientes_idClientes),
  CONSTRAINT fk_Veiculos_Clientes1
    FOREIGN KEY (Clientes_idClientes)
    REFERENCES Clientes (idClientes)
)
;
alter table Veiculos auto_increment=1;
-- -----------------------------------------------------
-- Tabela Catalogo_servicos
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Catalogo_servicos (
  idCatalogo_servicos INT NOT NULL AUTO_INCREMENT,
  Descricao VARCHAR(45) NOT NULL,
  Valor_unitario FLOAT NOT NULL,
  Duracao_servico FLOAT NOT NULL COMMENT 'Tempo médio para execucao do servico em horas',
  PRIMARY KEY (idCatalogo_servicos))
;

alter table Catalogo_servicos auto_increment=1;
-- -----------------------------------------------------
-- Tabela Ordem_servico
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Ordem_servico (
  idOrdem_servico INT NOT NULL AUTO_INCREMENT,
  Equipes_idEquipes INT NOT NULL,
  Data_emissao timestamp NOT NULL DEFAULT current_timestamp,
  Data_Conclusao DATE NULL,
  Liberada_para_executar TINYINT NOT NULL DEFAULT 0 COMMENT 'Sinaliza se o cliente já aprovou a execução dessa ordem por completo, parcial ou nao aprovou\n0: nao aprovou\n1: liberação parcial (ver servicos e peças autorizados)\n2: liberação completa',
  Veiculos_idVeiculos INT NOT NULL,
  Clientes_idClientes INT NOT NULL,
  Vl_cobrado_total_ordem FLOAT NULL COMMENT 'Valor final cobrado do cliente de todos os serviços e peças autorizados.\nPode ser diferente do valor real devido a descontos etc.',
  Porcentagem_diferenca FLOAT NULL COMMENT 'Diferença percentual do valor real final e do valor final cobrado do cliente (se for negativo significa um desconto de nn% e se for positivo significa um acrescimo de yy%)',
  Forma_pagamento VARCHAR(45) NULL COMMENT 'Descrição da forma de pagamento',
  PRIMARY KEY (idOrdem_servico, Equipes_idEquipes, Veiculos_idVeiculos, Clientes_idClientes),
  CONSTRAINT fk_Ordem_servico_Equipes1
    FOREIGN KEY (Equipes_idEquipes)
    REFERENCES Equipes (idEquipes)
,
  CONSTRAINT fk_Ordem_servico_Veiculos1
    FOREIGN KEY (Veiculos_idVeiculos)
    REFERENCES Veiculos (idVeiculos)
,
  CONSTRAINT fk_Ordem_servico_Clientes1
    FOREIGN KEY (Clientes_idClientes)
    REFERENCES Clientes (idClientes)
)
;
alter table Ordem_servico auto_increment=1;

-- -----------------------------------------------------
-- Tabela Catalogo_pecas
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Catalogo_pecas (
  idCatalogo_pecas INT NOT NULL AUTO_INCREMENT,
  Descricao VARCHAR(45) NOT NULL,
  Valor_unitario FLOAT NOT NULL,
  Fabricante VARCHAR(45) NOT NULL,
  PART_NUMBER VARCHAR(45) NOT NULL,
  qtd_estoque INT NOT NULL,
  PRIMARY KEY (idCatalogo_pecas))
;
alter table Catalogo_pecas auto_increment=1;

-- -----------------------------------------------------
-- Tabela Lista_de_servicos_da_OS
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Lista_de_servicos_da_OS (
  Catalogo_servicos_idCatalogo_servicos INT NOT NULL,
  Ordem_servico_idOrdem_servico INT NOT NULL,
  Qtd_servico INT NOT NULL DEFAULT 1,
  Valor_cobrado_unitario FLOAT NOT NULL COMMENT 'Valor definido para o cliente, pode ser do catalogo de servicos ou pode ser algum valor diferenciado.',
  Servico_autorizado TINYINT NOT NULL DEFAULT 0 COMMENT 'Sinaliza se esse servico já foi autorizado pelo cliente\n0: ainda nao autorizado\n1: já autorizado',
  PRIMARY KEY (Catalogo_servicos_idCatalogo_servicos, Ordem_servico_idOrdem_servico),
  CONSTRAINT fk_Catalogo_servicos_has_Ordem_servico_Catalogo_servicos1
    FOREIGN KEY (Catalogo_servicos_idCatalogo_servicos)
    REFERENCES Catalogo_servicos (idCatalogo_servicos)
,
  CONSTRAINT fk_Catalogo_servicos_has_Ordem_servico_Ordem_servico1
    FOREIGN KEY (Ordem_servico_idOrdem_servico)
    REFERENCES Ordem_servico (idOrdem_servico)
)
;


-- -----------------------------------------------------
-- Tabela Lista_de_Pecas_da_OS
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Lista_de_Pecas_da_OS (
  Catalogo_pecas_idCatalogo_pecas INT NOT NULL,
  Ordem_servico_idOrdem_servico INT NOT NULL,
  Qtd_pecas INT NOT NULL,
  Valor_cobrado_Unitario FLOAT NOT NULL,
  Peca_autorizada TINYINT NOT NULL DEFAULT 0 COMMENT 'Sinaliza se o cliente já aprovou a troca dessas peças.\n0: ainda nao aprovado\n1: aprovado',
  PRIMARY KEY (Catalogo_pecas_idCatalogo_pecas, Ordem_servico_idOrdem_servico),
  CONSTRAINT fk_Catalogo_pecas_has_Ordem_servico_Catalogo_pecas1
    FOREIGN KEY (Catalogo_pecas_idCatalogo_pecas)
    REFERENCES Catalogo_pecas (idCatalogo_pecas)
,
  CONSTRAINT fk_Catalogo_pecas_has_Ordem_servico_Ordem_servico1
    FOREIGN KEY (Ordem_servico_idOrdem_servico)
    REFERENCES Ordem_servico (idOrdem_servico)
)
;
