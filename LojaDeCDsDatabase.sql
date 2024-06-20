CREATE DATABASE loja_de_cds;

USE loja_de_cds;

-- Tabela de Clientes
CREATE TABLE clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nome_completo_cliente VARCHAR(90),
    email VARCHAR(100) UNIQUE,
    telefone VARCHAR(20),
    endereco VARCHAR(130),
    cidade VARCHAR(50),
    estado VARCHAR(50),
    cep VARCHAR(10)
);

-- Tabela de Funcionários
CREATE TABLE funcionarios (
    funcionario_id INT AUTO_INCREMENT PRIMARY KEY,
    nome_completo_funcionario VARCHAR(90),
    email VARCHAR(100) UNIQUE,
    telefone VARCHAR(20),
    cargo VARCHAR(50),
    data_contratacao DATE
);

-- Tabela de CDs
CREATE TABLE cds (
    cd_id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100),
    artista VARCHAR(100),
    genero VARCHAR(50),
    data_lancamento DATE,
    preco DECIMAL(10, 2),
    quantidade_estoque INT
);

-- Tabela de Compras
CREATE TABLE compras (
    compra_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    funcionario_id INT,
    data_compra DATE,
    valor_total DECIMAL(10, 2),
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
    FOREIGN KEY (funcionario_id) REFERENCES funcionarios(funcionario_id)
);

-- Tabela de Detalhes das Compras
CREATE TABLE detalhes_compras (
    detalhe_compra_id INT AUTO_INCREMENT PRIMARY KEY,
    compra_id INT,
    cd_id INT,
    quantidade INT,
    preco DECIMAL(10, 2),
    FOREIGN KEY (compra_id) REFERENCES compras(compra_id),
    FOREIGN KEY (cd_id) REFERENCES cds(cd_id)
);
