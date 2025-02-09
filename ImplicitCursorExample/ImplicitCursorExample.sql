/**
Setup:
1. Create the below table
    CREATE TABLE TMP_EMPLOYEES (
    EMP_ID      NUMBER PRIMARY KEY,
    EMP_NAME    VARCHAR2(100),
    SALARY      NUMBER(10,2),
    DEPARTMENT  VARCHAR2(50)
);

**/
/**
Question: Process Employee Salary Increments using Implicit Cursor
Write a PL/SQL block that does the following using an implicit cursor:

    Increases the salary of employees by 10% if they belong to the 'IT' department.
    Increases the salary of employees by 5% if they belong to the 'HR' department.
    Displays the employee ID, name, old salary, and new salary for each updated record.
Constraints:

    Use implicit cursor (i.e., UPDATE statement should not use explicit CURSOR loops).
    Use %ROWCOUNT to show how many records were updated at the end.
**/

DECLARE 
    l_row_count number(2);
BEGIN
    UPDATE TMP_EMPLOYEES
    SET SALARY = SALARY + ((SALARY / 100) * 10)
    WHERE DEPARTMENT = 'IT';
    
    IF  sql%FOUND THEN
        l_row_count := sql%rowcount; -- := is used for assignment = is for logical equal operator
        dbms_output.put_line( l_row_count || ' no. of rows have been updated for IT department');
    ELSIF sql%NOTFOUND THEN
        dbms_output.put_line('No IT employees found');
    END IF;
    
    COMMIT;
    
    UPDATE TMP_EMPLOYEES
    SET SALARY = SALARY + ((SALARY / 100) * 5)
    WHERE DEPARTMENT = 'HR';
    
    IF  sql%FOUND THEN
        l_row_count := sql%rowcount; -- := is used for assignment = is for logical equal operator
        dbms_output.put_line( l_row_count || ' no. of rows have been updated for HR department');
    ELSIF sql%NOTFOUND THEN
        dbms_output.put_line('No HR employees found');
    END IF;
      
    COMMIT;
    
    FOR rec in ( SELECT EMP_ID, EMP_NAME, SALARY FROM TMP_EMPLOYEES WHERE DEPARTMENT IN ('IT', 'HR')) LOOP
            DBMS_OUTPUT.PUT_LINE('EMP_ID: ' || rec.EMP_ID || ', EMP_NAME: ' || rec.EMP_NAME || ', New Salary: ' || rec.SALARY);
    END LOOP;

    
--    
--    UPDATE TMP_EMPLOYEES
--    SET SALARY = SALARY + ((SALARY / 100) * 5)
--    WHERE DEPARTMENT = 'IT';
              
END;


