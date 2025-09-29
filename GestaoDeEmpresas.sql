-- Entregas em andamento com cliente e veiculo
SELECT e.entregas_id, c.nome, v.modelo, e.status
FROM entregas e
JOIN clientes c ON e.clientes_id = c.clientes_id
JOIN veiculos v ON e.veiculos_id = v.veiculos_id
WHERE e.status = 'em andamento';

-- Ranking clientes
SELECT c.nome, COUNT(*) AS total
FROM clientes c
JOIN entregas e ON c.clientes_id = e.clientes_id
GROUP BY c.nome
ORDER BY total DESC;

-- motoristas atrasos
SELECT 
    m.nome,
    COUNT(*) AS atrasos
FROM motoristas m
JOIN veiculos v ON v.motoristas_id = m.motoristas_id
JOIN entregas e ON e.veiculos_id = v.veiculos_id
WHERE v.status = 'Ativo' 
  AND e.entrega_real > e.previsao
GROUP BY m.nome
ORDER BY atrasos DESC;



-- veiculos mais usados sm
SELECT v.modelo, COUNT(*) AS total
FROM veiculos v
JOIN entregas e ON v.veiculos_id = e.veiculos_id
WHERE e.data_saida BETWEEN '2025-01-01' AND '2025-06-30'
GROUP BY v.modelo
ORDER BY total DESC;

-- rotas cm mais ocorrencias
SELECT r.origem, r.destino, COUNT(*) AS ocorrencias
FROM rotas r
JOIN entregas e ON r.rotas_id = e.rotas_id
JOIN ocorrencia o ON e.entregas_id = o.entregas_id
GROUP BY r.origem, r.destino
ORDER BY ocorrencias DESC;

-- clientes inadimplentes
SELECT c.nome, SUM(p.valor) AS devido
FROM clientes c
JOIN pagamentos p ON c.clientes_id = p.clientes_id
WHERE p.status = 'Nao concluido'
GROUP BY c.nome;

-- media de dstancia por v
SELECT v.modelo, AVG(r.distancia) AS media
FROM veiculos v
JOIN entregas e ON v.veiculos_id = e.veiculos_id
JOIN rotas r ON e.rotas_id = r.rotas_id
GROUP BY v.modelo;

-- funcionarios que mais registraram entregas
SELECT f.nome, COUNT(e.entregas_id) AS total
FROM funcionarios_ADM f
JOIN entregas e ON f.funcionarios_ADM = e.entregas_id
GROUP BY f.nome
ORDER BY total DESC;

-- entregas concluidas por cliente
SELECT c.nome, COUNT(*) AS total
FROM clientes c
JOIN entregas e ON c.clientes_id = e.clientes_id
WHERE e.status = 'concluída'
GROUP BY c.nome;

-- valor total pagfo por cliente
SELECT c.nome, SUM(p.valor) AS total_pago
FROM clientes c
JOIN pagamentos p ON c.clientes_id = p.clientes_id
WHERE p.status = 'Concluido'
GROUP BY c.nome;

-- prazo medio por rota
SELECT r.origem, r.destino, AVG(DATEDIFF(e.entrega_real, e.data_saida)) AS media_dias
FROM rotas r
JOIN entregas e ON r.rotas_id = e.rotas_id
WHERE e.status = 'concluída'
GROUP BY r.origem, r.destino;

-- clientes com mais ocorrencias
SELECT c.nome, COUNT(*) AS total
FROM clientes c
JOIN entregas e ON c.clientes_id = e.clientes_id
JOIN ocorrencia o ON e.entregas_id = o.entregas_id
GROUP BY c.nome
ORDER BY total DESC;

-- entregas atrasadas no mes atual
SELECT e.entregas_id, c.nome, e.previsao, e.entrega_real
FROM entregas e
JOIN clientes c ON e.clientes_id = c.clientes_id
WHERE MONTH(e.previsao) = MONTH(CURDATE())
AND e.entrega_real > e.previsao;

-- veiculos suspensos com entrewgas 
SELECT v.modelo, COUNT(*) AS total
FROM veiculos v
JOIN entregas e ON v.veiculos_id = e.veiculos_id
WHERE v.status = 'Suspenso'
GROUP BY v.modelo;

-- rotas mais longas
SELECT origem, destino, distancia
FROM rotas
ORDER BY distancia DESC
LIMIT 5;

-- valor medio por forma de pagamento
SELECT forma, AVG(valor) AS media
FROM pagamentos
WHERE status = 'Concluido'
GROUP BY forma;

-- ranking de motoristas por entregas
SELECT m.nome, COUNT(*) AS total
FROM motoristas m
JOIN veiculos v ON v.veiculos_id = v.veiculos_id
JOIN entregas e ON v.veiculos_id = e.veiculos_id
GROUP BY m.nome
ORDER BY total DESC;

-- entregas sem ocorrencias
SELECT e.entregas_id, c.nome
FROM entregas e
JOIN clientes c ON e.clientes_id = c.clientes_id
LEFT JOIN ocorrencia o ON e.entregas_id = o.entregas_id
WHERE o.ocorrencia_id IS NULL;

-- receita total
SELECT SUM(valor) AS receita
FROM pagamentos
WHERE status = 'Concluido';