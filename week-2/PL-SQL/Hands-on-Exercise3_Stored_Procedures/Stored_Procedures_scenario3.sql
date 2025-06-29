CREATE TABLE Accounts (
  AccountID NUMBER PRIMARY KEY,
  Balance NUMBER
);
INSERT INTO Accounts VALUES (201, 10000);
INSERT INTO Accounts VALUES (202, 3000);

CREATE OR REPLACE PROCEDURE TransferFunds (
  from_acct IN NUMBER,
  to_acct IN NUMBER,
  amount IN NUMBER
) IS
  from_balance NUMBER;
BEGIN

  SELECT Balance INTO from_balance FROM Accounts WHERE AccountID = from_acct;

  IF from_balance < amount THEN
    DBMS_OUTPUT.PUT_LINE('Insufficient balance.');
  ELSE

    UPDATE Accounts SET Balance = Balance - amount WHERE AccountID = from_acct;

    UPDATE Accounts SET Balance = Balance + amount WHERE AccountID = to_acct;

    DBMS_OUTPUT.PUT_LINE('Transferred ' || amount || ' from ' || from_acct || ' to ' || to_acct);
  END IF;
END;
/

BEGIN
  TransferFunds(201, 202, 2000);
END;
/

SELECT * FROM Accounts;
