CREATE DATABASE SoundWave; 
USE SoundWave; 
CREATE TABLE artista ( 
 id_artista INT PRIMARY KEY, 
  nome_artista VARCHAR(100)
); 
INSERT INTO artista (id_artista, nome_artista) VALUES 
(1, 'The Beatles'), (2, 'Pink Floyd'), (3, 'Queen');

CREATE TABLE albuns ( 
 id_album INT PRIMARY KEY,
  titulo_album VARCHAR(100),
   id_artista INT,
    FOREIGN KEY (id_artista) REFERENCES artista(id_artista)
); 
INSERT INTO albuns (id_album, titulo_album, id_artista) VALUES 
(1, 'Abbey Road', 1), 
(2, 'The Wall', 2), 
(3, 'A Night at the Opera', 3), 
(4, 'Álbum Sem Artista', NULL);

SELECT a.titulo_album AS Album, ar.nome_artista AS Artista
FROM albuns a
LEFT JOIN artista ar ON a.id_artista = ar.id_artista;

CREATE DATABASE TimeMaster; 
USE TimeMaster; 
CREATE TABLE fabricantes ( 
 id_fabricante INT PRIMARY KEY, 
  nome_fabricante VARCHAR(100)
); 
INSERT INTO fabricantes (id_fabricante, nome_fabricante) VALUES 
(1, 'Rolex'), (2, 'Omega'), (3, 'Tag Heuer');

CREATE TABLE relogios ( 
 id_relogio INT PRIMARY KEY, 
  modelo_relogio VARCHAR(50), 
   id_fabricante INT, 
   FOREIGN KEY (id_fabricante) REFERENCES fabricantes(id_fabricante)
); 
INSERT INTO relogios (id_relogio, modelo_relogio, id_fabricante) VALUES
(1, 'Submariner', 1), 
(2, 'Speedmaster', 2), 
(3, 'Carrera', 3), 
(4, 'Relógio Sem Fabricante', NULL);

SELECT r.modelo_relogio AS Relogio, f.nome_fabricante AS Fabricante
FROM relogios r
LEFT JOIN fabricantes f ON r.id_fabricante = f.id_fabricante;

CREATE DATABASE NovaCasa; 
USE NovaCasa; 
CREATE TABLE propietários (
 id_propietario INT PRIMARY KEY, 
  nome_propietario VARCHAR(100)
); 
INSERT INTO propietários (id_propietario, nome_propietario) VALUES 
(1, 'João Silva'),
(2, 'Maria Oliveira'), 
(3, 'Carlos Souza');

CREATE TABLE imoveis (
 id_moveis INT PRIMARY KEY,
  endereco VARCHAR(100), 
   id_propietario INT, 
   FOREIGN KEY (id_propietario) REFERENCES propietários(id_propietario)
); 
INSERT INTO imoveis (id_moveis, endereco, id_propietario) VALUES 
(1, 'Rua das Flores, 123', 1), 
(2, 'Av. Paulista, 456', 2), 
(3, 'Rua do Mercado, 789', 3), 
(4, 'Rua Sem Dono, 101', NULL);

SELECT i.endereco AS Endereco, p.nome_propietario AS Propietário
FROM imoveis i
LEFT JOIN propietários p ON i.id_propietario = p.id_propietario;

CREATE DATABASE TechEdu; 
USE TechEdu; 

CREATE TABLE cursos (
    id_curso INT PRIMARY KEY,
    nome_curso VARCHAR(100)
);
INSERT INTO cursos (id_curso, nome_curso) VALUES
(1, 'Informática'),
(2, 'Eletrotécnica'),
(3, 'Mecânica');

CREATE TABLE alunos (
    id_aluno INT PRIMARY KEY,
    nome_aluno VARCHAR(100),
    id_curso INT,
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

INSERT INTO alunos (id_aluno, nome_aluno, id_curso) VALUES
(1, 'Ana Souza', 1),
(2, 'João Lima', 2),
(3, 'Carla Ribeiro', 3),
(4, 'Marcos Oliveira', NULL);

SELECT a.nome_aluno AS Nome_Aluno, c.nome_curso AS Nome_Curso
FROM alunos a
LEFT JOIN cursos c ON a.id_curso = c.id_curso;

CREATE DATABASE UniTech; 
USE UniTech; 
CREATE TABLE departamentos (
    id_departamento INT PRIMARY KEY,
    nome_departamento VARCHAR(100)
);
INSERT INTO departamentos (id_departamento, nome_departamento) VALUES
(1, 'Ciências Exatas'),
(2, 'Ciências Humanas'),
(3, 'Engenharia');

CREATE TABLE professores (
    id_professor INT PRIMARY KEY,
    nome_professor VARCHAR(100),
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento)
);
INSERT INTO professores (id_professor, nome_professor, id_departamento) VALUES
(1, 'Dr. Pedro Lima', 1),
(2, 'Dra. Maria Soares', 2),
(3, 'Dr. João Ferreira', NULL),
(4, 'Dra. Ana Figueira', 3);

SELECT p.nome_professor AS Nome_Professor, d.nome_departamento AS Nome_Departamento
FROM professores p
LEFT JOIN departamentos d ON p.id_departamento = d.id_departamento;

CREATE DATABASE HealthCare; 
USE HealthCare; 
CREATE TABLE departamentos (
    id_departamento INT PRIMARY KEY,
    nome_departamento VARCHAR(100)
);
INSERT INTO departamentos (id_departamento, nome_departamento) VALUES
(1, 'Cardiologia'),
(2, 'Neurologia'),
(3, 'Ortopedia');

CREATE TABLE medicos (
    id_medico INT PRIMARY KEY,
    nome_medico VARCHAR(100),
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento)
);
INSERT INTO medicos (id_medico, nome_medico, id_departamento) VALUES
(1, 'Dr. Carlos Mendes', 1),
(2, 'Dra. Julia Amaral', 2),
(3, 'Dr. Paulo Castro', NULL),
(4, 'Dra. Marta Souza', 3);

SELECT m.nome_medico AS Nome_Medico, d.nome_departamento AS Nome_Departamento
FROM medicos m
LEFT JOIN departamentos d ON m.id_departamento = d.id_departamento;
