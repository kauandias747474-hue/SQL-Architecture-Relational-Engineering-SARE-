# 🛡️ RDBMS Integrity Core: Engenharia de Dados e Defesa Blindada

> **"Data is the asset; integrity is the vault. Logic governs the flow, but the Schema enforces the truth."**
> *"O dado é o ativo; a integridade é o cofre. A lógica governa o fluxo, mas o Schema impõe a verdade."*

![SQL](https://img.shields.io/badge/Language-SQL-blue?style=for-the-badge&logo=mysql&logoColor=white)
![Security](https://img.shields.io/badge/Focus-Database_Hardening-red?style=for-the-badge)
![Theory](https://img.shields.io/badge/Methodology-Relational_Algebra-orange?style=for-the-badge)
![Standard](https://img.shields.io/badge/Design-3NF_Normalization-purple?style=for-the-badge)

---

## 📖 Resumo / Overview

**PT-BR:** O `RDBMS Integrity Core` (RIC) foca em **segurança profunda** e **normalização rigorosa**. O projeto demonstra como transpor modelos matemáticos de conjuntos para implementações SQL onde a integridade é blindada pelo motor do banco (Hardening), garantindo resiliência contra ataques, independente da aplicação.

**EN-US:** `RDBMS Integrity Core` (RIC) focuses on **deep security** and **rigorous normalization**. This project demonstrates how to translate mathematical set models into secure SQL implementations where integrity is hardened by the database engine, ensuring resilience against attacks, regardless of the application layer.

---

## 🎯 Proposta de Valor / Value Proposition

### 📐 Rigor Matemático (Relational Algebra)
Modelagem baseada em álgebra relacional e teoria de conjuntos. Aplicação estrita da **3ª Forma Normal (3NF)** para eliminação de redundâncias e prevenção de anomalias. Validado em papel A4 antes da codificação.
*Modeling based on relational algebra. Strict 3NF application to eliminate redundancy and update anomalies.*

### 🛡️ Defesa Blindada (SQLi Defense)
Segurança em nível de infraestrutura: uso de **Stored Procedures** para isolar o acesso ao dado e **Privilege Segregation** para garantir que a aplicação nunca tenha mais poder do que o estritamente necessário.
*Infrastructure-level security: using Stored Procedures and Privilege Segregation to minimize attack surface.*

### 🔍 Auditoria Atômica
Uso de **Triggers** e Logs de auditoria para rastrear modificações em tabelas críticas, garantindo a imutabilidade do histórico e facilitando processos de perícia digital (Forensics).
*Audit Triggers to track changes in critical tables for forensics and reliability.*

---

## 🛠️ Implementações de Engenharia / Features

| Feature | Technical Description (EN) | Descrição Técnica (PT) | Implementation |
| :--- | :--- | :--- | :--- |
| **Least Privilege** | Granular DCL permissions for DB users. | Permissões granulares (DCL) de usuário. | Security |
| **3NF Schema** | Normalization for zero data redundancy. | Normalização total (3NF) contra redundância. | Architecture |
| **Proc Isolation** | All DML executed via Stored Procedures. | Escrita isolada via Stored Procedures. | Defense |
| **Audit Triggers** | Automated row-level change logging. | Log automático de alterações via Triggers. | Compliance |
| **Query Optz** | Indexing strategy and EXPLAIN analysis. | Estratégia de índices e análise via EXPLAIN. | Performance |

---

## 📐 Metodologia de Design (Manual & Logic)

O fluxo de trabalho prioriza a lógica matemática sobre a automação:

1.  **Esquema Manual:** Diagramas de Entidade-Relacionamento (DER) desenhados em papel A4.
2.  **Validação Lógica:** Verificação de chaves e dependências funcionais antes do DDL.
3.  **Hardening:** Configuração de usuários com acesso restrito por host e comando.

---

## 📂 Estrutura do Ecossistema / Project Structure

* 📁 **[`/schemas`](./schemas):** Definições de tabelas focadas em performance.
* 📁 **[`/security`](./security):** Scripts de criação de usuários e permissões.
* 📁 **[`/procedures`](./procedures):** Lógica de negócio encapsulada.
* 📁 **[`/docs`](./docs):** Modelagem matemática e diagramas de fluxo.

---

## 📩 Contato / Contact

* 💼 **Freelance & Bug Bounty:** [Consultancy/Email](#)
* 📊 **Mathematics:** *Logic validated via mathematical models on paper.*

---
**Developed by Kauan Oliveira - 2026**
