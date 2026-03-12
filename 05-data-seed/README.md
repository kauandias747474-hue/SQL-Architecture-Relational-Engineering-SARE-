# 💾 05. Data Seeding & Stress Testing

## 📖 Descrição / Description

**PT-BR:** Esta pasta contém o ecossistema de simulação de carga e volume do repositório. O objetivo é validar a resiliência da arquitetura e a eficiência dos índices em um cenário que mimetiza o ambiente de produção em larga escala, garantindo que as otimizações feitas anteriormente se sustentem sob pressão.
**EN-US:** This folder contains the load and volume simulation ecosystem for the repository. The goal is to validate architectural resilience and index efficiency in a scenario that mimics a large-scale production environment, ensuring that previous optimizations hold up under pressure.

---

## 🏗️ Metodologia de Validação | Validation Methodology

### 1. Seed Scripts (Geração de Massa Crítica)
* **PT-BR:** Uso de scripts otimizados e **Bulk Inserts** para popular o banco com milhões de registros sintéticos em segundos, evitando o viés de testes em tabelas pequenas.
* **EN-US:** Use of optimized scripts and **Bulk Inserts** to populate the database with millions of synthetic records in seconds, avoiding the bias of testing on small tables.

### 2. Stress Testing (Batismo de Fogo)
* **PT-BR:** Simulação de alta concorrência para identificar gargalos e ocorrência de **Deadlocks** antes do deploy em produção.
* **EN-US:** High concurrency simulation to identify bottlenecks and **Deadlock** occurrences before production deployment.

### 3. Validação de Índices sob Carga
* **PT-BR:** Monitoramento do custo de I/O e tempo de execução enquanto o banco está sob estresse, garantindo latência estável mesmo com o cache sob pressão.
* **EN-US:** Monitoring I/O cost and execution time while the database is under stress, ensuring stable latency even with the cache under pressure.

---

## 🔬 Como o sistema é testado | How the system is tested

1. **Inflação:** O banco é inflado artificialmente até atingir gigabytes de dados via `bulk_data_seed.sql`.
2. **Execução:** Consultas complexas (vistas na pasta 04) são rodadas simultaneamente contra essa massa.
3. **Análise:** Verificamos se o plano de execução (`EXPLAIN`) continua utilizando os índices corretamente ou se a performance degrada.

---

## 📈 Impacto de Engenharia | Engineering Impact

| Recurso / Feature | Benefício / Benefit |
| :--- | :--- |
| **Previsibilidade** | Evita surpresas de performance no primeiro dia de produção. / *Prevents launch day surprises.* |
| **Robustez / Robustness** | Identifica limites de hardware e configuração de memória. / *Identifies hardware limits.* |
| **Escalabilidade** | Prova que o "Vanilla SQL" suporta escala real. / *Proves Vanilla SQL supports real scale.* |

---

> "Theory is when you know everything but nothing works. Practice is when everything works but no one knows why. Here, we combine both."
