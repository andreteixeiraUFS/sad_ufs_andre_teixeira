
CREATE TABLE curso (
                id_curso INTEGER NOT NULL,
                descricao VARCHAR NOT NULL,
                CONSTRAINT id_curso PRIMARY KEY (id_curso)
);


CREATE TABLE tempo (
                id_tempo INTEGER NOT NULL,
                semestre VARCHAR NOT NULL,
                ano INTEGER NOT NULL,
                CONSTRAINT id_tempo PRIMARY KEY (id_tempo)
);


CREATE TABLE disciplina (
                id_disciplina INTEGER NOT NULL,
                descricao VARCHAR NOT NULL,
                CONSTRAINT id_disciplina PRIMARY KEY (id_disciplina)
);


CREATE TABLE aluno (
                id_aluno INTEGER NOT NULL,
                idade INTEGER NOT NULL,
                nome VARCHAR NOT NULL,
                CONSTRAINT id_aluno PRIMARY KEY (id_aluno)
);


CREATE TABLE fato_aulas (
                id_tempo INTEGER NOT NULL,
                id_aluno INTEGER NOT NULL,
                id_curso INTEGER NOT NULL,
                id_disciplina INTEGER NOT NULL,
                id_tempo_1 INTEGER NOT NULL,
                quant_repovadors INTEGER NOT NULL,
                quanto_alunos_curso INTEGER NOT NULL,
                quanto_disc_curso INTEGER NOT NULL,
                CONSTRAINT id_tempo PRIMARY KEY (id_tempo, id_aluno, id_curso, id_disciplina)
);


ALTER TABLE fato_aulas ADD CONSTRAINT curso_fato_aulas_fk
FOREIGN KEY (id_curso)
REFERENCES curso (id_curso)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE fato_aulas ADD CONSTRAINT tempo_fato_aulas_fk
FOREIGN KEY (id_tempo)
REFERENCES tempo (id_tempo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE fato_aulas ADD CONSTRAINT disciplina_fato_aulas_fk
FOREIGN KEY (id_disciplina)
REFERENCES disciplina (id_disciplina)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE fato_aulas ADD CONSTRAINT aluno_fato_aulas_fk
FOREIGN KEY (id_aluno)
REFERENCES aluno (id_aluno)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
