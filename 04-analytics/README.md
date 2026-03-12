# 📊 04. Analytics & BI Layer (Power BI Ready)

## 📖 Descrição / Description

**PT-BR:** Esta pasta contém a camada de abstração desenhada exclusivamente para ferramentas de visualização (Power BI, Tableau). O foco aqui é a **Refinaria de Dados**: transformar registros brutos em métricas executivas diretamente no motor do banco de dados, garantindo uma única fonte da verdade (*Single Source of Truth*).
**EN-US:** This folder contains the abstraction layer designed exclusively for visualization tools (Power BI, Tableau). The focus here is the **Data Refinery**: transforming raw records into executive metrics directly within the database engine, ensuring a Single Source of Truth.

---

## 🧠 Arquitetura do Projeto: The Growth Engine



### 1. Agregação Temporal (CTE - Staging)
* **PT-BR:** O código agrupa milhões de transações individuais por janelas temporais. Isso reduz a granularidade do dado para o nível executivo, eliminando processamento pesado no Power BI.
* **EN-US:** The code groups millions of individual transactions into temporal windows. This reduces data granularity to the executive level, eliminating heavy processing in Power BI.

### 2. Inteligência Comparativa (Window Functions)
* **PT-BR:** Utilizamos `LAG()` e `LEAD()` para comparar o mês atual com o anterior em uma única linha, permitindo o cálculo de **Crescimento Mensal (MoM)** e **Churn Rate** sem subqueries lentas.
* **EN-US:** We use `LAG()` and `LEAD()` to compare the current month with the previous one in a single row, allowing the calculation of **MoM Growth** and **Churn Rate** without slow subqueries.

### 3. Persistência de Performance (Materialized Views)
* **PT-BR:** O resultado final é encapsulado em uma **Materialized View**, que armazena o resultado fisicamente para garantir carregamento instantâneo nos Dashboards.
* **EN-US:** The final result is encapsulated in a **Materialized View**, which physically stores the result to ensure instant loading in Dashboards.

---

## 📂 Estrutura de Arquivos / Directory Structure

* **`Views/`**: Consultas de agregação e limpeza de dados (Data Cleaning).
* **`Window-Functions/`**: Exemplos de inteligência temporal e análise de coorte.
* **`Materialized-Views/`**: Snapshots de performance para consumo externo.

---

## 📈 Impacto Técnico | Technical Impact

| Técnica / Technique | Por que usar? / Why use it? |
| :--- | :--- |
| **Window Functions** | Evita loops e otimiza o custo de CPU. / *Avoids loops and optimizes CPU cost.* |
| **Materialized Views** | Transforma consultas de segundos em respostas instantâneas. / *Turns seconds into instant responses.* |
| **Null Handling** | Tratamento de divisões por zero, garantindo robustez. / *Handles division by zero, ensuring robustness.* |

---

> "Abstrações custam caro; a precisão é gratuita."
