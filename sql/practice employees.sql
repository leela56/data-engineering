--Select statements
SELECT * FROM employee_projects
SELECT * FROM employees

--Check employee with department
SELECT e.first_name, e.last_name, d.dept_name
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id;

--Check project assignments
SELECT e.first_name, e.last_name, p.project_name, ep.role
FROM employee_projects ep
JOIN employees e ON e.emp_id = ep.emp_id
JOIN projects p ON p.project_id = ep.project_id

--Find employees who earn more than average salary
SELECT first_name, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

--Retrieve employees managed by a specific manager
SELECT e.first_name, e.last_name
FROM employees e
JOIN employees m ON e.emp_id = m.emp_id
WHERE m.first_name = 'Bob';

--Department with highest total salary
SELECT d.dept_name, SUM(e.salary) AS total_salary
FROM employees e 
JOIN departments d on e.dept_id = d.dept_id
GROUP BY d.dept_name
ORDER BY total_salary
LIMIT 2;

--Find top 3 highest salaries employees per department
SELECT *
FROM 
	(SELECT e.*, ROW_NUMBER() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS rnk
	FROM employees e
	) ranked
WHERE rnk <= 1
ORDER BY salary DESC;

--Employees who are not assigned to any project
SELECT e.first_name, e.last_name, e.emp_id
FROM employees e
LEFT JOIN employee_projects ep on e.emp_id = ep.emp_id
WHERE ep.project_id IS NULL;

--Total number of employees per department
SELECT d.dept_name, COUNT(e.emp_id) AS total_employees
FROM departments d
LEFT JOIN employees e ON e.dept_id = d.dept_id
GROUP BY d.dept_name

--Find all employees who joined in the last 90 days
SELECT emp_id, first_name, last_name
FROM employees
WHERE hire_date >= CURRENT_DATE - INTERVAL '90 days';

--Show manager names along with their direct report counts
SELECT m.first_name || ' ' || m.last_name AS manager_name,
       COUNT(e.emp_id) AS report_count
FROM employees e
JOIN employees m ON e.manager_id = m.emp_id
GROUP BY manager_name
ORDER BY report_count DESC;
