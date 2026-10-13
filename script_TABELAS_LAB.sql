CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
	nome VARCHAR(100),
	email VARCHAR(100) UNIQUE,
	idade INT,
	data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
	cliente_id INT REFERENCES clientes(id),
	data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	total NUMERIC(10, 2)
);

CREATE TABLE regiao(
    id INT PRIMARY KEY,
	   nome VARCHAR(30))


INSERT INTO clientes (nome, email, idade) VALUES
('João Silva', 'joao.silva@example.com', 30),
('Maria Souza', 'maria.souza@example.com', 25)

INSERT INTO clientes (nome, email, idade) VALUES
('Carlos Pereira', 'carlos.pereira@example.com', 40);

SELECT * FROM CLIENTES

INSERT INTO pedidos (cliente_id, total) VALUES
(1, 150.00),
(1, 200.00),
(2, 300.00);

SELECT * FROM PEDIDOS;

INSERT INTO regiao VALUES
(1, 'Norte'),
(2, 'Sul');

SELECT * FROM REGIAO;


SELECT * FROM CLIENTES
ALTER TABLE clientes ADD COLUMN endereco VARCHAR(200);
INSERT INTO CLIENTES (NOME, IDADE) VALUES ('CLIENTE NOVO1', 67);
INSERT INTO CLIENTES (NOME, IDADE) VALUES ('CLIENTE NOVO2', NULL)
ALTER TABLE CLIENTES RENAME COLUMN endereco TO endereco_residencial;
ALTER TABLE CLIENTES ADD COLUMN idreg integer references regiao
UPDATE CLIENTES SET idreg = 1;


DELETE FROM CLIENTES WHERE id IN (3, 4);

UPDATE CLIENTES
SET id = 3
WHERE id = 5;
SELECT setval(pg_get_serial_sequence('clientes', 'id'), (SELECT MAX(id) FROM clientes));
SELECT * FROM clientes ORDER BY id;

INSERT INTO clientes (nome, email, idade) VALUES
('Ana Lima', 'ana.lima@example.com', 28)
RETURNING id;

UPDATE clientes SET idade = idade + 1 WHERE idade < 30;




CREATE TABLE TABTRANS
( C1 INTEGER,
  C2 VARCHAR(10));

SELECT * FROM tabtrans

--Inicia a transacao
begin
INSERT INTO TABTRANS VALUES (1, 'A');
INSERT INTO TABTRANS VALUES (2, 'B');

delete from tabtrans

--Cria o ponto de salvamento 'meu_ponto'
savepoint c 

INSERT INTO TABTRANS VALUES (3, 'C');
INSERT INTO TABTRANS VALUES (4, 'D');

UPDATE TABTRANS SET C2 = 'F' WHERE C1 IN (1,2)

ROLLBACK TO SAVEPOINT a

commit


BEGIN
INSERT INTO TABTRANS VALUES (3, 'C');
INSERT INTO TABTRANS VALUES (4, 'D');
INSERT INTO TABTRANS VALUES (5, 'E');
INSERT INTO TABTRANS VALUES (6, 'F');










