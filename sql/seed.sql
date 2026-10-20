USE atv_3;

-- 1. Inserção das Regiões Obrigatórias
INSERT INTO regioes (id_regiao, nome_regiao, percentual_bonus) VALUES
(1, 'Norte', 1.00),
(2, 'Nordeste', 1.00),
(3, 'Sudeste', 0.00),
(4, 'Sul', 0.50);

-- 2. Inserção de no mínimo 5 Vendedores
INSERT INTO vendedores (nome, meta_mensal, percentual_base, ativo) VALUES
('Carlos Silva', 15000.00, 5.00, TRUE),      -- ID 1
('Ana Oliveira', 20000.00, 4.50, TRUE),      -- ID 2
('Roberto Souza', 10000.00, 6.00, TRUE),     -- ID 3
('Mariana Lima', 25000.00, 5.50, TRUE),      -- ID 4
('Fernanda Costa', 12000.00, 4.00, FALSE);    -- ID 5 (Inativo para testes)

-- 3. Inserção de no mínimo 15 Vendas (Outubro/2026)
-- Exemplo de cálculo: Carlos (5%) + Norte (1%) + PJ (3%) = 9% comissão.
-- R$ 2.000,00 * 9% = R$ 180,00.

INSERT INTO vendas (id_vendedor, id_regiao, data_venda, valor_venda, tipo_cliente, valor_comissao) VALUES
-- Carlos Silva (Meta: R$ 15.000,00)
(1, 1, '2026-10-02 10:30:00', 2000.00, 'PJ', 180.00), -- Base 5% + Norte 1% + PJ 3% = 9%
(1, 3, '2026-10-05 14:15:00', 8000.00, 'PF', 560.00), -- Base 5% + Sudeste 0% + PF 2% = 7%
(1, 1, '2026-10-12 11:00:00', 6000.00, 'PJ', 540.00), -- Base 5% + Norte 1% + PJ 3% = 9% -> Total Carlos: R$ 16.000 (Meta batida)

-- Ana Oliveira (Meta: R$ 20.000,00)
(2, 4, '2026-10-01 09:00:00', 12000.00, 'PJ', 960.00), -- Base 4.5% + Sul 0.5% + PJ 3% = 8%
(2, 4, '2026-10-10 16:20:00', 10000.00, 'PF', 700.00), -- Base 4.5% + Sul 0.5% + PF 2% = 7% -> Total Ana: R$ 22.000 (Meta batida)

-- Roberto Souza (Meta: R$ 10.000,00)
(3, 2, '2026-10-03 13:40:00', 3000.00, 'PF', 270.00), -- Base 6% + Nordeste 1% + PF 2% = 9%
(3, 2, '2026-10-08 15:00:00', 2500.00, 'PJ', 250.00), -- Base 6% + Nordeste 1% + PJ 3% = 10%
(3, 3, '2026-10-15 10:10:00', 1500.00, 'PF', 120.00), -- Base 6% + Sudeste 0% + PF 2% = 8% -> Total Roberto: R$ 7.000 (Meta NÃO batida)

-- Mariana Lima (Meta: R$ 25.000,00)
(4, 3, '2026-10-04 11:30:00', 15000.00, 'PJ', 1275.00), -- Base 5.5% + Sudeste 0% + PJ 3% = 8.5%
(4, 1, '2026-10-11 17:00:00', 5000.00, 'PF', 425.00),  -- Base 5.5% + Norte 1% + PF 2% = 8.5%
(4, 2, '2026-10-14 09:45:00', 7000.00, 'PJ', 665.00),  -- Base 5.5% + Nordeste 1% + PJ 3% = 9.5% -> Total Mariana: R$ 27.000 (Meta batida)

-- Outras vendas diversas para fechar 15 vendas
(1, 4, '2026-10-16 14:00:00', 1000.00, 'PF', 75.00),   -- Base 5% + Sul 0.5% + PF 2% = 7.5%
(2, 3, '2026-10-17 15:30:00', 3000.00, 'PJ', 225.00),  -- Base 4.5% + Sudeste 0% + PJ 3% = 7.5%
(3, 1, '2026-10-18 10:00:00', 2000.00, 'PJ', 200.00),  -- Base 6% + Norte 1% + PJ 3% = 10%
(4, 4, '2026-10-19 16:00:00', 4000.00, 'PF', 320.00);  -- Base 5.5% + Sul 0.5% + PF 2% = 8%