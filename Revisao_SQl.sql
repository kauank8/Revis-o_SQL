Create DataBase Revisao_SQL
Go
Use Revisao_SQL
Go

Create Table Aluno (
ra int not null,
nome varchar(100) not null,
idade int not null Check(idade>0),
Primary Key(ra)
)
Go
Create Table Disciplina(
codigo int not null,
nome varchar(80) not null,
carga_horaria int not null Check (carga_horaria >= 32),
Primary Key(codigo)
)
Go
Create Table Titulacao(
codigo int not null,
titulo varchar(40) not null,
Primary Key(codigo)
)
Go
Create Table Professor(
registro int not null,
nome varchar(100) not null,
codigo_titulacao int not null,
Primary Key(registro),
Foreign key (codigo_titulacao) References Titulacao(codigo)
)
Go
Create Table Curso(
codigo int not null,
nome varchar(50) not null,
area varchar(100) not null
Primary Key(codigo)
)
Go
Create table Aluno_Disciplina(
aluno_ra int not null,
disciplina_codigo int not null,
Primary key (aluno_ra, disciplina_codigo),
Foreign key (aluno_ra) References Aluno(ra),
Foreign key (disciplina_codigo) References Disciplina(codigo)
)
Go
Create table Curso_Disciplina(
curso_codigo int not null,
disciplina_codigo int not null,
Primary key(curso_codigo, disciplina_codigo),
Foreign key(curso_codigo) References Curso(codigo),
Foreign key(disciplina_codigo) References Disciplina(codigo)
)
Go
Create table Disciplina_Professor(
disciplina_codigo int not null,
professor_registro int not null,
Primary key(disciplina_codigo, professor_registro),
Foreign key(disciplina_codigo) References Disciplina(codigo),
Foreign key(professor_registro) References Professor(registro)
)

Insert into Aluno Values
(3416, 'DIEGO PIOVESAN DE RAMOS', 18),
(3423, 'LEONARDO MAGALHÃES DA ROSA', 17),
(3434, 'LUIZA CRISTINA DE LIMA MARTINELI', 20),
(3440, 'IVO ANDRÉ FIGUEIRA DA SILVA', 25),
(3443, 'BRUNA LUISA SIMIONI', 37),
(3448, 'THAÍS NICOLINI DE MELLO', 17),
(3457, 'LÚCIO DANIEL TÂMARA ALVES', 29),
(3459, 'LEONARDO RODRIGUES', 25),
(3465, 'ÉDERSON RAFAEL VIEIRA', 19),
(3466, 'DAIANA ZANROSSO DE OLIVEIRA', 21),
(3467, 'DANIELA MAURER', 23),
(3470, 'ALEX SALVADORI PALUDO', 42),
(3471, 'VINÍCIUS SCHVARTZ', 19),
(3472, 'MARIANA CHIES ZAMPIERI', 18),
(3482, 'EDUARDO CAINAN GAVSKI', 19),
(3483, 'REDNALDO ORTIZ DONEDA', 20),
(3499, 'MAYELEN ZAMPIERON', 22)
Go
INSERT INTO Disciplina
VALUES
(1, 'Laboratório de Banco de Dados', 80),
(2, 'Laboratório de Engenharia de Software', 80),
(3, 'Programação Linear e Aplicações', 80),
(4, 'Redes de Computadores', 80),
(5, 'Segurança da informação', 40),
(6, 'Teste de Software', 80),
(7, 'Custos e Tarifas Logísticas', 80),
(8, 'Gestão de Estoques', 40),
(9, 'Fundamentos de Marketing', 40),
(10, 'Métodos Quantitativos de Gestão', 80),
(11, 'Gestão do Tráfego Urbano', 80),
(12, 'Sistemas de Movimentação e Transporte', 40);
Go
INSERT INTO Titulacao 
VALUES
(1, 'Especialista'),
(2, 'Mestre'),
(3, 'Doutor');
Go
INSERT INTO Professor
VALUES
(1111, 'Leandro', 2),
(1112, 'Antonio', 2),
(1113, 'Alexandre', 3),
(1114, 'Wellington', 2),
(1115, 'Luciano', 1),
(1116, 'Edson', 2),
(1117, 'Ana', 2),
(1118, 'Alfredo', 1),
(1119, 'Celio', 2),
(1120, 'Dewar', 3),
(1121, 'Julio', 1);
Go
INSERT INTO Curso
VALUES
(1, 'ADS', 'Ciências da Computação'),
(2, 'Logística', 'Engenharia Civil');
Go
INSERT INTO Aluno_Disciplina (disciplina_codigo, aluno_ra)
VALUES
(1, 3416),
(4, 3416),
(1, 3423),
(2, 3423),
(5, 3423),
(6, 3423),
(2, 3434),
(5, 3434),
(6, 3434),
(1, 3440),
(5, 3443),
(6, 3443),
(4, 3448),
(5, 3448),
(6, 3448),
(2, 3457),
(4, 3457),
(5, 3457),
(6, 3457),
(1, 3459),
(6, 3459),
(7, 3465),
(11, 3465),
(8, 3466),
(11, 3466),
(8, 3467),
(12, 3467),
(8, 3470),
(9, 3470),
(11, 3470),
(12, 3470),
(7, 3471),
(7, 3472),
(12, 3472),
(9, 3482),
(11, 3482),
(8, 3483),
(11, 3483),
(12, 3483),
(8, 3499);
Go
INSERT INTO Disciplina_Professor 
VALUES
(1, 1111),
(2, 1112),
(3, 1113),
(4, 1114),
(5, 1115),
(6, 1116),
(7, 1117),
(8, 1118),
(9, 1117),
(10, 1119),
(11, 1120),
(12, 1121);
Go
INSERT INTO Curso_Disciplina (disciplina_codigo, curso_codigo)
VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2);

-- Selects

Select d.nome as nome_disciplina, p.nome as nome_professor 
from Professor p, Disciplina d, Disciplina_Professor dp
Where p.registro = dp.professor_registro
And   dp.disciplina_codigo = d.codigo

Select c.nome 
from Curso c, Disciplina d, Curso_Disciplina cd
where c.codigo = cd.curso_codigo
and	  d.codigo = cd.disciplina_codigo
and	  d.nome Like '%Laboratório%'

Select c.area 
from Curso c, Disciplina d, Curso_Disciplina cd
where c.codigo = cd.curso_codigo
and	  d.codigo = cd.disciplina_codigo
and   d.nome Like '%Laboratório%'

Select t.titulo 
from Professor p, Disciplina d, Titulacao t, Disciplina_Professor dp
where p.codigo_titulacao = t.codigo
and	  d.codigo = dp.disciplina_codigo
and	  p.registro = dp.professor_registro
and	  d.nome Like '%Laboratório%'	

Select d.nome as nome_disciplina, COUNT(a.ra) as qtd_alunos
from Disciplina d, Aluno a, Aluno_Disciplina ad
where d.codigo = ad.disciplina_codigo
and   a.ra = ad.aluno_ra
Group by d.nome

Select p.nome 
from Professor p, Disciplina d, Disciplina_Professor dp, Aluno a, Aluno_Disciplina ad
where a.ra = ad.aluno_ra
and	  d.codigo = ad.disciplina_codigo
and	  p.registro = dp.professor_registro
and   d.codigo = dp.disciplina_codigo
Group By p.nome
Having COUNT(a.ra) > 5

Select c.nome, COUNT(p.registro) as qtd 
from Curso c, Disciplina d, Curso_Disciplina cd, Professor p, Disciplina_Professor dp
where c.codigo = cd.curso_codigo
and	  d.codigo = cd.disciplina_codigo
and   p.registro = dp.professor_registro
and   d.codigo = dp.disciplina_codigo
Group by c.nome