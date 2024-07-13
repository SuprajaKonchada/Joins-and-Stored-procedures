CREATE PROCEDURE UpdateEmployeeSalaries (
    @employee_id INT,
    @new_salary DECIMAL(18, 2)
)
AS
BEGIN
    DECLARE @old_salary DECIMAL(18, 2);

    -- Get the current salary of the employee
    SELECT @old_salary = salary
    FROM Employees
    WHERE employee_id = @employee_id;

    -- Update the employee's salary
    UPDATE Employees
    SET salary = @new_salary
    WHERE employee_id = @employee_id;

    -- Insert a record into the SalaryLog table
    INSERT INTO SalaryLog (employee_id, old_salary, new_salary, change_date)
    VALUES (@employee_id, @old_salary, @new_salary, GETDATE());

	-- Select the SalaryLog table to display it as output
    SELECT * FROM SalaryLog;
END;
GO

-- Execute the stored procedure to update the salary of employee_id 1 to 950000
EXEC UpdateEmployeeSalaries @employee_id = 1, @new_salary = 950000.00;
