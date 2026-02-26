# 🏗️ DDL & Data Modeling: O Banco de Dados como "Única Fonte da Verdade"

Esta pasta contém a estrutura fundamental (DDL) de três ecossistemas de dados distintos. O objetivo central é demonstrar como o banco de dados pode atuar como o **motor de regras de negócio**, utilizando restrições de integridade para garantir que nenhum dado inconsistente seja persistido, independentemente de falhas na camada de aplicação.

---

## 📂 Estrutura do Repositório

Os projetos estão organizados por contextos de negócio, focando em integridade referencial, constraints e tipagem customizada para garantir a padronização:

/DDL-Data-Modeling
├── 00_Global_Resources/      # Tipos, Enums e Domínios compartilhados
├── 01_Public_Transport/      # Sistema de Bilhetagem (Integridade Financeira)
├── 02_E_Health_Records/      # Gestão de Saúde (Imutabilidade e Segurança)
└── 03_IT_Asset_Management/   # Controle de Inventário (Estados e Logística)


---

## 🚌 1. Sistema de Bilhetagem de Transporte
**Desafio:** Impedir fraudes de saldo e garantir a atomicidade das viagens vinculadas a veículos e estações.

* **Solução:** Implementação de `CHECK Constraints` para garantir a regra de saldo positivo ($saldo \ge 0$).
* **Lógica:** O banco de dados valida a transação de débito no ato da inserção da viagem. Se a tarifa exceder o saldo atual, o banco rejeita a operação (*Database Level*), impedindo o prejuízo financeiro imediato.
* **Conceito Chave:** Transações Atômicas e Integridade Financeira.

---

## 🏥 2. Gestão de Prontuário Eletrônico (Saúde)
**Desafio:** Garantir a imutabilidade de registros médicos e evitar erros críticos de prescrição.

* **Solução:** Uso de *Foreign Keys* (FK) rigorosas e bloqueio de exclusão via `ON DELETE RESTRICT`.
* **Lógica:** O banco exige que cada prescrição aponte para um medicamento válido no catálogo. Uma vez que uma consulta é registrada, a estrutura impede a sua remoção, servindo como uma trilha de auditoria ética e legal inalterável.
* **Conceito Chave:** Auditabilidade e Segurança do Paciente.

---

## 💻 3. Controle de Alocação de Ativos (TI)
**Desafio:** Impedir que um ativo físico seja alocado para duas pessoas simultaneamente ou que itens aposentados sejam usados.

* **Solução:** Utilização de `Unique Constraints` condicionais e gestão de estados via `Enums`.
* **Lógica:** O banco garante exclusividade: um equipamento com status "Em Uso" ou "Aposentado" é bloqueado para novas alocações. A regra de unicidade impede que um ID de equipamento apareça em duas alocações ativas ao mesmo tempo.
* **Conceito Chave:** Gestão de Estados e Controle Patrimonial.

---

## 🛠️ Conceitos de SQL Aplicados

A construção destes projetos envolve o domínio dos seguintes pilares da Engenharia de Dados:

* **DDL (Data Definition Language):** Criação e alteração de tabelas, esquemas e objetos.
* **Integridade Referencial:** Uso de *Primary Keys* (PK) e *Foreign Keys* (FK) para eliminar dados órfãos.
* **Constraints Rígidas:**
    * `CHECK`: Validações lógicas (ex: $saldo \ge 0$ ou $data\_fim > data\_inicio$).
    * `UNIQUE`: Prevenção de duplicidade em registros únicos (CPFs, Seriais, Alocações).
    * `NOT NULL`: Obrigatoriedade de preenchimento para campos críticos.
* **Domains & Types:** Tipagem customizada para evitar estados inválidos (ex: status inconsistentes).
* **Normalização:** Estruturação em 3ª Forma Normal (3NF) para eliminar redundâncias e lixo de dados.

---

## 🚀 Por que esta abordagem?

Ao mover a inteligência de validação para o banco de dados (**Data-Centric**), resolvemos problemas que a aplicação sozinha pode falhar em conter:

1.  **Prejuízo Financeiro:** Impede saldo negativo em sistemas de alta escala.
2.  **Risco Jurídico:** Protege a integridade de documentos sensíveis através da imutabilidade.
3.  **Eficiência Operacional:** Garante que o inventário digital seja o reflexo fiel do inventário físico.

**Status do Projeto:** 🏗️ Em desenvolvimento de scripts DDL.
