-- ============================================================
-- PROJETO: BANCO DE DADOS ESCOLA RECANTO DO COQUEIRO
-- GOVERNANÇA: LGPD & CONTROLE DE ACESSO (RBAC)
-- ============================================================

-- 1. Tabela: ALUNO
CREATE TABLE tb_aluno (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome_completo VARCHAR(120) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE, -- Tag LGPD: Dado Pessoal Identificável (PII)
    data_nascimento DATE NOT NULL,
    email_responsavel VARCHAR(100) NOT NULL, -- Tag LGPD: Contato PII
    telefone_responsavel VARCHAR(20),
    status_lgpd_consentimento BOOLEAN DEFAULT TRUE NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Tabela: PROFESSOR
CREATE TABLE tb_professor (
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome_professor VARCHAR(120) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE, -- Tag LGPD: Dado Pessoal (PII)
    especialidade VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    data_admissao DATE NOT NULL
);

-- 3. Tabela: TURMA
CREATE TABLE tb_turma (
    id_turma INT AUTO_INCREMENT PRIMARY KEY,
    nome_turma VARCHAR(50) NOT NULL,
    ano_letivo INT NOT NULL,
    turno VARCHAR(20) CHECK (turno IN ('MANHÃ', 'TARDE', 'NOITE')),
    id_professor INT NOT NULL,
    CONSTRAINT fk_turma_professor FOREIGN KEY (id_professor) 
        REFERENCES tb_professor(id_professor) ON DELETE RESTRICT
);

-- 4. Tabela: MATRÍCULA
CREATE TABLE tb_matricula (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_turma INT NOT NULL,
    data_matricula DATE DEFAULT (CURRENT_DATE),
    status_matricula VARCHAR(20) DEFAULT 'ATIVA' CHECK (status_matricula IN ('ATIVA', 'CANCELADA', 'CONCLUÍDA')),
    CONSTRAINT fk_matricula_aluno FOREIGN KEY (id_aluno) 
        REFERENCES tb_aluno(id_aluno) ON DELETE CASCADE,
    CONSTRAINT fk_matricula_turma FOREIGN KEY (id_turma) 
        REFERENCES tb_turma(id_turma) ON DELETE RESTRICT,
    CONSTRAINT uk_aluno_turma UNIQUE (id_aluno, id_turma)
);