-- CRIAR TABELA
CREATE TABLE produtos (
     id SERIAL PRIMARY KEY,
	 nome VARCHAR(100),
	 preco NUMERIC(10, 2)
);

CREATE TABLE vendas (
    id SERIAL PRIMARY KEY,
	produto_id INT REFERENCES produtos(id),
		quantidade INT,
		data_venda TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

BEGIN;

INSERT INTO produtos (nome, preco) VALUES ('Produto A', 10.00);
INSERT INTO produtos (nome, preco) VALUES ('Produto B', 20.00);
INSERT INTO vendas (produto_id, quantidade) VALUES (4, 3);

SELECT * FROM PRODUTOS
SELECT * FROM VENDAS


ROLLBACK;


COMMIT