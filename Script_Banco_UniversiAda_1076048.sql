-- Projeto final do módulo Banco de Dados Postgres. Script para criação do banco de dados UniveriAda e suas tabelas.
-- Professor: Diego Rocha
-- Aluno: Moacyr Gonçalves Quates


-- Cole abaixo seu código DDL

create database UnivesiAda;

create table alunos (
    mat int primary key, 
    nome varchar(100) not null, 
    endereco varchar(255), 
    cidade varchar(255)
);
 
 create table professores (
    cod_prof int primary key, 
    nome varchar(100) not null, 
    endereco varchar(255), 
    cidade varchar(255)
);
 
 create table disciplinas ( 
    cod_disc varchar(10) primary key, 
    nome_disc varchar(255) not null, 
    carga_horaria int
);
 
 create table turmas (
    cod_turma int,
    cod_disc varchar(10),
    cod_prof integer,
    ano integer,
    horario varchar(10),
    Primary key (cod_turma, cod_disc),
    foreign key (cod_disc) references disciplinas(cod_disc),
    foreign key (cod_prof) references professores(cod_prof)
);

create table historicos (
    cod_hist int primary key,
    mat int,
    cod_disc varchar(10),
    cod_turma int,
    cod_prof int,
    ano int,
    frequencia int,
    nota int,
    foreign key (mat) references alunos(mat),
    foreign key (cod_disc) references disciplinas(cod_disc),
    foreign key (cod_turma, cod_disc) references turmas(cod_turma, cod_disc),
    foreign key (cod_prof) references professores(cod_prof)
);



-- Cole abaixo seu código DML

-- Inserção de dados na tabela `alunos`

INSERT INTO alunos (mat, nome, endereco, cidade)
VALUES
(2015010101, 'JOSE DE ALENCAR', 'RUA DAS ALMAS', 'NATAL'),
(2015010102, 'JOÃO JOSÉ', 'AVENIDA RUY CARNEIRO', 'JOÃO PESSOA'),
(2015010103, 'MARIA JOAQUINA', 'RUA CARROSSEL', 'RECIFE'),
(2015010104, 'MARIA DAS DORES', 'RUA DAS LADEIRAS', 'FORTALEZA'),
(2015010105, 'JOSUÉ CLAUDINO DOS SANTOS', 'CENTRO', 'NATAL'),
(2015010106, 'JOSUÉLISSON CLAUDINO DOS SANTOS', 'CENTRO', 'NATAL');


-- Inserção de dados na tabela `disciplinas`

INSERT INTO disciplinas (cod_disc, nome_disc, carga_horaria)
VALUES
('BD', 'BANCO DE DADOS', 100),
('POO', 'PROGRAMAÇÃO COM ACESSO A BANCO DE DADOS', 100),
('WEB', 'AUTORIA WEB', 50),
('ENG', 'ENGENHARIA DE SOFTWARE', 80);

-- Inserção de dados na tabela `professores`

INSERT INTO professores (cod_prof, nome, endereco, cidade)
VALUES
(212131, 'NICKERSON FERREIRA', 'RUA MANAÍR', 'JOÃO PESSOA'),
(122135, 'ADORILSON BEZERRA', 'AVENIDA SALGADO FILHO', 'NATAL'),
(192011, 'DIEGO OLIVEIRA', 'AVENIDA ROBERTO FREIRE', 'NATAL');

-- Inserção de dados na tabela `turmas`

INSERT INTO turmas (cod_turma, cod_disc, cod_prof, ano, horario)
VALUES
(1, 'BD', 212131, 2015, '11H-12H'),
(2, 'BD', 212131, 2015, '13H-14H'),
(1, 'POO', 192011, 2015, '08H-09H'),
(1, 'WEB', 192011, 2015, '07H-08H'),
(1, 'ENG', 122135, 2015, '10H-11H');

-- Inserção de dados na tabela `historicos`

insert into historicos(cod_hist, mat, cod_disc, cod_turma, cod_prof, ano, frequencia, nota)
values

(501, 2015010101, 'BD', 2, 212131, 2015, 95, 8),
(532, 2015010102, 'ENG', 1, 122135, 2015, 80, 5),
(543, 2015010103, 'POO', 1, 192011, 2015, 100, 9),
(555, 2015010104, 'BD', 1, 212131, 2015, 90, 7),
(567, 2015010105, 'WEB', 1, 192011, 2015, 70, 4),
(548, 2015010106, 'ENG', 1, 122135, 2015, 85, 6),
(502, 2015010101, 'WEB', 1, 192011, 2015, 60, 5),
(533, 2015010102, 'POO', 1, 192011, 2015, 94, 3),
(544, 2015010103, 'WEB', 1, 192011, 2015, 70, 6),
(556, 2015010104, 'ENG', 1, 122135, 2015, 85, 8),
(568, 2015010105, 'BD', 1, 212131, 2015, 90, 7),
(549, 2015010106, 'BD', 2, 212131, 2015, 90, 3),
(503, 2015010101, 'ENG', 1, 122135, 2015, 80, 7),
(534, 2015010102, 'WEB', 1, 192011, 2015, 70, 6),
(545, 2015010103, 'BD', 1, 212131, 2015, 90, 4),
(557, 2015010104, 'POO', 1, 192011, 2015, 83, 8),
(569, 2015010105, 'ENG', 1, 122135, 2015, 80, 4),
(550, 2015010106, 'POO', 1, 192011, 2015, 89, 8),
(504, 2015010101, 'POO', 1, 192011, 2015, 83, 6),
(535, 2015010102, 'BD', 2, 212131, 2015, 87, 5),
(546, 2015010103, 'ENG', 1, 122135, 2015, 90, 8),
(558, 2015010104, 'WEB', 1, 192011, 2015, 76, 7),
(570, 2015010105, 'POO', 1, 192011, 2015, 86, 7),
(551, 2015010106, 'WEB', 1, 192011, 2015, 60, 4);


-- Cole abaixo seu código DQL 

-- Este script retorna uma lista da MAT dos alunos com nota em BD em 2015 menor que 5.

SELECT
 h.mat AS matrícula,
 a.nome AS nome_aluno,
 h.nota AS notas_BD_menor_que_5,
 h.ano AS ano 
FROM
 historicos h
JOIN
 alunos a ON h.mat = a.mat
WHERE
 h.cod_disc = 'BD'
 AND h.ano = 2015
 AND h.nota <= 4;


-- Este script retorna uma lista da MAT e calcula a média das notas dos alunos na disciplina de POO em 2015.

SELECT
h.mat AS matrícula,
a.nome AS nome_aluno,
ROUND(AVG(h.nota), 2) AS média_das_notas_poo,
h.ano AS ano
FROM
historicos h
JOIN
alunos a ON h.mat = a.mat
WHERE
h.cod_disc = 'POO' AND
h.ano = 2015
GROUP BY
h.mat, h.ano, a.nome, h.nota
ORDER BY (h.nota) DESC;

-- Este script retorna uma lista da MAT e calcula a média das notas dos alunos na disciplina de POO em 2015 e que esta média seja superior a 6.

SELECT 
h.mat AS matrícula,
a.nome AS nome_aluno,
ROUND (AVG(h.nota), 2) AS média_superior_a_6_em_poo,
h.ano AS ano
FROM historicos h
JOIN
alunos a ON h.mat = a.mat
WHERE 
h.cod_disc = 'POO' 
AND ano = 2015
GROUP BY h.mat, a.nome, h.ano, h.nota
HAVING AVG(h.nota) > 6
ORDER BY (h.nota);

-- Este script retorna o número de alunos que não são de Natal.

SELECT COUNT(*) AS qtd_de_alunos_fora_de_natal
FROM alunos
WHERE UPPER(cidade) != 'NATAL';

