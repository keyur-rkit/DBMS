CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    account_name VARCHAR(50),
    balance DECIMAL(10, 2)
);



INSERT INTO accounts (account_id, account_name, balance) VALUES
(1, 'Keyur', 1000.00),
(2, 'Raj', 500.00);

-- START TRANSACTION
START TRANSACTION;
UPDATE accounts SET balance = balance - 100 WHERE account_id = 1;
UPDATE accounts SET balance = balance + 100 WHERE account_id = 2;
-- The above updates are part of a single transaction.

-- COMMIT
COMMIT;
-- The changes made to the accounts table are now permanent.

SELECT * FROM accounts;

-- ROLLBACK
ROLLBACK;
-- The changes made to the accounts table are discarded.

SELECT * FROM accounts;

-- SAVEPOINT
UPDATE accounts SET balance = balance - 50 WHERE account_id = 1;
SAVEPOINT sp1;
-- If needed, you can roll back to this savepoint.

-- SAVEPOINT
UPDATE accounts SET balance = balance - 50 WHERE account_id = 2;
SAVEPOINT sp2;
-- If needed, you can roll back to this savepoint.

-- ROLLBACK TO SAVEPOINT
ROLLBACK TO SAVEPOINT sp1;
-- The changes made after savepoint sp1 are undone, but the transaction is still active.

-- RELEASE SAVEPOINT
RELEASE SAVEPOINT sp1;
-- The savepoint sp1 is no longer available.

-- disable autocommit mode using:
SET autocommit = 0;
SET autocommit = 1;
SHOW VARIABLES LIKE 'autocommit';
