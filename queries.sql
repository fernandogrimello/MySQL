-- Lista de medicamentos prestes a vencer (<30 dias) com quantidade em estoque
SELECT m.nome, e.quantidade, e.validade_lt
FROM medicamentos m
JOIN estoque e ON m.med_id = e.med_id
WHERE e.validade_lt <= CURDATE() + INTERVAL 30 DAY;

-- Ranking dos 10 medicamentos mais vendidos por quantidade
SELECT m.nome, SUM(i.quantidade) AS total_vendido
FROM itensVendas i
JOIN medicamentos m ON i.med_id = m.med_id
GROUP BY m.nome
ORDER BY total_vendido DESC
LIMIT 10;

-- Medicamentos prescritos com mais de 12 meses de validade
SELECT m.nome, rm.data_emissao, rm.validade_receita
FROM receitas_medicas rm
JOIN medicamentos m ON rm.med_id = m.med_id
WHERE DATEDIFF(rm.validade_receita, rm.data_emissao) > 365;

-- Total de vendas por dia
SELECT data_venda, SUM(valor_total) AS total_diario
FROM vendas
GROUP BY data_venda;

-- Total de vendas por semana
SELECT YEAR(data_venda) AS ano, WEEK(data_venda) AS semana, SUM(valor_total) AS total_semanal
FROM vendas
GROUP BY ano, semana;

-- Total de vendas por mes
SELECT YEAR(data_venda) AS ano, MONTH(data_venda) AS mes, SUM(valor_total) AS total_mensal
FROM vendas
GROUP BY ano, mes;

-- Total de vendas por forma de pagament0
SELECT forma, SUM(valor_total) AS total_forma
FROM pagamentos p
JOIN vendas v ON p.vendas_id = v.vendas_id
WHERE p.status = 'pago'
GROUP BY forma;

-- Media de preço de medicamentos por tipo
SELECT tipo, AVG(preco) AS preco_medio
FROM medicamentos
GROUP BY tipo;

-- Medicos que mais prescreveram receitas
SELECT med.nome, COUNT(r.receitasMed_id) AS total_prescricoes
FROM medicos med
JOIN receitas_medicas r ON r.med_id = med.CRM_medico
GROUP BY med.nome
ORDER BY total_prescricoes DESC;

-- Funcionarios que estão no turno da manha e tarde
SELECT nome
FROM funcionarios
WHERE turno IN ('Manhã', 'Tarde');

-- Lista de clientes com compras de alto valor (>50)
SELECT c.nome, SUM(v.valor_total) AS total_compras
FROM clientes c
JOIN vendas v ON c.cpf = v.cpf
GROUP BY c.nome
HAVING total_compras > 50;

-- Media de medicamentos por receita
SELECT AVG(itens_por_receita) AS media_meds_por_receita
FROM (
    SELECT COUNT(med_id) AS itens_por_receita
    FROM receitas_medicas
    GROUP BY receitasMed_id
) AS sub;

-- Medicamentos sem vendas
SELECT m.nome
FROM medicamentos m
LEFT JOIN itensVendas i ON m.med_id = i.med_id
WHERE i.med_id IS NULL;

-- Clientes que nunca compraram
SELECT c.nome
FROM clientes c
LEFT JOIN vendas v ON c.cpf = v.cpf
WHERE v.vendas_id IS NULL;

-- Total de vendas por cliente
SELECT c.nome, SUM(v.valor_total) AS total_compras
FROM clientes c
JOIN vendas v ON c.cpf = v.cpf
GROUP BY c.nome;

-- Medicamentos com estoque total
SELECT m.nome, SUM(e.quantidade) AS total_estoque
FROM medicamentos m
JOIN estoque e ON m.med_id = e.med_id
GROUP BY m.nome;

-- Receita total por período (mensal)
SELECT YEAR(data_emissao) AS ano, MONTH(data_emissao) AS mes, COUNT(*) AS total_receitas
FROM receitas_medicas
GROUP BY ano, mes;

-- Produtos vendidos mais caros
SELECT m.nome, MAX(i.valor_unitario) AS maior_preco
FROM itensVendas i
JOIN medicamentos m ON i.med_id = m.med_id
GROUP BY m.nome
ORDER BY maior_preco DESC;

-- Medicos e quantidade de clientes diferentes que prescreveram
SELECT m.nome, COUNT(DISTINCT r.cpf) AS total_clientes
FROM medicos m
JOIN receitas_medicas r ON r.med_id = m.CRM_medico
GROUP BY m.nome;

-- Medicamentos com validade de lote diferente da validade do produto
SELECT m.nome, m.validade AS validade_produto, e.validade_lt AS validade_lote
FROM medicamentos m
JOIN estoque e ON m.med_id = e.med_id
WHERE m.validade <> e.validade_lt;