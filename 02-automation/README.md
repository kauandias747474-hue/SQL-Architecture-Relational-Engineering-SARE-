# ⚙️ 01. Database Automation & Business Logic

## 📖 Descrição / Description

**PT-BR:** Esta camada representa a inteligência processual residente no banco de dados. Ao centralizar regras críticas no motor relacional, garantimos consistência atômica, eliminamos latência de rede e criamos uma última linha de defesa para a integridade dos dados, independente de falhas na aplicação ou no front-end.
**EN-US:** This layer represents the procedural intelligence residing within the database. By centralizing critical rules in the relational engine, we ensure atomic consistency, eliminate network latency, and create a final line of defense for data integrity, regardless of failures in the application or front-end.

---

## 🏗️ Projeto Demonstrativo: Motor de Clearing Financeiro
### (Demonstration Project: Financial Clearing Engine)

O código contido nesta pasta implementa um sistema de transferência de ativos com auditoria automatizada, utilizando o poder total do SQL para garantir precisão absoluta.

### 🛠️ Funcionalidades / Features

#### 1. Stored Procedures (Fluxo Atômico)
* **PT-BR:** Gerencia o ciclo de vida completo de uma transação (Débito/Crédito). Implementa controle de concorrência e **Rollback Automático**, garantindo que o dinheiro nunca "desapareça" entre contas.
* **EN-US:** Manages the full lifecycle of a transaction (Debit/Credit). Implements concurrency control and **Automatic Rollback**, ensuring money never "disappears" between accounts.

#### 2. Functions (Lógica Reutilizável)
* **PT-BR:** Encapsula regras de validação (ex: verificação de saldo e limites) que são processadas diretamente onde o dado reside (**Vanilla-First**).
* **EN-US:** Encapsulates validation rules (e.g., balance and limit checks) processed directly where the data resides (**Vanilla-First**).

#### 3. Triggers (Auditoria Passiva)
* **PT-BR:** Cria uma trilha de auditoria imutável. Qualquer alteração de saldo gera automaticamente um log com o valor anterior e o novo, protegendo o sistema contra manipulações manuais externas.
* **EN-US:** Creates an immutable audit trail. Any balance change automatically triggers a log with the old and new values, protecting the system against manual external manipulations.

---

## 📂 Estrutura de Arquivos / File Structure

* **`Schema/tables.sql`**: Definição de tabelas com constraints (`CHECK`, `UNIQUE`, `NOT NULL`).
* **`Procedures/sp_process_transfer.sql`**: Lógica de transferência com controle de transação (`COMMIT`/`ROLLBACK`).
* **`Functions/fn_check_balance.sql`**: Validação técnica de disponibilidade de fundos.
* **`Triggers/tg_audit_balance_change.sql`**: Automação da trilha de auditoria.

---

## 🛡️ Benefícios Técnicos / Technical Benefits



* **Consistência ACID:** Garantia de que transações complexas terminem com sucesso ou sejam totalmente revertidas.
* **Integridade Blindada:** A lógica de negócio reside no banco, impedindo que bugs no código da aplicação corrompam dados financeiros.
* **Performance:** Menor volume de dados trafegando entre servidor e aplicação (Single Round-trip).

---

> "Abstrações custam caro; a precisão é gratuita."
> *(Abstractions are expensive; precision is free.)*
