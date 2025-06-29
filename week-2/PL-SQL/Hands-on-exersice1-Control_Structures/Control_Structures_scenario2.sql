
SET SERVEROUTPUT ON;

CREATE TABLE Customers (
  CustomerID NUMBER,
  Age NUMBER,
  IsVIP VARCHAR2(5),
  Balance NUMBER
);

INSERT INTO Customers VALUES (1, 65, 'FALSE', 12000);
INSERT INTO Customers VALUES (2, 45, 'FALSE', 8000);
INSERT INTO Customers VALUES (3, 70, 'FALSE', 15000);

BEGIN
  FOR cust_rec IN (SELECT CustomerID FROM Customers WHERE Balance > 10000) LOOP
    UPDATE Customers
    SET IsVIP = 'TRUE'
    WHERE CustomerID = cust_rec.CustomerID;

    DBMS_OUTPUT.PUT_LINE('Promoted to VIP: CustomerID ' || cust_rec.CustomerID);
  END LOOP;

  COMMIT;
END;
/

SELECT * FROM Customers;
