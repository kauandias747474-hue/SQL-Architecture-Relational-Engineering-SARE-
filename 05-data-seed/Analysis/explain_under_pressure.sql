CREATE TABLE transactions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT NOT NULL,
    amount DECIMAL(15, 2) NOT NULL,
    status VARCHAR(20) NOT NULL,
    created_at DATETIME NOT NULL,
    INDEX idx_created_at (created_at), -- Índice que vamos testar
    INDEX idx_status (status)
);

-- 2. POPULAÇÃO RÁPIDA (Seed)

INSERT INTO transactions (account_id, amount, status, created_at)
SELECT 
    FLOOR(1 + RAND() * 10), 
    RAND() * 1000, 
    'completed', 
    DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 365) DAY)
FROM (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4) AS t1
CROSS JOIN (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4) AS t2
CROSS JOIN (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4) AS t3;

-- 3. ANÁLISE DE PERFORMANCE (Explain Under Pressure)

EXPLAIN SELECT * FROM transactions 
WHERE created_at > DATE_SUB(NOW(), INTERVAL 30 DAY)
AND status = 'completed';

-- 4. RESULTADO FINAL
SELECT COUNT(*) AS total_na_massa_de_teste FROM transactions;
