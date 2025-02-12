
--##############################################  Table_Based Records in Cursor  #######################################################333

DECLARE 
   employees_rec TMP_EMPLOYEES%rowtype; 
BEGIN 
   SELECT * into employees_rec 
   FROM TMP_EMPLOYEES 
   where EMP_ID = 101;
   dbms_output.put_line('employees ID: ' || employees_rec.EMP_ID); 
   dbms_output.put_line('employees Name: ' || employees_rec.EMP_NAME); 
   dbms_output.put_line('employees Address: ' || employees_rec.SALARY); 
   dbms_output.put_line('employees Salary: ' || employees_rec.DEPARTMENT); 
END; 

--############################################## Cursor-Based Records with Parameters #######################################################333
/**
Scenario:
    You are working on an employee management system. Your task is to fetch and display details of employees who earn more than a given salary threshold using cursor-based records.

Task:
Write a PL/SQL block that:

    1.Accepts a minimum salary as input.
    2.Uses a cursor to fetch employees whose salary is greater than or equal to the given threshold.
    3.Uses a cursor-based record to store and display employee details (Employee ID, Name, Job ID, and Salary).

**/


DECLARE 
    CURSOR c_tmpEmp ( minSalary number) -- Paramertized Cursor. Without this also can define a cursor.
    is select * from tmp_employees where salary > minSalary;
    
    rc_tmpEmp c_tmpEmp%ROWTYPE;
BEGIN

    OPEN c_tmpEmp(6000);
    LOOP
        FETCH c_tmpEmp into rc_tmpEmp;
        exit when c_tmpEmp %NOTFOUND;
        dbms_output.put_line('employees ID: ' || rc_tmpEmp.EMP_ID); 
        dbms_output.put_line('employees Name: ' || rc_tmpEmp.EMP_NAME); 
        dbms_output.put_line('employees Address: ' || rc_tmpEmp.SALARY); 
        dbms_output.put_line('employees Salary: ' || rc_tmpEmp.DEPARTMENT);
        
        
    END LOOP;
    CLOSE c_tmpEmp;

END;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
