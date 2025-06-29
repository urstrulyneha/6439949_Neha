SET SERVEROUTPUT ON;

CREATE TABLE Customers (
  CustomerID NUMBER,
  Name VARCHAR2(50),
  Age NUMBER,
  IsVIP VARCHAR2(5),
  Balance NUMBER
);

CREATE TABLE Loans (
  LoanID NUMBER,
  CustomerID NUMBER,
  InterestRate NUMBER,
  DueDate DATE
);

INSERT INTO Customers VALUES (1, 'Ram', 65, 'FALSE', 12000);
INSERT INTO Customers VALUES (2, 'Priya', 45, 'FALSE', 8000);
INSERT INTO Customers VALUES (3, 'Kiran', 70, 'FALSE', 15000);

INSERT INTO Loans VALUES (101, 1, 9.5, SYSDATE + 15);  
INSERT INTO Loans VALUES (102, 2, 10.0, SYSDATE + 45); 
INSERT INTO Loans VALUES (103, 3, 8.5, SYSDATE + 10);  

DECLARE
  v_due_date DATE := SYSDATE + 30;
BEGIN
  FOR loan_rec IN (
    SELECT L.LoanID, C.Name, L.DueDate
    FROM Loans L
    JOIN Customers C ON L.CustomerID = C.CustomerID
    WHERE L.DueDate <= v_due_date
  ) LOOP
    DBMS_OUTPUT.PUT_LINE('Reminder: Loan ' || loan_rec.LoanID || 
                         ' for customer ' || loan_rec.Name || 
                         ' is due on ' || TO_CHAR(loan_rec.DueDate, 'DD-MON-YYYY'));
  END LOOP;
END;
/
