# Relatório do Projeto: Sistema de Gestão de Farmácia

## Introdução
Este documento apresenta um relatório detalhado sobre o projeto de um **Sistema de Gestão de Farmácia**, concebido como um desafio para criar um sistema de banco de dados abrangente e funcional. O objetivo principal foi desenvolver uma solução de software para gerenciar as operações de uma farmácia, incluindo controle de medicamentos, gestão de estoque, vendas, clientes e diversas outras entidades essenciais. O projeto foi idealizado e executado por **Kauã Thierry**.

---

## Objetivos e Escopo
O projeto foi estruturado com os seguintes objetivos:
* **Modelagem de Dados:** Criar um banco de dados relacional que represente com precisão a estrutura e as relações de dados de uma farmácia real.
* **Análise de Negócios:** Desenvolver consultas SQL estratégicas para gerar *insights* valiosos, apoiando a tomada de decisões e a gestão do negócio.
* **Otimização e Desempenho:** Implementar índices e realizar alterações nas tabelas para melhorar a performance das operações do banco de dados.
* **Simulação de Dados:** Popular o banco de dados com dados simulados, porém realistas, para validação do sistema e das consultas.

---

## Estrutura e Entidades do Banco de Dados
A arquitetura do banco de dados foi projetada para cobrir todas as operações-chave de uma farmácia. As entidades principais do modelo relacional são:
* **Medicamentos:** Registra informações como nome, princípio ativo, tipo, validade e preço.
* **Fornecedores:** Contém dados de identificação e contato dos fornecedores.
* **Estoque:** Gerencia o inventário, com detalhes sobre a quantidade, lote e validade de cada medicamento.
* **Clientes:** Armazena dados pessoais dos clientes.
* **Receitas Médicas:** Vincula clientes, médicos e medicamentos, com informações de validade e emissão.
* **Vendas:** Detalha cada transação, incluindo cliente, funcionário e valor total.
* **Itens_Venda:** Associa medicamentos a vendas específicas, registrando quantidade e preço unitário.
* **Pagamentos:** Controla as formas e status de pagamento das vendas.
* **Funcionários:** Registra dados dos colaboradores da farmácia.
* **Médicos:** Armazena informações de identificação e especialidade dos médicos.

---

## Consultas e Análises Estratégicas
Foram desenvolvidas vinte consultas SQL, visando extrair informações críticas para a gestão da farmácia. As consultas implementadas incluem:
1.  **Vencimento de Medicamentos:** Lista medicamentos com validade próxima ($<30$ dias).
2.  **Ranking de Vendas:** Identifica os 10 medicamentos mais vendidos.
3.  **Análise de Clientes:** Aponta clientes que mais adquiriram medicamentos controlados.
4.  **Desempenho de Vendas:** Calcula o total de vendas por período (diário, semanal, mensal) e por forma de pagamento.
5.  **Controle de Estoque:** Relata itens com quantidade abaixo do limite mínimo.
6.  **Análise de Prescrições:** Classifica os médicos que mais emitiram receitas.
7.  **Desempenho de Funcionários:** Avalia os funcionários com maior número de vendas realizadas.
8.  **Vendas por Fornecedor:** Calcula o valor total de vendas de produtos de cada fornecedor.
9.  **Análise de Compras:** Lista clientes com histórico de compras de alto valor.

---

## Otimizações e Melhorias
Para otimizar o desempenho do sistema, foram implementadas as seguintes melhorias:
* **Criação de Índices:** Índices foram criados em colunas frequentemente usadas em consultas (`nome` de medicamento, `CPF` de cliente, `CRM` de médico) para acelerar a busca e recuperação de dados.
* **Alterações em Tabelas:** A tabela `Vendas` foi modificada para incluir um campo `origem`, permitindo rastrear se a transação foi **presencial** ou **online**.

---

## Estrutura do Repositório e Execução
O projeto é organizado em um repositório (`farmacia-db`) com os seguintes scripts SQL:
* `create_tables.sql`: Define a estrutura do banco de dados e suas tabelas.
* `insert_data.sql`: Popula as tabelas com mais de 50 registros simulados.
* `alterations.sql`: Contém as instruções para a criação de índices e alterações de tabelas.
* `queries.sql`: Apresenta as 20 consultas estratégicas implementadas.

Para a execução do projeto, basta clonar o repositório e executar os scripts em um banco de dados **MySQL** ou **MariaDB** na ordem especificada (`create_tables.sql`, `insert_data.sql`, `alterations.sql`, `queries.sql`).

---

## Conclusão
Este projeto demonstra a aplicação prática de conceitos de **modelagem de banco de dados** e **SQL** para criar uma solução robusta e escalável para a gestão de uma farmácia. As consultas estratégicas e as otimizações implementadas validam a capacidade do sistema de fornecer informações gerenciais essenciais, atendendo às necessidades do negócio e reforçando a importância da estrutura de dados para operações eficientes.

A informação sobre o desenvolvedor, Kauã Thierry, está na introdução do relatório, onde é mencionado que "O projeto foi idealizado e executado por Kauã Thierry."