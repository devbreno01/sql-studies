create database execfuncionarios; 
USE execfuncionarios;
CREATE TABLE departamento(
id INT NOT NULL AUTO_INCREMENT, 
nome VARCHAR(100), 
localizacao VARCHAR(100), 
PRIMARY KEY(id)
);
# nome, cargo, e departamento do funcionário.
CREATE TABLE funcionários(
id INT NOT NULL AUTO_INCREMENT, 
nome VARCHAR(100), 
cargo VARCHAR(100), 
id_departamento INT NOT NULL, 
PRIMARY KEY(id), 
FOREIGN KEY(id_departamento) REFERENCES departamento(id)
);

INSERT INTO  departamento(nome, localizacao) VALUES ("RH", "Setor A");
INSERT INTO  departamento(nome, localizacao) VALUES ("COMERCIAL", "Setor D");
INSERT INTO  departamento(nome, localizacao) VALUES ("FINANCEIRO", "Setor E");


SELECT * FROM departamento;
INSERT INTO funcionários(nome,cargo,id_departamento) VALUES("Breno ","contador",3);
INSERT INTO funcionários(nome,cargo,id_departamento) VALUES("Lucas","economista",3);
INSERT INTO funcionários(nome,cargo,id_departamento) VALUES("Pedro","psicologo",1);
INSERT INTO funcionários(nome,cargo,id_departamento) VALUES("Giovanna","psiquiatra",1);
INSERT INTO funcionários(nome,cargo,id_departamento) VALUES("Pietra","contadora",3);

SELECT d.nome as Departamento, f.nome, f.cargo 
FROM departamento d JOIN funcionários f ON d.id = f.id_departamento;

SELECT d.nome as Departamento, f.nome, f.cargo 
FROM departamento d JOIN funcionários f ON d.id = f.id_departamento
WHERE d.id = 3;

SELECT d.nome as Departamento, f.nome, f.cargo
FROM departamento d JOIN funcionários f ON d.id = f.id_departamento 
WHERE d.id = 3 AND f.cargo LIKE 'contador%';

ALTER TABLE funcionários 
ADD salario DECIMAL(10,2); 

UPDATE funcionários 
SET salario = 3.500
WHERE id = 5;

SELECT AVG(salario)  as media
FROM funcionários;

ALTER TABLE funcionários 
ADD media DECIMAL(10,2);

ALTER TABLE funcionários 
DROP COLUMN media;
