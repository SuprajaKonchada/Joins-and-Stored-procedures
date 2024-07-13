GO
CREATE PROCEDURE CalculateTotalSales (
    @customer_id INT,
    @total_amount DECIMAL(10, 2) OUTPUT
)
AS
BEGIN
    SELECT @total_amount = SUM(p.price * s.quantity)
    FROM Sales s
    INNER JOIN Products p ON s.product_id = p.product_id
    WHERE s.customer_id = @customer_id;
END

GO
DECLARE @Total DECIMAL(18, 2);
EXEC CalculateTotalSales @customer_id = 1, @total_amount = @Total OUTPUT;
SELECT @Total AS TotalSalesAmount;
 