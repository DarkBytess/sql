CREATE TABLE livros (
	isbn varchar(15) PRIMARY KEY,
	titulo varchar(60),
	editora varchar(50),
	ano DATE
)

INSERT INTO livros (isbn, titulo, editora, ano) 
VALUES
    ('6550471656', 'Natalie Haynes', 'Olhar Petrificante: a História da Medusa','978-6556220659'),
    ('978-6587435930', 'Filhas de Esparta', '', '6587435939'),
    (' 6584956245', 'O Pequeno Príncipe', 'Editora Garnier', '978-6584956247'),
    ('9788577995779', 'Harry Potter e a Ordem da Fênix', 'Rocco', '8532530826'),
    ('978-6555111507', 'O Hobbit', 'HarperCollins', '655511150X'),
    ('978-8532530820', 'Harry Potter e o calice de fogo', 'Rocco', '8532530818');

SELECT * FROM LIVROS

CREATE TABLE autores (
	id_autor SERIAL PRIMARY KEY,
	nome_autor varchar(100)
)

INSERT INTO autores (nome_autor) 
VALUES
    ('Natalie Haynes'),
    ('George Orwell'),
    ('Claire Heywood'),
    ('Antoine de Saint-Exupéry'),
    ('J.R.R. Tolkien'),
    ('J.K. Rowling'),
    ('Miyamoto Musash');

SELECT * FROM autores

CREATE TABLE livros_autores (
	isbn varchar(15),
	FOREIGN KEY (isbn) REFERENCES livros (isbn),
	id_autor int,
	FOREIGN KEY (id_autor) REFERENCES autores (id_autor)
)

SELECT * FROM livros_autores