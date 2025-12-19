-- ===================================
-- ⿡ Basic SELECT Queries
-- ===================================
-- List all customers
SELECT * FROM customers;

-- List all accounts with balances
SELECT account_id, customer_id, account_type, balance
FROM accounts;

-- List all transactions
SELECT * FROM transactions;

-- ===================================
-- ⿢ GROUP BY / HAVING Queries
-- ===================================
-- Total balance per customer
SELECT c.customer_id, c.full_name, SUM(a.balance) AS total_balance
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.full_name;

-- Customers with total balance greater than 10000
SELECT c.customer_id, c.full_name, SUM(a.balance) AS total_balance
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.full_name
HAVING SUM(a.balance) > 10000;

-- ===================================
-- ⿣ Ranking Functions
-- ===================================
-- Top 3 accounts by balance
SELECT account_id, customer_id, balance,
       RANK() OVER (ORDER BY balance DESC) AS rank_balance
FROM accounts
ORDER BY rank_balance;

-- ===================================
-- ⿤ Subqueries
-- ===================================
-- Customers with max single account balance
SELECT customer_id, full_name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM accounts
    WHERE balance = (SELECT MAX(balance) FROM accounts)
);

-- ===================================
-- ⿥ String Functions
-- ===================================
-- First 3 letters of customer names
SELECT customer_id, full_name, LEFT(full_name, 3) AS short_name
FROM customers;

-- ===================================
-- ⿦ Date Functions (if transactions have date column)
-- ===================================
-- Total transactions per month (assuming transaction_date exists)
SELECT YEAR(transaction_date) AS txn_year,
       MONTH(transaction_date) AS txn_month,
       COUNT(*) AS total_txns,
       SUM(amount) AS total_amount
FROM transactions
GROUP BY YEAR(transaction_date), MONTH(transaction_date)
ORDER BY txn_year, txn_month;