
CREATE TABLE Cliente (
                cpf VARCHAR NOT NULL,
                nome VARCHAR NOT NULL,
                login VARCHAR NOT NULL,
                senha VARCHAR NOT NULL,
                CONSTRAINT cpf PRIMARY KEY (cpf)
);


CREATE TABLE Hotel (
                nome_hotel VARCHAR NOT NULL,
                CONSTRAINT nome_hotel PRIMARY KEY (nome_hotel)
);


CREATE TABLE Filial (
                nome_unidade VARCHAR NOT NULL,
                nome_hotel VARCHAR NOT NULL,
                CONSTRAINT nome_unidade PRIMARY KEY (nome_unidade, nome_hotel)
);


CREATE TABLE Funcionario (
                nome_unidade VARCHAR NOT NULL,
                nome_hotel VARCHAR NOT NULL,
                matricula INTEGER NOT NULL,
                nome VARCHAR NOT NULL,
                login VARCHAR NOT NULL,
                senha VARCHAR NOT NULL,
                CONSTRAINT funcionario_pk PRIMARY KEY (nome_unidade, nome_hotel, matricula)
);


CREATE TABLE numero_quarto (
                nome_unidade VARCHAR NOT NULL,
                nome_hotel VARCHAR NOT NULL,
                nome_quarto VARCHAR NOT NULL,
                capacidade INTEGER NOT NULL,
                preco VARCHAR NOT NULL,
                CONSTRAINT numero_quarto PRIMARY KEY (nome_unidade, nome_hotel, nome_quarto)
);


CREATE TABLE Item (
                nome_item VARCHAR NOT NULL,
                nome_unidade VARCHAR NOT NULL,
                nome_hotel VARCHAR NOT NULL,
                nome_quarto VARCHAR NOT NULL,
                quantidade VARCHAR NOT NULL,
                CONSTRAINT item_pk PRIMARY KEY (nome_item, nome_unidade, nome_hotel, nome_quarto)
);


CREATE TABLE Reserva (
                nome_unidade VARCHAR NOT NULL,
                nome_hotel VARCHAR NOT NULL,
                nome_quarto VARCHAR NOT NULL,
                dia_inicio DATE NOT NULL,
                dia_final DATE NOT NULL,
                id INTEGER NOT NULL,
                matricula INTEGER NOT NULL,
                valor VARCHAR NOT NULL,
                CONSTRAINT reserva_pk PRIMARY KEY (nome_unidade, nome_hotel, nome_quarto, dia_inicio, dia_final, id, matricula)
);


CREATE TABLE Cliente_Reserva (
                nome_unidade VARCHAR NOT NULL,
                nome_hotel VARCHAR NOT NULL,
                nome_quarto VARCHAR NOT NULL,
                dia_inicio DATE NOT NULL,
                dia_final DATE NOT NULL,
                id INTEGER NOT NULL,
                cpf VARCHAR NOT NULL,
                CONSTRAINT cliente_reserva_pk PRIMARY KEY (nome_unidade, nome_hotel, nome_quarto, dia_inicio, dia_final, id, cpf)
);


ALTER TABLE Cliente_Reserva ADD CONSTRAINT cliente_cliente_reserva_fk
FOREIGN KEY (cpf)
REFERENCES Cliente (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Filial ADD CONSTRAINT hotel_filial_fk
FOREIGN KEY (nome_hotel)
REFERENCES Hotel (nome_hotel)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE numero_quarto ADD CONSTRAINT filial_numero_quarto_fk
FOREIGN KEY (nome_unidade, nome_hotel)
REFERENCES Filial (nome_unidade, nome_hotel)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Funcionario ADD CONSTRAINT filial_funcionario_fk
FOREIGN KEY (nome_unidade, nome_hotel)
REFERENCES Filial (nome_unidade, nome_hotel)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Reserva ADD CONSTRAINT funcionario_reserva_fk
FOREIGN KEY (nome_unidade, nome_hotel, matricula)
REFERENCES Funcionario (nome_unidade, nome_hotel, matricula)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Reserva ADD CONSTRAINT numero_quarto_reserva_fk
FOREIGN KEY (nome_quarto, nome_unidade, nome_hotel)
REFERENCES numero_quarto (nome_quarto, nome_unidade, nome_hotel)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Item ADD CONSTRAINT numero_quarto_item_fk
FOREIGN KEY (nome_quarto, nome_unidade, nome_hotel)
REFERENCES numero_quarto (nome_quarto, nome_unidade, nome_hotel)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Cliente_Reserva ADD CONSTRAINT reserva_cliente_reserva_fk
FOREIGN KEY (nome_quarto, id, nome_unidade, nome_hotel, dia_final, dia_inicio)
REFERENCES Reserva (nome_quarto, id, nome_unidade, nome_hotel, dia_final, dia_inicio)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
