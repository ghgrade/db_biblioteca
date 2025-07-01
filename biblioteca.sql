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

-- Inserção de dados fictícios (autores)
INSERT INTO autores (nome) VALUES 
    ('Machado de Assis'), 
    ('Clarice Lispector'),
    ('J. K. Rowling'),
    ('George Orwell'),
    ('Paulo Coelho');

-- Inserção de dados fictícios (livros)
INSERT INTO livros (titulo, ano_publicacao, id_autor) VALUES
    ('Dom Casmurro', 1899, 1),
    ('Memórias Póstumas de Brás Cubas', 1881, 1),
    ('A Hora da Estrela', 1977, 2),
    ('Perto do Coração Selvagem', 1943, 2),
    ('Harry Potter e a Pedra Filosofal', 1997, 3),
    ('Harry Potter e a Câmara Secreta', 1998, 3),
    ('1984', 1949, 4),
    ('O Alquimista', 1988, 5),
    ('Brida', 1990, 5);

-- Inserção de dados fictícios (usuários)
INSERT INTO usuarios (nome, email) VALUES 
    ('João Silva', 'joao@email.com'),
    ('Maria Souza', 'maria@email.com'),
    ('Carlos Pereira', 'carlos@email.com'),
    ('Ana Lima', 'ana@email.com'),
    ('Fernanda Torres', 'fernanda@email.com');

-- Inserção de dados fictícios (empréstimos)
INSERT INTO emprestimos (id_livro, id_usuario, data_emprestimo, data_devolucao) VALUES 
    (1, 1, '2025-06-25', '2025-07-01'),
    (7, 4, '2025-06-20', '2025-06-27'),
    (6, 5, '2025-06-15', '2025-06-22'),
    (4, 3, '2025-06-21', '2025-06-29'));

-- Consulta: Livros emprestados por cada usuário
SELECT u.nome AS usuario, l.titulo AS livro, e.data_emprestimo, e.data_devolucao
FROM emprestimos e
JOIN usuarios u ON e.id_usuario = u.id
JOIN livros l ON e.id_livro = l.id;

-- Atualização: Devolução de um livro
UPDATE emprestimos SET data_devolucao = '2025-07-02' WHERE id = 3;

-- Exclusão: Remover um usuário
DELETE FROM usuarios WHERE id = 2;
