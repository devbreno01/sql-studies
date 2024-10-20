CREATE DATABASE infocraft; 

USE infocraft; 
CREATE TABLE pessoa(
	id INT NOT NULL AUTO_INCREMENT, 
    nome VARCHAR(100), 
    tipo ENUM('FISICA', 'JURIDICA'),
    email VARCHAR(100), 
    
    PRIMARY KEY(id)
);
CREATE TABLE pessoa_fisica(
	id INT NOT NULL, 
    cpf VARCHAR(11), 
    data_nascimento DATE, 
    PRIMARY KEY(id), 
    FOREIGN KEY(id) REFERENCES pessoa(id)
);

CREATE TABLE pessoa_juridica(
	id INT NOT NULL , 
    cnpj VARCHAR(14), 
    razao_social VARCHAR(100), 
    PRIMARY KEY(id), 
    FOREIGN KEY(id) REFERENCES pessoa(id)
);
ALTER TABLE pessoa_fisica ADD UNIQUE (cpf);
ALTER TABLE pessoa_juridica ADD UNIQUE (cnpj);

CREATE TABLE pessoa_telefone(
	id INT NOT NULL AUTO_INCREMENT, 
    pessoa_id INT, 
    telefone VARCHAR(15), 
	PRIMARY KEY(id),
    FOREIGN KEY(pessoa_id) REFERENCES pessoa(id)
);


CREATE TABLE pessoa_endereco(
	id INT NOT NULL AUTO_INCREMENT, 
	pessoa_id INT,
    rua VARCHAR(100),
    numero VARCHAR(10),
    cidade VARCHAR(50),
    estado VARCHAR(2),
    cep VARCHAR(8),
    PRIMARY KEY(id),
    FOREIGN KEY (pessoa_id) REFERENCES pessoa(id)
);

INSERT INTO pessoa(nome, tipo, email) VALUES ("Breno Guimarães", "FISICA", "breno@gmail.com"); 
INSERT INTO pessoa(nome, tipo, email) VALUES ("Breno Guimarães", "JURIDICA", "breno@gmail.com");
INSERT INTO pessoa(nome, tipo, email) VALUES ("Lucas Guimarães", "FISICA", "lucas@gmail.com"); 
INSERT INTO pessoa(nome, tipo, email) VALUES ("Lucas Guimarães", "JURIDICA", "lucas@gmail.com"); 
INSERT INTO pessoa(nome, tipo, email) VALUES ("Pedro De Jesus", "FISICA", "pedro@gmail.com"); 

SELECT * FROM pessoa;
SELECT LAST_INSERT_ID();

-- testando UNIQUE
INSERT INTO pessoa_fisica (id, cpf, data_nascimento) VALUES (1, '08735175559', '2004-12-18'); 
INSERT INTO pessoa_fisica (id, cpf, data_nascimento) VALUES (5, '07787568889', '2004-08-20'); 
INSERT INTO pessoa_fisica (id, cpf, data_nascimento) VALUES (3, '08735175559', '2004-12-18'); 

-- pessoas juridicas  testando UNIQUE
INSERT INTO pessoa_juridica (id, cnpj, razao_social) VALUES (2, '92687710000150', 'BRASA SUPLEMENTOS LTDA'); 
INSERT INTO pessoa_juridica (id, cnpj, razao_social) VALUES (4, '92687710000150', 'LYRA SUPLEMENTOS LTDA'); 

-- Inserindo Telefones 
INSERT INTO pessoa_telefone (pessoa_id, telefone) VALUES (1, '71982327383');
INSERT INTO pessoa_telefone (pessoa_id, telefone) VALUES (3, '31988765564');
INSERT INTO pessoa_telefone (pessoa_id, telefone) VALUES (4, '8899922277');
INSERT INTO pessoa_telefone (pessoa_id, telefone) VALUES (5, '991029876421');
SELECT * FROM pessoa_telefone; 

-- Inserindo enderecos 
INSERT INTO pessoa_endereco (pessoa_id, rua, numero, cidade, estado, cep) VALUES (1, 'Rua Lacerda', '123', 'Simões Filho', 'BA', '43700000');
INSERT INTO pessoa_endereco (pessoa_id, rua, numero, cidade, estado, cep) VALUES (3, 'Rua Tavares', '321', 'Salvador', 'BA', '20700000');
INSERT INTO pessoa_endereco (pessoa_id, rua, numero, cidade, estado, cep) VALUES (5, 'Rua tancredo', '456', 'Salvador', 'BA', '807000');
SELECT * FROM pessoa_endereco; 

#Consultas
SELECT p.nome, p.email,p.tipo, pf.cpf, pf.data_nascimento 
FROM pessoa p JOIN pessoa_fisica pf ON p.id = pf.id;

SELECT p.nome, p.email, p.tipo, pt.telefone 
FROM pessoa p JOIN pessoa_telefone pt ON p.id = pt.pessoa_id;

SELECT p.nome, p.email, pf.cpf, pf.data_nascimento, pt.telefone
FROM  pessoa p JOIN pessoa_fisica pf  ON p.id = pf.id
JOIN pessoa_telefone pt ON p.id = pt.id;

SELECT p.nome, p.email, pf.cpf, pf.data_nascimento, pt.telefone, pe.rua,pe.cidade,pe.estado
FROM pessoa p JOIN pessoa_fisica pf ON p.id = pf.id
JOIN pessoa_telefone pt ON p.id = pt.pessoa_id 
JOIN pessoa_endereco pe ON p.id = pe.pessoa_id 
WHERE pt.telefone LIKE '99102%';



