CREATE DATABASE ArkSurvival;

USE ArkSurvival;

CREATE TABLE usuario (
	idUsuario int PRIMARY KEY AUTO_INCREMENT,
	Nome varchar(50),
	Email varCHAR(100),
	Senha varchar(50)
);
Create table Quiz (
IdQuiz int primary key auto_increment,
Titulo varchar (45)
);

CREATE TABLE Perguntas (
	idPergunta int PRIMARY KEY AUTO_INCREMENT,
	Pergunta varchar(100),
    Resposta_a varchar(100),
    Resposta_b varchar(100),
    Resposta_c varchar(100),
    Resposta_d varchar(100),
    FkQuiz int
);

CREATE TABLE Resposta (
	FkUsuario int,
	FkQuiz int,
	Tentativa int,
	DtResposta DATETIME DEFAULT current_timestamp,
    QtdAcertos tinyint,
	FOREIGN KEY (FkUsuario) REFERENCES Usuario(idUsuario),
	FOREIGN KEY (FkQuiz) REFERENCES Quiz(IdQuiz),
	Primary key (FkQuiz, FkUsuario, DtResposta)
);

insert into quiz (Titulo) values
('Teste de Sobrevivente');

insert into Perguntas (Pergunta, Resposta_a, Resposta_b, Resposta_c, Resposta_d, FkQuiz) values 
('Qual é a verdadeira função dos Overseers nas ARKs?', 'Controlar o clima e os biomas das ARKs', 'Monitorar e julgar os sobreviventes nos testes de ascensão', 'Proteger os Homo deus da ameaça do Element', 'Criar criaturas híbridas para as simulações', 1),
('Por que Scorched Earth é considerada uma ARK mais severa?', 'Porque o clima muda constantemente entre neve e calor', 'Porque os Homo deus a usam como prisão', 'Porque Rockwell já controlava essa ARK desde o início', 'Devido à escassez extrema de recursos e falhas no sistema', 1),
('Qual foi o papel de Diana e Mei-Yin em Extinction?', 'Elas ajudaram a derrotar o Overseer de Aberration', 'Ajudaram Helena a escapar da simulação de Genesis 1', 'Encontraram a origem da Entidade Corrompida e lutaram contra ela', 'Criaram o plano para construir a Colony Ship', 1),
('O que diferencia Genesis Parte 1 das ARKs anteriores?', 'É uma simulação digital, não um ambiente físico', 'Ela acontece em uma ARK com gravidade zero', 'Foi criada por Rockwell como uma armadilha', 'Não possui Overseers, apenas humanos', 1),
('O que simboliza a chegada do jogador em Ark 2?', 'A volta da civilização humana às suas origens tecnológicas', 'Um novo ciclo de testes planejado pelos Homo deus', 'O fim das simulações e o início de um futuro real e orgânico', 'A ascensão do jogador como novo Overseer', 1),
('Quem foi responsável por corromper Rockwell e levá-lo à insanidade?', 'A radiação de Aberration', 'O contato com o Elemento', 'Um experimento fracassado dos Homo deus', 'A perda de sua filha', 1),
('Qual era a função original do Colony Ship em Genesis Parte 2?', 'Testar humanos geneticamente modificados', 'Fugir da Terra e levar humanos a um novo planeta', 'Conter o Elemento corrompido em segurança', 'Criar uma nova raça de Homo deus', 1),
('O que faz de Helena uma personagem única entre os sobreviventes?', 'Ela se transforma em Homo deus após Extinction', 'Ela é a única a ascender em todas as ARKs', 'Ela fundou a tribo dos Caminhantes', 'Ela criou os simulacros como HLN-A', 1),
('Por que Aberration está tão instável e perigosa?', 'Seu núcleo foi danificado por um experimento falho', 'Foi sabotada por sobreviventes em rebelião', 'Ela foi atingida por um meteoro', 'Foi corrompida pelo Overseer local', 1),
('O que representa a derrota final de Rockwell em Genesis Parte 2?', 'O colapso das ARKs', 'A fusão entre humanos e IA', 'O início da Era dos Homo deus', 'A libertação do controle do Elemento', 1);
