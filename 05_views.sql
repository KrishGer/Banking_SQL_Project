-- Step 3: Create Views

-- Use the correct database
USE banking_sql_project;

-- Create a view to summarize customer account balances
CREATE VIEW customer_account_summary AS
SELECT 
    c.customer_id,
    c.full_name,
    a.account_id,
    a.account_type,
    a.balance
FROM customers c
JOIN accounts a
ON c.customer_id = a.customer_id;

-- Test the view
SELECT * FROM customer_account_summary;