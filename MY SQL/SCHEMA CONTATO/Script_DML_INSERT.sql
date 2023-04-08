USE CONTATO;

INSERT INTO contato(nome, email, telefone)
	VALUES('Paulo','paulo@gmail.com','32999776905'),
		('João','joao@gmail.com','32998007364'),
		('Esther','esther@gmail.com','32988733931');
        
INSERT INTO grupo(nome)
	VALUES('Escola'),
		('Trabalho'),
        ('Amigos'),
        ('Inimigos'),
        ('Cerveja e Alegria'),
        ('Detetive das Sombras'),
        ('Sozinho no mundo');
        
INSERT INTO grupocontato(codgrupo, codcontato)
	VALUES(1, 3),
		(1, 1);
        
