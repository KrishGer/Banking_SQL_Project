-- Step 4: Stored Procedures & Triggers

USE banking_sql_project;

-- ===========================
-- Stored Procedure: Deposit Money
-- ===========================
DROP PROCEDURE IF EXISTS deposit_money;
DELIMITER $$
CREATE PROCEDURE deposit_money(IN acc_id INT, IN amt DECIMAL(10,2))
BEGIN
    UPDATE accounts
    SET balance = balance + amt
    WHERE account_id = acc_id;
END$$
DELIMITER ;

-- ===========================
-- Stored Procedure: Withdraw Money
-- ===========================
DROP PROCEDURE IF EXISTS withdraw_money;
DELIMITER $$
CREATE PROCEDURE withdraw_money(IN acc_id INT, IN amt DECIMAL(10,2))
BEGIN
    UPDATE accounts
    SET balance = balance - amt
    WHERE account_id = acc_id;
END$$
DELIMITER ;

-- ===========================
-- Trigger: Prevent Negative Balance
-- ===========================
DROP TRIGGER IF EXISTS prevent_negative_balance;
DELIMITER $$
CREATE TRIGGER prevent_negative_balance
BEFORE UPDATE ON accounts
FOR EACH ROW
BEGIN
    IF NEW.balance < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insufficient balance';
    END IF;
END$$
DELIMITER $$

call deposit_money(1,5000);
call withdraw_money(1,5000);