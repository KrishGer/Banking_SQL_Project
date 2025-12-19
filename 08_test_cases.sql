-- Test procedures
CALL deposit_money(101, 5000);
CALL withdraw_money(102, 2000);

use banking_sql_project;
-- Check balances
select * from accounts;