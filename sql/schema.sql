-- Active: 1792366339166@@127.0.0.1@3306@atv_3
-- ==========================================
-- Criação do Banco de Dados
-- ==========================================
CREATE DATABASE IF NOT EXISTS atv_3
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_unicode_ci;

USE atv_3;

-- Drop das tabelas em ordem inversa de dependência (caso precise recriar)
DROP TABLE IF EXISTS vendas;
DROP TABLE IF EXISTS regioes;
DROP TABLE IF EXISTS vendedores;

-- ==========================================
-- Tabela: Vendedores
-- ==========================================
CREATE TABLE vendedores (
  id_vendedor INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  meta_mensal DECIMAL(12,2) NOT NULL CHECK (meta_mensal >= 0),
  percentual_base DECIMAL(5,2) NOT NULL CHECK (percentual_base >= 0),
  ativo BOOLEAN NOT NULL DEFAULT TRUE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- ==========================================
-- Tabela: Regiões
-- ==========================================
CREATE TABLE regioes (
  id_regiao INT AUTO_INCREMENT PRIMARY KEY,
  nome_regiao VARCHAR(50) NOT NULL UNIQUE,
  percentual_bonus DECIMAL(5,2) NOT NULL CHECK (percentual_bonus >= 0)
) ENGINE=InnoDB;

-- ==========================================
-- Tabela: Vendas
-- ==========================================
CREATE TABLE vendas (
  id_venda INT AUTO_INCREMENT PRIMARY KEY,
  id_vendedor INT NOT NULL,
  id_regiao INT NOT NULL,
  data_venda DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  valor_venda DECIMAL(12,2) NOT NULL CHECK (valor_venda > 0),
  tipo_cliente ENUM('PF', 'PJ') NOT NULL,
  valor_comissao DECIMAL(12,2) NOT NULL CHECK (valor_comissao >= 0),
  
  CONSTRAINT fk_vendas_vendedores 
    FOREIGN KEY (id_vendedor) REFERENCES vendedores(id_vendedor)
    ON DELETE RESTRICT ON UPDATE CASCADE,
    
  CONSTRAINT fk_vendas_regioes 
    FOREIGN KEY (id_regiao) REFERENCES regioes(id_regiao)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;