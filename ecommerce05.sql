START TRANSACTION;

-- Passo 1: Inserir um novo pedido
INSERT INTO pedidos (id, cliente_id, data_pedido, status, total)
VALUES (31, 1, NOW(), 'Pago', 360.00);

-- Passo 2: Inserir os itens do pedido
INSERT INTO itens_pedido (id, pedido_id, produto_id, quantidade, preco_unitario)
VALUES (31, 31, 1, 2, 180.00);

-- Passo 3: Atualizar o estoque do produto
UPDATE produtos
SET estoque = estoque - 2
WHERE id = 1;

-- Confirma todas as alterações
COMMIT;

START TRANSACTION;

-- Passo 1: Atualizar o status do pedido para 'Cancelado'
UPDATE pedidos
SET status = 'Cancelado'
WHERE id = 31;

-- Passo 2: Repor o estoque do produto
UPDATE produtos
SET estoque = estoque + 2
WHERE id = 1;

-- Confirma todas as alterações
COMMIT;


START TRANSACTION;

-- Passo 1: Atualizar o preço dos produtos da categoria 1
UPDATE produtos
SET preco = 900.00
WHERE categoria_id = 1;

-- Passo 2: Verificar as alterações (opcional, apenas para demonstração)
SELECT nome, preco FROM produtos WHERE categoria_id = 1;

-- Passo 3: Reverter todas as alterações
ROLLBACK;

-- Passo 4: Verificar se as alterações foram desfeitas (opcional)
SELECT nome, preco FROM produtos WHERE categoria_id = 1;

use ecommerce;

CREATE VIEW V_pedidos_detalhados AS
SELECT 
    u.nome AS cliente,
    p.id AS pedido_id,
    p.data_pedido,
    p.status,
    p.total,
    pr.nome AS produto,
    ip.quantidade,
    ip.preco_unitario
FROM pedidos p
JOIN usuarios u ON p.cliente_id = u.id
JOIN itens_pedido ip ON p.id = ip.pedido_id
JOIN produtos pr ON ip.produto_id = pr.id;

CREATE VIEW V_clientes_sem_senha AS
SELECT id, nome, email, celular, criado_em 
FROM usuarios;

CREATE VIEW V_resumo_estoque_baixo AS
SELECT 
    p.nome AS produto,
    p.estoque,
    c.nome AS categoria
FROM produtos p
JOIN categorias c ON p.categoria_id = c.id
WHERE p.estoque < 20;

SELECT * FROM V_pedidos_detalhados;
SELECT * FROM V_clientes_sem_senha;
SELECT * FROM V_resumo_estoque_baixo;
