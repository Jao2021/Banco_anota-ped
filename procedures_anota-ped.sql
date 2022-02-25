-- INSERT INTO Pessoa (nome) VALUES ('teste1');
-- INSERT INTO Funcionario (pessoa_id, email, senha) values ( 
-- 	(SELECT currval(pg_get_serial_sequence('Pessoa','id'))), 'teste@email.com', 'senhateste'
-- );
-- select p.id as pes_id, f.pessoa_id as fun_id, p.nome, f.email, f.senha from Pessoa p, Funcionario f 
-- where p.id = f.pessoa_id

-- INSERT INTO Pessoa (nome) VALUES ('testecli');
-- INSERT INTO Cliente (pessoa_id, telefone) VALUES (
-- 	(SELECT currval(pg_get_serial_sequence('Pessoa','id'))), '17-15518'
-- );

-- FUNÇÕES --

--PROCEDURES --
CREATE OR REPLACE PROCEDURE add_fun(V_NOME VARCHAR(20), V_EMAIL VARCHAR(20), V_SENHA VARCHAR(20))
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO Pessoa (nome) VALUES (V_NOME);
	INSERT INTO Funcionario (pessoa_id, email, senha) values ( 
	(SELECT currval(pg_get_serial_sequence('Pessoa','id'))), V_EMAIL, V_SENHA);
	COMMIT;

END;$$

CALL add_fun ('teste_profun','profun@email','senhapro');


CREATE OR REPLACE PROCEDURE add_cli(v_NOME VARCHAR(20), V_TELEFONE VARCHAR(9))
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO Pessoa (nome) VALUES (V_NOME);
	INSERT INTO Cliente (pessoa_id, telefone) values (
	(SELECT currval(pg_get_serial_sequence('Pessoa','id'))), V_TELEFONE);
	COMMIT;
END;$$
CALL add_cli ('teste_procli', '123456789');
