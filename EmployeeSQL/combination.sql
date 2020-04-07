--Create Employees Table
DROP TABLE IF EXISTS employees;
CREATE TABLE employees(
	emp_no INT PRIMARY KEY NOT NULL,
	birth_date VARCHAR(30) NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	gender VARCHAR(1) NOT NULL,
	hire_date VARCHAR(30) NOT NULL
);

-- Create Departments Table
DROP TABLE IF EXISTS departments;
CREATE TABLE departments(
	dept_no VARCHAR(4) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(30) NOT NULL
);

-- Create Department Employees Table
DROP TABLE IF EXISTS dept_emp;
CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR(4) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	from_date VARCHAR(30) NOT NULL,
	to_date VARCHAR(30) NOT NULL
);

-- Create Department Managers Table
DROP TABLE IF EXISTS dept_manager;
CREATE TABLE dept_manager(
	dept_no VARCHAR(4) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	from_date VARCHAR(30) NOT NULL,
	to_date VARCHAR(30) NOT NULL
);

-- Create Salaries Table
DROP TABLE IF EXISTS salaries;
CREATE TABLE salaries(
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INT NOT NULL,
	from_date VARCHAR(30) NOT NULL,
	to_date VARCHAR(30) NOT NULL
);

-- Create Titles Table
DROP TABLE IF EXISTS titles;
CREATE TABLE titles(
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	title VARCHAR(30) NOT NULL,
	from_date VARCHAR(30) NOT NULL,
	to_date VARCHAR(30) NOT NULL
);

--1.
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM salaries s
JOIN employees e
ON e.emp_no = s.emp_no;

--2.
SELECT * FROM employees
WHERE hire_date LIKE '1986%';

--3.
SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
FROM departments d
JOIN dept_manager dm
ON d.dept_no = dm.dept_no
JOIN employees e
ON dm.emp_no = e.emp_no;

--4.
SELECT d.dept_no, d.dept_name, e.last_name, e.first_name
FROM departments d
JOIN dept_emp de
ON d.dept_no = de.dept_no
JOIN employees e
ON de.emp_no = e.emp_no;

--5.
SELECT * FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--6.
SELECT d.dept_name, e.emp_no, e.first_name, e.last_name
FROM departments d
JOIN dept_emp de
ON d.dept_no = de.dept_no
JOIN employees e
ON de.emp_no = e.emp_no
WHERE d.dept_name = 'Sales';

--7.
SELECT d.dept_name, de.emp_no, e.first_name, e.last_name
FROM departments d
JOIN dept_emp de
ON d.dept_no = de.dept_no
JOIN employees e
ON de.emp_no = e.emp_no
WHERE d.dept_name = 'Sales' 
OR d.dept_name = 'Development';

--8.
SELECT last_name, COUNT (last_name) AS last_name_frequency
FROM employees
GROUP BY last_name
ORDER BY (last_name_frequency) DESC;