CREATE PROCEDURE UpdateEmployeeDepartment (
    @emp_id INT,
    @new_dept_id INT,
    @status_message VARCHAR(255) OUTPUT
)
AS
BEGIN
    DECLARE @emp_count INT;
    DECLARE @dept_count INT;

    -- Check if the employee exists
    SELECT @emp_count = COUNT(*)
    FROM Employees
    WHERE employee_id = @emp_id;

    IF @emp_count = 0 
    BEGIN
        SET @status_message = 'Error: Employee ID does not exist.';
        RETURN;
    END;

    -- Check if the department exists
    SELECT @dept_count = COUNT(*)
    FROM Departments
    WHERE department_id = @new_dept_id;

    IF @dept_count = 0 
    BEGIN
        SET @status_message = 'Error: Department ID does not exist.';
        RETURN;
    END;

    -- Update the department of the employee
    UPDATE Employees
    SET department_id = @new_dept_id
    WHERE employee_id = @emp_id;

    -- Check if the update was successful
    IF @@ROWCOUNT > 0 
    BEGIN
        SET @status_message = CONCAT('Success: Employee ', CAST(@emp_id AS VARCHAR(10)), ' transferred to department ', CAST(@new_dept_id AS VARCHAR(10)), '.');
    END
    ELSE
    BEGIN
        SET @status_message = 'Error: Update failed.';
    END;
END;
GO



DECLARE @message VARCHAR(255);
EXEC UpdateEmployeeDepartment @emp_id = 1, @new_dept_id = 2, @status_message = @message OUTPUT;
-- Display the status message
SELECT @message AS status_message;
