CREATE PROCEDURE GetSecondHighestSalary (
    @second_highest_salary DECIMAL(18, 2) OUTPUT
)
AS
BEGIN
    -- Find the second highest salary
    SELECT @second_highest_salary = MAX(salary)
    FROM Employees
    WHERE salary < (SELECT MAX(salary) FROM Employees);
END;
GO


DECLARE @second_highest DECIMAL(18, 2);
EXEC GetSecondHighestSalary @second_highest_salary = @second_highest OUTPUT;
-- Display the result
SELECT @second_highest AS SecondHighestSalary;
