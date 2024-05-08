-- Função para verificar se uma tabela existe
CREATE FUNCTION dbo.TableExists (@TableName NVARCHAR(128))
RETURNS BIT
AS
BEGIN
    RETURN (
        SELECT CASE WHEN EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = @TableName)
                    THEN 1
                    ELSE 0
               END
    );
END;
GO

-- Criação das Tabelas
IF NOT dbo.TableExists('Contato')
BEGIN
    CREATE TABLE Contato (
        idContato INT PRIMARY KEY,
        Telefone VARCHAR(20),
        Celular VARCHAR(20),
        Email VARCHAR(100)
    );
    PRINT 'Tabela Contato criada com sucesso.';
END
ELSE
BEGIN
    PRINT 'A tabela Contato já existe.';
END;

IF NOT dbo.TableExists('Endereco')
BEGIN
    CREATE TABLE Endereco (
        idEndereco INT PRIMARY KEY,
        Cidade VARCHAR(100),
        Rua VARCHAR(100),
        Email VARCHAR(100)
    );
    PRINT 'Tabela Endereco criada com sucesso.';
END
ELSE
BEGIN
    PRINT 'A tabela Endereco já existe.';
END;

IF NOT dbo.TableExists('EnderecoContato')
BEGIN
    CREATE TABLE EnderecoContato (
        idContato INT,
        idEndereco INT,
        PRIMARY KEY (idContato, idEndereco),
        FOREIGN KEY (idContato) REFERENCES Contato(idContato),
        FOREIGN KEY (idEndereco) REFERENCES Endereco(idEndereco)
    );
    PRINT 'Tabela EnderecoContato criada com sucesso.';
END
ELSE
BEGIN
    PRINT 'A tabela EnderecoContato já existe.';
END;

-- Restante das tabelas segue o mesmo padrão...

-- Consultas
-- Exemplo de consulta: Dado o RA ou o Nome do Aluno, buscar no BD todos os demais dados do aluno.
SELECT * FROM Pessoa WHERE nome = 'Nome do Aluno' OR RA = 'RA do Aluno';

-- Exemplo de consulta: Dado o nome de um departamento, exibir o nome de todos os cursos associados a ele.
SELECT nomeCurso FROM Curso WHERE NomeDepartamento = 'Nome do Departamento';

-- Exemplo de consulta: Dado o nome de uma disciplina, exibir a qual ou quais cursos ela pertence.
SELECT nomeCurso FROM DisciplinaCurso WHERE idDisciplina = (SELECT idDisciplina FROM Disciplina WHERE nomeDisciplina = 'Nome da Disciplina');

-- Exemplo de consulta: Dado o CPF de um aluno, exibir quais disciplinas ele está cursando.
SELECT nomeDisciplina FROM Disciplina WHERE idDisciplina IN (SELECT idDisciplina FROM DisciplinaCurso WHERE nomeCurso IN (SELECT nomeCurso FROM Curso WHERE idPessoa = (SELECT idPessoa FROM Pessoa WHERE cpf = 'CPF do Aluno')));

-- Restante das consultas segue o mesmo padrão...
