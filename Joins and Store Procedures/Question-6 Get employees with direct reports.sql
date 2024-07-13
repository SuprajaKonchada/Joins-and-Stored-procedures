CREATE FUNCTION GetEmployeesWithDirectReports (@min_reports INT)
RETURNS TABLE
AS
RETURN
(
    SELECT e1.employee_id, e1.employee_name, e1.department_id, e1.salary, e1.manager_id, COUNT(e2.employee_id) AS num_reports
    FROM Employees e1
    LEFT JOIN Employees e2 ON e1.employee_id = e2.manager_id
    GROUP BY e1.employee_id, e1.employee_name, e1.department_id, e1.salary, e1.manager_id
    HAVING COUNT(e2.employee_id) > @min_reports
);
GO



SELECT * 
FROM GetEmployeesWithDirectReports(1);
