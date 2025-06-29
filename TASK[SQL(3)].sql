-- Create and populate Employees table
CREATE TABLE employees (
  emp_id INTEGER PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  dept TEXT,
  salary REAL,
  hire_date DATE
);

INSERT INTO employees VALUES
(1, 'Alice', 'Smith', 'Sales', 55000, '2021-02-15'),
(2, 'Bob', 'Johnson', 'HR', 48000, '2019-06-20'),
(3, 'Charlie', 'Lee', 'IT', 62000, '2020-11-01'),
(4, 'Diana', 'Garcia', 'IT', 69000, '2018-01-12'),
(5, 'Eva', 'Brown', 'Marketing', 53000, '2022-03-08'),
(6, 'Frank', 'Wong', 'Sales', 59000, '2021-09-17');

SELECT*FROM employees;
-- Create and populate Orders table
CREATE TABLE orders (
  order_id INTEGER PRIMARY KEY,
  emp_id INTEGER,
  order_date DATE,
  amount REAL,
  status TEXT,
  FOREIGN KEY(emp_id) REFERENCES employees(emp_id)
);

INSERT INTO orders VALUES
(101, 1, '2022-05-10', 1500, 'Completed'),
(102, 3, '2022-05-12', 2300, 'Completed'),
(103, 1, '2022-05-13', 500, 'Pending'),
(104, 4, '2022-05-14', 1200, 'Cancelled'),
(105, 2, '2022-05-15', 700, 'Completed'),
(106, 3, '2022-05-18', 1800, 'Pending'),
(107, 5, '2022-05-20', 1100, 'Completed'),
(108, 6, '2022-05-22', 1400, 'Completed'),
(109, 6, '2022-05-23', 800, 'Pending');

SELECT*FROM orders;

SELECT first_name, last_name, dept FROM employees;

SELECT * FROM employees WHERE dept = 'IT';

SELECT * FROM employees 
WHERE dept = 'Sales' AND salary > 50000;

SELECT * FROM employees 
WHERE dept = 'Sales' OR dept = 'Marketing';

SELECT * FROM employees 
WHERE first_name LIKE 'A%';

SELECT * FROM employees 
WHERE salary BETWEEN 50000 AND 60000;

SELECT * FROM employees 
ORDER BY salary DESC;

SELECT * FROM employees 
ORDER BY salary DESC 
LIMIT 3;

SELECT e.first_name, o.order_id, o.amount 
FROM employees e
JOIN orders o ON e.emp_id = o.emp_id;

SELECT e.first_name, o.order_id, o.status 
FROM employees e
JOIN orders o ON e.emp_id = o.emp_id
WHERE o.status = 'Pending';

SELECT o.order_id, e.first_name, o.amount 
FROM orders o
JOIN employees e ON o.emp_id = e.emp_id
WHERE o.amount > 1000
ORDER BY o.amount DESC
LIMIT 5;

SELECT DISTINCT dept 
FROM employees;

-- equals
SELECT * FROM orders WHERE status = 'Completed';

-- IN
SELECT * FROM orders 
WHERE status IN ('Pending', 'Completed');

SELECT e.first_name, e.dept, o.status 
FROM employees e
LEFT JOIN orders o ON e.emp_id = o.emp_id
WHERE o.status = 'Cancelled' 
   OR e.dept = 'HR';
   
   SELECT * FROM orders 
WHERE order_date BETWEEN '2022-05-12' AND '2022-05-20';

SELECT e.first_name AS fname, o.amount AS order_amt
FROM employees e
JOIN orders o USING(emp_id);

SELECT e.dept, COUNT(*) AS num_emps
FROM employees e
GROUP BY e.dept
ORDER BY num_emps DESC;


