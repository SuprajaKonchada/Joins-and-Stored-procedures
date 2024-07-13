-- Insert into Customer table
INSERT INTO Customer (customer_id, customer_name)
VALUES
    (1, 'Supraja'),
    (2, 'Sanjay'),
    (3, 'Sruthi');

-- Insert into Category table
INSERT INTO Category (category_id, category_name)
VALUES
    (1, 'Electronics'),
    (2, 'Clothing'),
    (3, 'Books');

-- Insert into Products table
INSERT INTO Products (product_id, product_name, category_id, price)
VALUES
    (1, 'Laptop', 1, 120000.00),
    (2, 'T-shirt', 2, 1999),
    (3, 'Novel', 3, 299.98);

INSERT INTO Products (product_id, product_name, category_id, price)
VALUES
    (4, 'FaceWash', 1, 499),
    (5, 'Lipstick', 1, 820),
    (6, 'Foundation', 1, 1499);

-- Insert into Sales table
INSERT INTO Sales (sale_id, customer_id, product_id, sale_date, quantity)
VALUES
    (1, 1, 1, '2024-07-01', 1),
    (2, 2, 2, '2024-07-02', 2),
    (3, 3, 3, '2024-07-03', 3);


INSERT INTO Sales (sale_id, customer_id, product_id, sale_date, quantity)
VALUES
    (4, 1, 4, '2024-07-04', 2),
    (5, 1, 5, '2024-07-05', 2),
    (6, 1, 6, '2024-07-06', 3);

-- Insert Departments table
INSERT INTO Departments (department_id, department_name)
VALUES
    (1, 'HR'),
    (2, 'Finance'),
    (3, 'IT')

-- Insert Employees table
INSERT INTO Employees (employee_id, department_id, employee_name, salary, manager_id)
VALUES
    (1, 3, 'Supraja', 900000, NULL),
    (2, 1, 'Ramu', 600000, 1),
    (3, 3, 'Meghana', 700000, 5),
	(4, 2, 'Anusha', 650000, 2),
	(5, 3, 'Amisha', 700000, 1)


