CREATE TABLE Employees (
  EmpID NUMBER,
  Name VARCHAR2(50),
  Department VARCHAR2(30),
  Salary NUMBER
);

INSERT INTO Employees VALUES (1, 'Ravi', 'IT', 50000);
INSERT INTO Employees VALUES (2, 'Divya', 'HR', 45000);
INSERT INTO Employees VALUES (3, 'Arjun', 'IT', 52000);

CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus (
  dept_name IN VARCHAR2,
  bonus_percent IN NUMBER
) IS
BEGIN
  UPDATE Employees
  SET Salary = Salary + (Salary * bonus_percent / 100)
  WHERE Department = dept_name;

  DBMS_OUTPUT.PUT_LINE('Bonus updated for department: ' || dept_name);
END;
/

BEGIN
  UpdateEmployeeBonus('IT', 10);
END;
/

SELECT * FROM Employees;
