CREATE TABLE curso (
	id_curso SERIAL PRIMARY KEY,
	prof_responsavel varchar(50)

)

SELECT * FROM curso

INSERT INTO curso (prof_responsavel) 
VALUES
    ('Prof. Sil'),
    ('Prof. Souza'),
    ('Prof. Olivera'),
    ('Prof. Lucius'),
    ('Prof. augusto'),
    ('Prof. Parreira'),
    ('Prof. torres'),
    ('Prof. santiago'),
    ('Prof. Martins'),
    ('Prof. Gomes');

SELECT * FROM curso

CREATE TABLE aluno (
	id_aluno SERIAL PRIMARY KEY,
	cpf bigint,
	nome_aluno varchar(200),
	data_nascimento DATE

)

SELECT * FROM ALUNO

INSERT INTO aluno (cpf, nome_aluno, data_nascimento) 
VALUES
    (98765432109, 'Maria oliveira', '2000-04-12'),
    (15290203796, 'João pereira', '1997-12-09'),
    (34567890123, 'zezinho do pneu', '2000-06-23'),
    (27400716808, 'allan Santos', '2004-03-06'),
    (85183528357, 'julia Ferreira', '2013-06-31'),
    (35753725430, 'Lucas moura', '2008-08-08'),
    (08522437408, 'Juliana Lima', '2004-08-25'),
    (54605934090, 'Mateus Oliveier', '2003-03-10'),
    (65063601278, 'Laura Parreira', '2002-04-02'),
    (54210730092, 'Gabriel nandes', '2001-12-12');


CREATE TABLE turma (
	id_curso int,
	FOREIGN KEY (id_curso) REFERENCES curso (id_curso),
	id_aluno int,
	FOREIGN KEY (id_aluno) REFERENCES aluno (id_aluno),
	id_turma SERIAL PRIMARY KEY
	
)

