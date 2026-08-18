DROP DATABASE IF EXISTS site_viagens;
CREATE DATABASE site_viagens;
USE site_viagens;

-- =====================================================
-- 1. CRIAÇÃO DAS TABELAS
-- =====================================================

-- Tabela de Clientes
CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    data_cadastro DATE NOT NULL
);

-- Tabela de Destinos Turísticos
CREATE TABLE destino_turistico (
    id_destino INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    pais VARCHAR(100) NOT NULL,
    descricao VARCHAR(255)
);

-- Tabela de Pacotes de Viagem
CREATE TABLE pacote_viagem (
    id_pacote INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    vagas INT NOT NULL,
    id_destino INT NOT NULL,
    FOREIGN KEY (id_destino) REFERENCES destino_turistico(id_destino)
);

-- Tabela de Reservas
CREATE TABLE reserva (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    data_reserva DATE NOT NULL,
    quantidade_pessoas INT NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    status VARCHAR(30) NOT NULL,
    id_cliente INT NOT NULL,
    id_pacote INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_pacote) REFERENCES pacote_viagem(id_pacote)
);


-- =====================================================
-- 2. INSERÇÃO DE DADOS
-- =====================================================

-- Inserindo Clientes
INSERT INTO cliente (nome, email, telefone, data_cadastro) VALUES
('Ryan', 'ryan@email.com', '31999990001', '2026-01-10'),
('Cauã', 'caua@email.com', '31999990002', '2026-02-01'),
('Pedro', 'pedro@email.com', '31999990003', '2026-02-15');


-- Inserindo Destinos Turísticos
INSERT INTO destino_turistico (nome, cidade, pais, descricao) VALUES
('Rio de Janeiro', 'Rio de Janeiro', 'Brasil',
 'Destino famoso pelas praias, Cristo Redentor e Pão de Açúcar'),
('Paris', 'Paris', 'França',
 'Cidade conhecida pela Torre Eiffel, museus e gastronomia'),
('Orlando', 'Orlando', 'Estados Unidos',
 'Destino conhecido pelos parques temáticos e atrações turísticas');


-- Inserindo Pacotes de Viagem
INSERT INTO pacote_viagem
(nome, descricao, data_inicio, data_fim, preco, vagas, id_destino) VALUES
('Rio de Janeiro Completo', 'Pacote com hospedagem e passeios turísticos', '2026-07-10', '2026-07-15', 1800.00, 20, 1),
('Paris Encantadora', 'Pacote turístico com hospedagem e passeios pela cidade', '2026-08-05', '2026-08-12', 6500.00, 15, 2),
('Orlando Mágica', 'Pacote com hospedagem e visitas aos principais parques', '2026-09-10', '2026-09-18', 7200.00, 10, 3);


-- Inserindo Reservas
INSERT INTO reserva
(data_reserva, quantidade_pessoas, valor_total, status, id_cliente, id_pacote) VALUES
('2026-03-01', 2, 3600.00, 'Confirmada', 1, 1),
('2026-03-05', 1, 6500.00, 'Confirmada', 2, 2),
('2026-03-10', 2, 14400.00, 'Pendente', 3, 3);