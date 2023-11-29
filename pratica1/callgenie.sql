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
VALUES ('admin', '12997881456', 'emaildoadm@callgenie.com', 'fatec')
ON DUPLICATE KEY UPDATE adm_nome=VALUES(adm_nome);


--Inserções Cliente

INSERT INTO Cliente (cli_nome, cli_cpf, cli_email, cli_telefone, cli_endereco, cli_cep, cli_senha)
VALUES ('João', '12345678901', 'joao@gmail.com', '12997881456', 'Rua 1', '12345678', '12345678');
VALUES ('Maria', '12345678902', 'maria@gmail.com', '12997881457', 'Rua 2', '12345679', '12345679');
VALUES ('José', '12345678903', 'jose@gmail.com', '12997881458', 'Rua 3', '12345670', '12345670');
VALUES ('Ana', '12345678904', 'ana@gmail.com', '12997881459', 'Rua 4', '12345671', '12345671');
VALUES ('Pedro', '12345678905', 'pedro@gmail.com', '12997881450', 'Rua 5', '12345672', '12345672');
VALUES ('Paula', '12345678906', 'paula@gmail.com', '12997881451', 'Rua 6', '12345673', '12345673');
VALUES ('Carlos', '12345678907', 'carlos@gmail.com', '12997881452', 'Rua 7', '12345674', '12345674');
VALUES ('Camila', '12345678908', 'camila@gmail.com', '12997881453', 'Rua 8', '12345675', '12345675');
VALUES ('Fernando', '12345678909', 'fernando@gmail.com', '12997881454', 'Rua 9', '12345676', '12345676');
VALUES ('Fernanda', '12345678910', 'fernanada@gmail.com', '12997881455', 'Rua 10', '12345677', '12345677');
VALUES ('Rafael', '12345678911', 'rafael@gmail.com', '12997881460', 'Rua 11', '12345680', '12345680');
VALUES ('Rafaela', '12345678912', 'rafaela@gmail.com', '12997881461', 'Rua 12', '12345681', '12345681');
VALUES ('Gabriel', '12345678913', 'gabriel@gmail.com', '12997881462', 'Rua 13', '12345682', '12345682');
VALUES ('Gabriela', '12345678914', 'gabriela@gmail.com', '12997881463', 'Rua 14', '12345683', '12345683');
VALUES ('Mariana', '12345678915', 'mariana@gmail.com', '12997881464', 'Rua 15', '12345684', '12345684');
VALUES ('Mario', '12345678916', 'mario@gmial.com', '12997881465', 'Rua 16', '12345685', '12345685');
VALUES ('Marcos', '12345678917', 'marcos@gmail.com', '12997881466', 'Rua 17', '12345686', '12345686');
VALUES ('Marcia', '12345678918', 'marcia@gmail.com', '12997881467', 'Rua 18', '12345687', '12345687');
VALUES ('Julia', '12345678919', 'julia@gmail.com', '12997881468', 'Rua 19', '12345688', '12345688');
VALUES ('Julio', '12345678920', 'julio@gmail.com', '12997881469', 'Rua 20', '12345689', '12345689');
VALUES ('Lucas', '12345678921', 'lucas@gmail.com', '12997881470', 'Rua 21', '12345690', '12345690');
VALUES ('Luciana', '12345678922', 'luciana@gmail.com', '12997881471', 'Rua 22', '12345691', '12345691');
VALUES ('Luiz', '12345678923', 'luiz@gmail.com', '12997881472', 'Rua 23', '12345692', '12345692');
VALUES ('Luiza', '12345678924', 'luiza@gmail.com', '12997881473', 'Rua 24', '12345693', '12345693');
VALUES ('Matheus', '12345678925', 'matheus@gmail.com', '12997881474', 'Rua 25', '12345694', '12345694');
VALUES ('Marta', '12345678926', 'marta@gmail.com', '12997881475', 'Rua 26', '12345695', '12345695');
VALUES ('Bruno', '12345678927', 'bruno@gmail.com', '12997881476', 'Rua 27', '12345696', '12345696');
VALUES ('Bruna', '12345678928', 'bruna@gmail.com', '12997881477', 'Rua 28', '12345697', '12345697');
VALUES ('Ryan', '12345678929', 'ryan@gmail.com', '12997881478', 'Rua 29', '12345698', '12345698');
VALUES ('Felipe', '12345678930', 'felipe@gmail.com', '12997881479', 'Rua 30', '12345699', '12345699');
VALUES ('Wellington', '12345678931', 'wellington@gmail.com', '12997881480', 'Rua 31', '12345700', '12345700');
VALUES ('Wellen', '12345678932', 'wellen@gmail.com', '12997881481', 'Rua 32', '12345701', '12345701');
VALUES ('Ronaldo', '12345678933', 'ronaldo@gmail.com', '12997881482', 'Rua 33', '12345702', '12345702');
VALUES ('Juliana', '12345678934', 'juliana@gmail.com', '12997881483', 'Rua 34', '12345703', '12345703');
VALUES ('Julieta', '12345678935', 'julieta@gmail.com', '12997881484', 'Rua 35', '12345704', '12345704');
VALUES ('Romeu', '12345678936', 'romeu@gmail.com', '12997881485', 'Rua 36', '12345705', '12345705');
VALUES ('Ricardo', '12345678937', 'ricardo@gmail.com', '12997881486', 'Rua 37', '12345706', '12345706');
VALUES ('Alice', '12345678938', 'alice@gmail.com', '12997881487', 'Rua 38', '12345707', '12345707');
VALUES ('Aline', '12345678939', 'aline@gmail.com', '12997881488', 'Rua 39', '12345708', '12345708');
VALUES ('Amanda', '12345678940', 'amanda@gmail.com', '12997881489', 'Rua 40', '12345709', '12345709');
VALUES ('Caio', '12345678941', 'caio@gmail.com', '12997881490', 'Rua 41', '12345710', '12345710');
VALUES ('Caique', '12345678942', 'caique@gmail.com', '12997881491', 'Rua 42', '12345711', '12345711');
VALUES ('Cristiano', '12345678943', 'cristiano@gmail.com', '12997881492', 'Rua 43', '12345712', '12345712');
VALUES ('Cristina', '12345678944', 'cristina@gmail.com', '12997881493', 'Rua 44', '12345713', '12345713');
VALUES ('Cristiane', '12345678945', 'cristiane@gmail.com', '12997881494', 'Rua 45', '12345714', '12345714');
VALUES ('Laura', '12345678946', 'laura@gmail.com', '12997881495', 'Rua 46', '12345715', '12345715');
VALUES ('Larissa', '12345678947', 'larissa@gmail.com', '12997881496', 'Rua 47', '12345716', '12345716');
VALUES ('Leticia', '12345678948', 'leticia@gmail.com', '12997881497', 'Rua 48', '12345717', '12345717');
VALUES ('Luis', '12345678949', 'luis@gmail.com', '12997881498', 'Rua 49', '12345718', '12345718');
VALUES ('Thaís', '12345678950', 'thais@gmail.com', '12997881499', 'Rua 50', '12345719', '12345719');

--Inserções Chamado
INSERT INTO Chamado (cham_titulo, cham_descricao, cham_status, cham_data_inicio, cham_urgencia, cham_prazo, cham_cli_cpf)
VALUES ('Problema com o computador', 'O computador não está ligando', 'Aberto', '2020-10-01', 'media', '2020-10-02', '12345678901');
VALUES ('Problema com o monitor', 'O computador liga mas o monitor não dá vídeo', 'Aberto', '2020-10-01', 'media', '2020-10-02', '12345678902');
VALUES ('Problema com o mouse', 'O mouse não está funcionando', 'Aberto', '2020-10-01', 'media', '2020-10-02', '12345678903');
VALUES ('Problema com o som', 'O computador não está saindo som', 'Aberto', '2020-10-01', 'media', '2020-10-02', '12345678904');
VALUES ('Problema com o bluetooth', 'O bluetooth do computador não tá funcionando', 'Aberto', '2020-10-01', 'media', '2020-10-02', '12345678905');
VALUES ('Problema com o teclado', 'O teclado não está funcionando', 'Aberto', '2020-10-01', 'media', '2020-10-02', '12345678906');
VALUES ('Problema com o HD', 'O computador não está reconhecendo o HD', 'Aberto', '2020-10-01', 'media', '2020-10-02', '12345678907');
VALUES ('Problema com o SSD', 'O computador não está reconhecendo o SSD', 'Aberto', '2020-10-01', 'media', '2020-10-02', '12345678908');
VALUES ('Problema com o cooler', 'O cooler do computador não está funcionando', 'Aberto', '2020-10-01', 'media', '2020-10-02', '12345678909');
VALUES ('Problema com o processador', 'O processador do computador não está funcionando', 'Aberto', '2020-10-01', 'media', '2020-10-02', '12345678910');
VALUES ('Problema com o placa de vídeo', 'A placa de vídeo do computador não está funcionando', 'Aberto', '2020-10-01', 'media', '2020-10-02', '12345678911');
VALUES ('Problema com o placa mãe', 'A placa mãe do computador não está funcionando', 'Aberto', '2020-10-01', 'media', '2020-10-02', '12345678912');
VALUES ('Problema com vírus', 'Meu computador está com um malwere', 'Aberto', '2020-10-01', 'alta', '2020-10-02', '12345678913');
VALUES ('Problema com o sistema operacional', 'Meu computador está com um problema no sistema operacional', 'Aberto', '2020-10-01', 'alta', '2020-10-02', '12345678914');
VALUES ('Problema com o windows', 'Meu computador está com um problema no windows11, versão PRO', 'Aberto', '2020-10-01', 'alta', '2020-10-02', '12345678915');
VALUES ('Problema com o linux', 'Meu computador está com um problema no linux', 'Aberto', '2020-10-01', 'alta', '2020-10-02', '12345678916');
VALUES ('Problema com o mac', 'Meu computador está com um problema no mac', 'Em Andamento', '2020-09-29', 'alta', '2020-09-30', '12345678917');
VALUES ('Problema com o android', 'Meu celular está com um problema no android', 'Em Andamento', '2020-09-29', 'alta', '2020-09-30', '12345678918');
VALUES ('Problema com o ios', 'Meu celular está com um problema no ios', 'Em Andamento', '2020-09-29', 'alta', '2020-09-30', '12345678919');
VALUES ('Problema com o iphone', 'Meu iphone12 não está carregando', 'Em Andamento', '2020-09-29', 'alta', '2020-09-30', '12345678920');
VALUES ('Problema com o ipad', 'Meu ipad molhou e agora não quer ligar', 'Em Andamento', '2020-09-29', 'alta', '2020-09-30', '12345678921');
VALUEs ('Problema com a bateria', 'A bateria do meu celular não está carregando', 'Em Andamento', '2020-09-29', 'alta', '2020-09-30', '12345678922');
VALUES ('Problema com o carregador', 'O carregador do meu celular não está funcionando', 'Em Andamento', '2020-09-29', 'alta', '2020-09-30', '12345678923');
VALUES ('Problema com o fone de ouvido', 'O fone de ouvido do meu celular não está funcionando', 'Em Andamento', '2020-09-29', 'alta', '2020-09-30', '12345678924');
VALUES ('Problema com o microfone', 'O microfone do meu celular não está funcionando', 'Em Andamento', '2020-09-29', 'alta', '2020-09-30', '12345678925');
VALUES ('Problema com o alto falante', 'O alto falante do meu celular não está funcionando', 'Em Andamento', '2020-09-29', 'alta', '2020-09-30', '12345678926');
VALUES ('Problema com o wi-fi', 'O wi-fi do meu celular não está funcionando', 'Em Andamento', '2020-09-29', 'alta', '2020-09-30', '12345678927');
VALUES ('Problema com o bluetooth', 'O bluetooth do meu celular não está funcionando', 'Em Andamento', '2020-10-01', 'urgente', '2020-10-01', '12345678928');
VALUES ('Problema com o 4G', 'O 4G do meu celular não está funcionando', 'Em Andamento', '2020-10-01', 'urgente', '2020-10-01', '12345678929');
VALUES ('Problema com o chip', 'O meu celular não está reconhecendo o chip da operadora', 'Em Andamento', '2020-10-01', 'urgente', '2020-10-01', '12345678930');
VALUES ('Problema com o cartão de memória', 'O meu celular não está reconhecendo o cartão de memória', 'Em Andamento', '2020-10-01', 'urgente', '2020-10-01', '12345678931');
VALUES ('Problema com o micro sd', 'O meu celular não está reconhecendo o micro sd', 'Em Andamento', '2020-10-01', 'urgente', '2020-10-01', '12345678932');
VALUES ('Problema com o GPS', ' não está funcionando o GPS do mue celular', 'Concluido', '2020-09-27', 'urgente', '2020-09-27', '12345678933');
VALUES ('Problema com o touch', 'O touch do meu celular não está funcionando', 'Concluido', '2020-09-27', 'urgente', '2020-09-27', '12345678934');
VALUES ('Problema com o display', 'O display do meu celular não está funcionando', 'Concluido', '2020-09-27', 'urgente', '2020-09-27', '12345678935');
VALUES ('Problema com a impressora', 'A minha impressora está com tanque de tinta cheio mas não está reconhecendo.', 'Concluido', '2020-09-27', 'urgente', '2020-09-27', '12345678936');
VALUES ('Problema com o scanner', 'O scanner da minha impressora não está funcionando', 'Concluido', '2020-09-27', 'urgente', '2020-09-27', '12345678937');
VALUES ('Problema de bateria SmartWatch', 'Meu Smartwatch está com problema e não carrega', 'Concluido', '2020-09-27', 'urgente', '2020-09-27', '12345678938');
VALUES ('Problema com o teclado do notebook', 'O teclado do meu notebook não está funcionando', 'Concluido', '2020-09-27', 'urgente', '2020-09-27', '12345678939');
VALUES ('Problema de Segurança', 'Vírus detectado', 'Concluido', '2020-09-27', 'urgente', '2020-09-27', '12345678940');
VALUES ('Backup Não Realizado', 'Backup automático não está funcionando','Concluido', '2020-09-27', 'urgente', '2020-09-27', '12345678941');
VALUES ('Problema de Hardware', 'Hardware defeituoso', 'Aberto', '2020-09-27', 'alta', '2020-09-27', '12345678942');
VALUES ('Problema com Antivírus', 'Antivírus desativado', 'Em Andamento' ,'2020-09-27', 'media', '2020-09-28' ,'12345678943');
VALUES ('Erro no Excel', 'Excel trava ao abrir', 'Em Andamento' ,'2020-09-27', 'media', '2020-09-28' ,'12345678944'); 
VALUES ('Problema de Acesso', 'Não consigo acessar a rede', 'Aberto', '2020-12-16', 'baixa', '2020-12-20', '12345678945');
VALUES ('Problema de Energia', 'Computador desliga inesperadamente', '2023-12-17 11:00:00', 'Em Andamento', '2023-12-21 14:00:00'),
VALUES ('Problema com Monitor', 'Monitor piscando', '2023-12-18 16:00:00', 'Concluído', '2023-12-22 12:30:00'),
VALUES ('Problema de Áudio', 'Sem som no computador', '2023-12-19 14:30:00', 'Aberto', '2023-12-23 10:30:00'),
VALUES ('Problema de Acesso', 'Usuário com dificuldade de acessar o sistema', '2023-12-02 10:30:00', 'Aberto', '2023-12-04 12:45:00'),
VALUES ('Problema de Impressão', 'Impressora não está imprimindo corretamente', '2023-12-03 12:45:00', 'Em Andamento', '2023-12-06 15:00:00')

--Inserções Suporte
INSERT INTO Suporte (sup_cpf, sup_nome, sup_email, sup_telefone, sup_senha)
VALUES ('12345678951', 'Cristiano', 'suporte1@gmail.com', '12997881456', 'suporte1'),
    ('12345678952', 'Cristina', 'suporte2@gmail.com', '12997881457', 'suporte2'),
    ('12345678953', 'Cristiane', 'suporte3@gmail.com', '12997881458', 'suporte3'),
    ('12345678954', 'Laura', 'suporte4@gmail.com','12997881459', 'suporte4'),
    ('12345678955', 'Larissa', 'suporte5@gmail.com','12997881460', 'suporte5'),
    ('12345678956', 'Leticia', 'suporte6@gmail.com','12997881461', 'suporte6'),
    ('12345678957', 'Luis', 'suporte7@gmail.com','12997881462', 'suporte7'),
    ('12345678958', 'Thaís', 'suporte8@gmail.com','12997881463', 'suporte8'),
    ('12345678959', 'Juliana', 'suporte9@gmail.com','12997881464', 'suporte9'),
    ('12345678960', 'Julieta', 'suporte10@gmail.com','12997881465', 'suporte10'),
    ('12345678961', 'Romeu', 'suporte11@gmail.com','12997881466', 'suporte11'),
    ('12345678962', 'Ricardo', 'suporte12@gmail.com','12997881467', 'suporte12'),
    ('12345678963', 'Alice', 'suporte13@gmail.com', '12997881468', 'suporte13');

--Inserções FAQ
INSERT INTO FAQ (faq_id, faq_pergunta, faq_resposta, faq_sup_id)
VALUES
 ('Como posso redefinir minha senha?', 'Você pode redefinir sua senha 
acessando a página de recuperação de senha em nosso site e seguindo as 
instruções fornecidas.',1),
 ('Qual é o horário de atendimento?', 'Nosso horário de atendimento é das 
9h às 18h, de segunda a sexta-feira. Estamos fechados nos fins de semana e 
feriados.',2),
 ('Como posso abrir um novo chamado de suporte?', 'Para abrir um novo 
chamado de suporte, faça login em sua conta e vá para a seção de suporte. Clique
em "Abrir Chamado" e preencha o formulário com os detalhes do problema.',4),
 ('Existe um número de telefone de suporte?', 'Sim, nosso número de suporte
é (XX) XXXX-XXXX. Estamos disponíveis durante o horário comercial para ajudar 
com suas dúvidas e problemas.',8),
 ('Como verificar o status do meu chamado?', 'Você pode verificar o status 
do seu chamado fazendo login em sua conta e indo para a seção de suporte. Lá, 
você encontrará uma lista de seus chamados com os status correspondentes.',12),
 ('Posso cancelar um chamado após aberto?', 'Infelizmente, uma vez que um 
chamado é aberto, não é possível cancelá-lo. Recomendamos fornecer o máximo de 
detalhes possível ao abrir um chamado para uma resolução mais rápida.',3),
 ('Qual é o tempo médio de resposta?', 'Nosso objetivo é responder a todos 
os chamados no prazo de 24 horas úteis. No entanto, o tempo real pode variar 
dependendo da complexidade do problema e da carga de suporte.',1),
 ('Posso adicionar mais informações ao meu chamado?', 'Sim, você pode 
adicionar mais informações ao seu chamado respondendo ao e-mail de confirmação 
que recebeu. Isso ajudará nossa equipe a entender melhor a situação e fornecer 
uma solução mais rápida.',7),
 ('Como posso atualizar minhas informações de contato?', 'Para atualizar 
suas informações de contato, faça login em sua conta e vá para as configurações 
de perfil. Lá, você encontrará opções para editar suas informações, incluindo email e número de telefone.',10),
 ('O que fazer se minha pergunta não estiver aqui?', 'Se sua pergunta não 
estiver na lista, entre em contato conosco através do formulário de suporte ou 
do número fornecido, e ficaremos felizes em ajudar.',3),
 ('Como faço para instalar a última atualização do software?', 'Para 
instalar a última atualização do software, visite nossa página de downloads e 
siga as instruções fornecidas para a versão mais recente do produto.',6),
 ('Posso transferir minha licença para outro dispositivo?', 'Sim, você pode
transferir sua licença para outro dispositivo. Entre em contato conosco e 
forneceremos as instruções necessárias para realizar a transferência.',11),
 ('Qual é a política de reembolso?', 'Nossa política de reembolso permite 
reembolsos dentro dos primeiros 30 dias após a compra. Certifique-se de ler 
nossos termos e condições para obter informações detalhadas.', 9),
 ('Como faço para relatar um bug no software?', 'Para relatar um bug no 
software, vá para a seção de suporte em nosso site e selecione a opção "Relatar 
Bug". Descreva o problema detalhadamente para que nossa equipe possa 
investigar.',5),
 ('Onde posso encontrar tutoriais sobre o uso do software?', 'Oferecemos 
tutoriais em vídeo e documentação detalhada em nossa página de suporte. Explore 
esses recursos para obter ajuda na instalação e no uso do software.', 2);

--Inserções RespostaChamado

--Inserções Equipamento
INSERT INTO Equipamento (equ_nome, equ_numserie, equ_tipo, equ_cham_id, equ_sup_id)
VALUES('Notebook para Chamado 1', '1254ZX5FG001', 'nootebook' 1, 2),
 ('Desktop para Chamado 4', '1254ZX5FG002', 'nootebook' 4, 8),
 ('Notebook para Chamado 7', '1254ZX5FG003', 'nootebook' 7, 10),
 ('Desktop para Chamado 14', '1254ZX5FG004', 'nootebook' 14, 6),
 ('Notebook para Chamado 16', '1254ZX5FG005', 'nootebook' 16, 9),
 ('Desktop para Chamado 19', '1254ZX5FG006', 'nootebook' 19, 12),
 ('Notebook para Chamado 21', '1254ZX5FG007', 'nootebook' 21, 3),
 ('Desktop para Chamado 24', '1254ZX5FG008', 'nootebook' 24, 1),
 ('Notebook para Chamado 31', '1254ZX5FG009', 'nootebook' 31, 11),
 ('Desktop para Chamado 33', '1254ZX5FG010', 'nootebook' 33, 7),
 ('Notebook para Chamado 38', '1254ZX5FG011', 'nootebook' 38, 5),
 ('Desktop para Chamado 41', '1254ZX5FG012', 'nootebook' 41, 4),
 ('Notebook para Chamado 44', '1254ZX5FG013', 'nootebook' 44, 2),
 ('Desktop para Chamado 47', '1254ZX5FG014', 'nootebook' 47, 8),
 ('Notebook para Chamado 50', '1254ZX5FG015', 'nootebook' 50, 1);
