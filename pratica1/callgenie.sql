-- Criação --
create database callgenie;
use callgenie;

-- Tabelas --
-- tabela Cliente
CREATE TABLE Cliente (
    cli_nome VARCHAR(50) NOT NULL,
    cli_cpf VARCHAR(11) NOT NULL PRIMARY KEY,
    cli_email VARCHAR(40) NOT NULL,
    cli_telefone VARCHAR(11),
    cli_endereco VARCHAR(50),
    cli_cep VARCHAR(8),
    cli_senha VARCHAR(8)
);

-- tabela Chamado
CREATE TABLE Chamado (
    cham_id INT AUTO_INCREMENT PRIMARY KEY,
    cham_titulo VARCHAR(30) NOT NULL,
    cham_descricao VARCHAR(100),
    cham_status ENUM('Aberto', 'Andamento', 'Concluído') DEFAULT 'Aberto',
    cham_data_inicio DATE DEFAULT CURRENT_DATE,
    cham_urgencia ENUM('baixa', 'media', 'alta', 'urgente') NOT NULL DEFAULT 'media',
    cham_prazo DATE DEFAULT DATE_ADD(CURRENT_DATE, INTERVAL 1 DAY),
    cham_cli_cpf VARCHAR(11),
    FOREIGN KEY (cham_cli_cpf) REFERENCES Cliente(cli_cpf)
);

-- tabela Administrador
CREATE TABLE Administrador (
    adm_id INT AUTO_INCREMENT PRIMARY KEY,
    adm_nome VARCHAR(30) NOT NULL,
    adm_telefone CHAR(11),
    adm_email VARCHAR(40) NOT NULL,
    adm_senha VARCHAR(8)
);

-- tabela Suporte
CREATE TABLE Suporte (
    sup_id INT AUTO_INCREMENT PRIMARY KEY,
    sup_cpf VARCHAR(11) NOT NULL UNIQUE,
    sup_nome VARCHAR(40) NOT NULL,
    sup_email VARCHAR(40) NOT NULL,
    sup_telefone VARCHAR(11),
    sup_senha VARCHAR(8) NOT NULL
);

-- tabela RespostaChamado
CREATE TABLE RespostaChamado (
    resp_id INT AUTO_INCREMENT PRIMARY KEY,
    resp_soluc_comum VARCHAR(255) NOT NULL,
    resp_data DATE DEFAULT CURRENT_DATE,
    resp_sup_id INT,
    resp_cham_id INT,
    FOREIGN KEY (resp_sup_id) REFERENCES Suporte(sup_id),
    FOREIGN KEY (resp_cham_id) REFERENCES Chamado(cham_id)
);

-- tabela Equipamento
CREATE TABLE Equipamento (
    equ_id INT AUTO_INCREMENT PRIMARY KEY,
    equ_nome VARCHAR(255),
    equ_numserie VARCHAR(255),
    equ_tipo VARCHAR(255),
    equ_cham_id INT,
    equ_sup_id INT,
    FOREIGN KEY (equ_cham_id) REFERENCES Chamado(cham_id),
    FOREIGN KEY (equ_sup_id) REFERENCES RespostaChamado(resp_sup_id)
);

--  tabela Faq
CREATE TABLE Faq (
    faq_id INT AUTO_INCREMENT PRIMARY KEY,
    faq_pergunta VARCHAR(100) NOT NULL,
    faq_resposta VARCHAR(150) NOT NULL,
    faq_sup_id INT,
    FOREIGN KEY (faq_sup_id) REFERENCES Suporte(sup_id)
);

-- Criação do usuário admin, se ainda não existir
INSERT INTO Administrador (adm_nome, adm_telefone, adm_email, adm_senha)
VALUES ('admin', '12997881456', 'emaildoadm@callgenie.com', 'admin')
ON DUPLICATE KEY UPDATE adm_nome=VALUES(adm_nome);
