-- Criação das tabelas básicas
CREATE TABLE autores (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE livros (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    ano_publicacao INT,
    id_autor INT REFERENCES autores(id)
);

CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE emprestimos (
    id SERIAL PRIMARY KEY,
    id_livro INT REFERENCES livros(id),
    id_usuario INT REFERENCES usuarios(id),
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE
);

-- Inserção de dados fictícios
INSERT INTO autores (nome) VALUES ('Machado de Assis'), ('Clarice Lispector');

INSERT INTO livros (titulo, ano_publicacao, id_autor) VALUES
    ('Dom Casmurro', 1899, 1),
    ('A Hora da Estrela', 1977, 2);

INSERT INTO usuarios (nome, email) VALUES ('João Silva', 'joao@email.com'), ('Maria Souza', 'maria@email.com');

INSERT INTO emprestimos (id_livro, id_usuario, data_emprestimo) VALUES (1, 1, '2025-06-25'), (2, 2, '2025-06-28');

-- Consulta: Livros emprestados por cada usuário
SELECT u.nome AS usuario, l.titulo AS livro, e.data_emprestimo, e.data_devolucao
FROM emprestimos e
JOIN usuarios u ON e.id_usuario = u.id
JOIN livros l ON e.id_livro = l.id;

-- Atualização: Devolução de um livro
UPDATE emprestimos SET data_devolucao = '2025-07-01' WHERE id = 1;

-- Exclusão: Remover um usuário
DELETE FROM usuarios WHERE id = 2;
