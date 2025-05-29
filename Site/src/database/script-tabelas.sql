-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server
*/

CREATE DATABASE ArkSurvival;

USE ArkSurvival;

CREATE TABLE usuario (
	idUsuario int PRIMARY KEY AUTO_INCREMENT,
	Nome varchar(50),
	Email varchar(100),
	Senha varchar(50)
);

CREATE TABLE Perguntas (
	idPergunta int PRIMARY KEY AUTO_INCREMENT,
	Pergunta varchar(100)
);

CREATE TABLE Resposta (
	FkUsuario int,
	FkPergunta int,
	Tentativa int,
	DtResposta varchar(50),
	Resposta char(1),
	RespostaCorreta char(1),
	FOREIGN KEY (FkUsuario) REFERENCES Usuario(idUsuario),
	FOREIGN KEY (FkPergunta) REFERENCES Perguntas(idPergunta),
	Primary key (FkPergunta, FkUsuario, Tentativa)
);


