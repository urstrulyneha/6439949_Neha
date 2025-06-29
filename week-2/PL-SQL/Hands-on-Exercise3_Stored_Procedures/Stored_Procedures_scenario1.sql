SET SERVEROUTPUT ON;

CREATE TABLE Accounts (
  AccountID NUMBER,
  AccountType VARCHAR2(20),
  Balance NUMBER
);

INSERT INTO Accounts VALUES (101, 'Savings', 10000);
INSERT INTO Accounts VALUES (102, 'Current', 15000);
INSERT INTO Accounts VALUES (103, 'Savings', 5000);

CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest IS
BEGIN
  UPDATE Accounts
  SET Balance = Balance + (Balance * 0.01)
  WHERE AccountType = 'Savings';

  DBMS_OUTPUT.PUT_LINE('Monthly interest applied to savings accounts.');
END;
/

BEGIN
  ProcessMonthlyInterest;
END;
/

SELECT * FROM Accounts;
