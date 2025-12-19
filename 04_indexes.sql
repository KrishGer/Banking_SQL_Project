--Step 2: Add Constraints and Indexes
-- Make sure we are using the Correct database

use banking_sql_project;
-- ⿡ CHECK constraint: Ensure account balance is not negative
ALTER TABLE accounts
ADD CONSTRAINT chk_balance CHECK (balance >= 0);

-- ⿢ Indexes: Speed up queries on frequently used columns
-- Index on accounts table for customer_id
CREATE INDEX idx_customer_id ON accounts(customer_id);

-- Index on transactions table for account_id
CREATE INDEX idx_account_id ON transactions(account_id);