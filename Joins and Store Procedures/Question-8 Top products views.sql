CREATE PROCEDURE CreateTopProductsView
AS
BEGIN
    -- Drop the view if it already exists
    IF OBJECT_ID('TopProductsByCategory', 'V') IS NOT NULL
    BEGIN
        DROP VIEW TopProductsByCategory;
    END;

    -- Define the dynamic SQL for creating the view
    DECLARE @sql NVARCHAR(MAX);

    SET @sql = '
    CREATE VIEW TopProductsByCategory AS
    WITH RankedProducts AS (
        SELECT
            p.category_id,
            c.category_name,
            p.product_id,
            p.product_name,
            SUM(s.quantity * p.price) AS total_sales_amount,
            ROW_NUMBER() OVER (PARTITION BY p.category_id ORDER BY SUM(s.quantity * p.price) DESC) AS rank
        FROM Sales s
        INNER JOIN Products p ON s.product_id = p.product_id
        INNER JOIN Category c ON p.category_id = c.category_id
        GROUP BY p.category_id, c.category_name, p.product_id, p.product_name
    )
    SELECT
        category_id,
        category_name,
        product_id,
        product_name,
        total_sales_amount
    FROM RankedProducts
    WHERE rank <= 3;
    ';

    -- Execute the dynamic SQL to create the view
    EXEC sp_executesql @sql;
END;
GO

-- Execute the stored procedure to create the view
EXEC CreateTopProductsView;

-- Query the view to see the top 3 products by total sales amount for each category
SELECT * FROM TopProductsByCategory;
