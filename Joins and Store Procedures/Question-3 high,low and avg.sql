CREATE PROCEDURE GetCustomerOrderStats (
    @customer_id INT,
    @highest_amount DECIMAL(10, 2) OUTPUT,
    @lowest_amount DECIMAL(10, 2) OUTPUT,
    @average_amount DECIMAL(10, 2) OUTPUT
)
AS
BEGIN
    -- Variables to hold calculated values
    DECLARE @max_amount DECIMAL(10, 2);
    DECLARE @min_amount DECIMAL(10, 2);
    DECLARE @avg_amount DECIMAL(10, 2);

    -- Calculate highest order amount
    SELECT @max_amount = MAX(p.price * s.quantity)
    FROM Sales s
    INNER JOIN Products p ON s.product_id = p.product_id
    WHERE s.customer_id = @customer_id;

    -- Calculate lowest order amount
    SELECT @min_amount = MIN(p.price * s.quantity)
    FROM Sales s
    INNER JOIN Products p ON s.product_id = p.product_id
    WHERE s.customer_id = @customer_id;

    -- Calculate average order amount
    SELECT @avg_amount = AVG(p.price * s.quantity)
    FROM Sales s
    INNER JOIN Products p ON s.product_id = p.product_id
    WHERE s.customer_id = @customer_id;

    -- Assign values to output parameters
    SET @highest_amount = ISNULL(@max_amount, 0);
    SET @lowest_amount = ISNULL(@min_amount, 0);
    SET @average_amount = ISNULL(@avg_amount, 0);
END;
GO

DECLARE @highest DECIMAL(10, 2);
DECLARE @lowest DECIMAL(10, 2);
DECLARE @average DECIMAL(10, 2);

-- Execute the stored procedure for customer_id = 1
EXEC GetCustomerOrderStats @customer_id = 1,
                           @highest_amount = @highest OUTPUT,
                           @lowest_amount = @lowest OUTPUT,
                           @average_amount = @average OUTPUT;

-- Display the results
SELECT 'Highest Amount' AS stat_type, @highest AS amount
UNION ALL
SELECT 'Lowest Amount' AS stat_type, @lowest AS amount
UNION ALL
SELECT 'Average Amount' AS stat_type, @average AS amount;
