-- Create Customer table
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);

-- Create Category table
CREATE TABLE Category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100)
);

-- Create Products table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

-- Create Sales table
CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    sale_date DATE,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


-- Create Department table
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100),
);

-- Create Employee table
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    department_id INT,
    employee_name VARCHAR(100),
    salary DECIMAL(18, 2),
    manager_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id),
    FOREIGN KEY (manager_id) REFERENCES Employees(employee_id)
);

-- Create SalaryLog table
CREATE TABLE SalaryLog (
    log_id INT PRIMARY KEY IDENTITY(1, 1),
    employee_id INT,
    old_salary DECIMAL(18, 2),
    new_salary DECIMAL(18, 2),
    change_date DATETIME,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

