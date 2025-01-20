CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    account_name VARCHAR(50),
    balance DECIMAL(10, 2)
);

INSERT INTO accounts (account_id, account_name, balance) VALUES
(1, 'Keyur', 1000.00),
(2, 'Raj', 500.00);

-- 1. START TRANSACTION
START TRANSACTION;
UPDATE accounts SET balance = balance - 100 WHERE account_id = 1;
UPDATE accounts SET balance = balance + 100 WHERE account_id = 2;
-- The above updates are part of a single transaction.

-- 2. COMMIT
COMMIT;
-- The changes made to the accounts table are now permanent.

SELECT * FROM accounts;

-- 3. ROLLBACK
ROLLBACK;
-- The changes made to the accounts table are discarded.

SELECT * FROM accounts;

-- 4. SAVEPOINT
SAVEPOINT sp1;
UPDATE accounts SET balance = balance - 50 WHERE account_id = 1;
-- If needed, you can roll back to this savepoint.

-- 5. ROLLBACK TO SAVEPOINT
ROLLBACK TO SAVEPOINT sp1;
-- The changes made after savepoint sp1 are undone, but the transaction is still active.

-- 6. RELEASE SAVEPOINT
RELEASE SAVEPOINT sp1;
-- The savepoint sp1 is no longer available.

-- Notes:
-- TCL commands are used to manage transactions in databases.
-- By default, MySQL operates in autocommit mode, where each statement is committed automatically.
-- To use transactions effectively, disable autocommit mode using:
SET autocommit = 0;
-- After completing your transactions, you can enable it back:
SET autocommit = 1;
