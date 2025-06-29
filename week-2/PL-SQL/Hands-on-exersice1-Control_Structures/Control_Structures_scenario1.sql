SET SERVEROUTPUT ON;

CREATE TABLE Customers (
  CustomerID NUMBER,
  Age NUMBER,
  IsVIP VARCHAR2(5),
  Balance NUMBER
);

CREATE TABLE Loans (
  CustomerID NUMBER,
  InterestRate NUMBER,
  DueDate DATE
);

INSERT INTO Customers VALUES (1, 65, 'FALSE', 12000);
INSERT INTO Customers VALUES (2, 45, 'FALSE', 8000);
INSERT INTO Customers VALUES (3, 70, 'FALSE', 15000);

INSERT INTO Loans VALUES (1, 9.5, SYSDATE + 15);
INSERT INTO Loans VALUES (2, 10.0, SYSDATE + 45);
INSERT INTO Loans VALUES (3, 8.5, SYSDATE + 10);

SET SERVEROUTPUT ON;

BEGIN
  FOR cust_rec IN (SELECT CustomerID FROM Customers WHERE Age > 60) LOOP
    UPDATE Loans
    SET InterestRate = InterestRate - (InterestRate * 0.01)
    WHERE CustomerID = cust_rec.CustomerID;

    DBMS_OUTPUT.PUT_LINE('1% discount applied for CustomerID: ' || cust_rec.CustomerID);
  END LOOP;

  COMMIT;
END;
/

