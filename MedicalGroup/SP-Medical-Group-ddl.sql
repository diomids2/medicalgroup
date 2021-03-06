

USE  MedGroup;

CREATE TABLE Clinicas
(
IdClinica INT PRIMARY KEY IDENTITY
,NomeFantasia VARCHAR(200) NOT NULL
,Endereco VARCHAR(200) NOT NULL
,RazaoSocial VARCHAR(200) NOT NULL
,HorarioFuncionamento VARCHAR(200) NOT NULL
,CNPJ VARCHAR(100) NOT NULL
);
GO

CREATE TABLE Especialidades
(
IdEspecialidade INT PRIMARY KEY IDENTITY
,Especialidade VARCHAR(200)
);
GO

CREATE TABLE TipoUsuarios
(
IdTipoU INT PRIMARY KEY IDENTITY
,TituloUsuario VARCHAR(200) UNIQUE NOT NULL
);
GO
CREATE TABLE Situacao
(
IdSitucao INT PRIMARY KEY IDENTITY
,Situacao VARCHAR(30) UNIQUE NOT NULL
);
GO

CREATE TABLE Usuarios
(
IdUsuario INT PRIMARY KEY IDENTITY
,IdTipoU INT FOREIGN KEY REFERENCES TipoUsuarios
,Email VARCHAR(100)UNIQUE NOT NULL
,Senha VARCHAR(20) NOT NULL
);
GO

CREATE TABLE Pacientes
(
IdPaciente INT PRIMARY KEY IDENTITY
,IdUsuario INT FOREIGN KEY REFERENCES Usuarios
,NomePaciente VARCHAR(200) NOT NULL
,DataNascimento VARCHAR (200) NOT NULL
,Telefone VARCHAR (200) NOT NULL
,RG VARCHAR (200) UNIQUE NOT NULL
,CPF VARCHAR (200) UNIQUE NOT NULL
,Endereco VARCHAR (200) NOT NULL
);
GO

CREATE TABLE Medicos
(
IdMdico INT PRIMARY KEY IDENTITY
,IdUsuario INT FOREIGN KEY REFERENCES Usuarios
,IdEspecialidade INT FOREIGN KEY REFERENCES Especialidades
,IdClinica INT FOREIGN KEY REFERENCES Clinicas
,NomeMedico VARCHAR(200) NOT NULL
,CRV VARCHAR(200) NOT NULL
);
GO

CREATE TABLE Consultas
(
IdConsulta INT PRIMARY KEY IDENTITY
,IdMedico INT FOREIGN KEY REFERENCES Medicos
,IdPaciente INT FOREIGN KEY REFERENCES Pacientes
,IdSituacao INT FOREIGN KEY REFERENCES Situacao
,DescricaoConsulta VARCHAR(200)
,DataConsulta VARCHAR(200) NOT NULL
);
GO

