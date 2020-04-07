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