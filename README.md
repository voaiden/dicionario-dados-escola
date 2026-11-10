# 📚 Dicionário de Dados & Governança Acadêmica
### E.I. Sonho de Criança

![License](https://img.shields.io/badge/License-MIT-green.svg)
![Conformidade](https://img.shields.io/badge/Conformidade-LGPD%20%7C%20RBAC-blue.svg)
![Padrões](https://img.shields.io/badge/Padr%C3%B5es-DMBOK%20%7C%20COBIT-orange.svg)

Documentação web interativa e portal de governança de dados para o **Sistema de Gestão Acadêmica da E.I. Sonho de Criança**. O projeto contempla o dicionário completo do banco de dados relacional, rastreabilidade de regras de negócio, conformidade com a LGPD e visualização interativa do Diagrama Entidade-Relacionamento (DER).

---

## 🚀 Links do Projeto

* 🌐 **Aplicação Online (GitHub Pages):** [https://<voaiden>.github.io/<dicionario-dados-escola>/](https://voaiden.github.io/dicionario-dados-escola/)
* 📁 **Repositório do Código-Fonte:** [https://github.com/voaiden/dicionario-dados-escola.git](https://github.com/voaiden/dicionario-dados-escola.git)



---

## 🏛️ Governança de Dados & Data Literacy

Conforme as diretrizes do **DMBOK** e **COBIT**, o projeto aplica a cultura de *Data Literacy* (Letramento em Dados) no ambiente escolar:
- **LGPD (Proteção de Dados Pessoais):** Mapeamento e classificação de dados sensíveis e PII (*Personally Identifiable Information*), tais como CPF e e-mails de responsáveis.
- **RBAC (Role-Based Access Control):** Controle de acesso baseado em papéis (Admin, Secretaria e Professores) garantindo visibilidade restrita por perfil.
- **Integridade Referencial:** Modelagem em 3ª Forma Normal (3FN) com constraints de chave primária, chave estrangeira e restrições de validação (`CHECK` e `UNIQUE`).

---

## 📁 Estrutura Exata do Repositório

```text
meu-dicionario/
├── index.html          # Interface principal do dicionário de dados web
├── style.css           # Estilização responsiva com suporte a Light/Dark Mode
├── script.js           # Lógica de busca real-time, alternância de tema e Panzoom.js
├── docs/
│   └── Especificacao_Requisitos_Regras_Negocio_BD.pdf # PDF com histórico de 4 revisões
├── assets/
│   └── der.png         # Diagrama Entidade-Relacionamento (DER)
└── database/
    └── script_ddl_escola.sql # Script SQL de criação das tabelas e constraints