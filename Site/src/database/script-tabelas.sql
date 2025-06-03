-- Passo a passo para criar o usuario 

1 mysql -u root -p;
2 create user 'pedro'@'%' identified by 'Sptech#2024';
3 grant all privileges on *.* to 'pedro'@'%';
4 flush privileges;
5 exit 
6 mysql -u pedro -p
7 fazer as Tabelas
-- Tabelas e inserts para funcionar
create database arksurvival;

use arksurvival;

create table usuario (
	idusuario int primary key auto_increment,
	nome varchar(50),
	email varchar(100),
	senha varchar(50)
);

create table quiz (
	idquiz int primary key auto_increment,
	titulo varchar(45)
);

create table perguntas (
	idpergunta int primary key auto_increment,
	pergunta varchar(100),
	resposta_a varchar(100),
	resposta_b varchar(100),
	resposta_c varchar(100),
	resposta_d varchar(100),
	fkquiz int
);

create table resposta (
	fkusuario int,
	fkquiz int,
	tentativa int,
	dtresposta datetime default current_timestamp,
	qtdacertos tinyint,
	foreign key (fkusuario) references usuario(idusuario),
	foreign key (fkquiz) references quiz(idquiz),
	primary key (fkquiz, fkusuario, dtresposta)
);

insert into quiz (titulo) values
('teste de sobrevivente');

insert into perguntas (pergunta, resposta_a, resposta_b, resposta_c, resposta_d, fkquiz) values 
('qual é a verdadeira função dos overseers nas arks?', 'controlar o clima e os biomas das arks', 'monitorar e julgar os sobreviventes nos testes de ascensão', 'proteger os homo deus da ameaça do element', 'criar criaturas híbridas para as simulações', 1),
('por que scorched earth é considerada uma ark mais severa?', 'porque o clima muda constantemente entre neve e calor', 'porque os homo deus a usam como prisão', 'porque rockwell já controlava essa ark desde o início', 'devido à escassez extrema de recursos e falhas no sistema', 1),
('qual foi o papel de diana e mei-yin em extinction?', 'elas ajudaram a derrotar o overseer de aberration', 'ajudaram helena a escapar da simulação de genesis 1', 'encontraram a origem da entidade corrompida e lutaram contra ela', 'criaram o plano para construir a colony ship', 1),
('o que diferencia genesis parte 1 das arks anteriores?', 'é uma simulação digital, não um ambiente físico', 'ela acontece em uma ark com gravidade zero', 'foi criada por rockwell como uma armadilha', 'não possui overseers, apenas humanos', 1),
('o que simboliza a chegada do jogador em ark 2?', 'a volta da civilização humana às suas origens tecnológicas', 'um novo ciclo de testes planejado pelos homo deus', 'o fim das simulações e o início de um futuro real e orgânico', 'a ascensão do jogador como novo overseer', 1),
('quem foi responsável por corromper rockwell e levá-lo à insanidade?', 'a radiação de aberration', 'o contato com o elemento', 'um experimento fracassado dos homo deus', 'a perda de sua filha', 1),
('qual era a função original do colony ship em genesis parte 2?', 'testar humanos geneticamente modificados', 'fugir da terra e levar humanos a um novo planeta', 'conter o elemento corrompido em segurança', 'criar uma nova raça de homo deus', 1),
('o que faz de helena uma personagem única entre os sobreviventes?', 'ela se transforma em homo deus após extinction', 'ela é a única a ascender em todas as arks', 'ela fundou a tribo dos caminhantes', 'ela criou os simulacros como hln-a', 1),
('por que aberration está tão instável e perigosa?', 'seu núcleo foi danificado por um experimento falho', 'foi sabotada por sobreviventes em rebelião', 'ela foi atingida por um meteoro', 'foi corrompida pelo overseer local', 1),
('o que representa a derrota final de rockwell em genesis parte 2?', 'o colapso das arks', 'a fusão entre humanos e ia', 'o início da era dos homo deus', 'a libertação do controle do elemento', 1);
