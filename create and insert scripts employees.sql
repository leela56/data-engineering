CREATE TABLE departments (
    dept_id SERIAL PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL UNIQUE,
    location VARCHAR(100)
);

CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    hire_date DATE NOT NULL DEFAULT CURRENT_DATE,
    job_title VARCHAR(100),
    salary NUMERIC(10,2),
    manager_id INT REFERENCES employees(emp_id) ON DELETE SET NULL,
    dept_id INT REFERENCES departments(dept_id) ON DELETE SET NULL
);

CREATE TABLE projects (
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    start_date DATE,
    end_date DATE,
    budget NUMERIC(12,2),
    dept_id INT REFERENCES departments(dept_id)
);

CREATE TABLE employee_projects (
    emp_id INT REFERENCES employees(emp_id) ON DELETE CASCADE,
    project_id INT REFERENCES projects(project_id) ON DELETE CASCADE,
    assigned_date DATE DEFAULT CURRENT_DATE,
    role VARCHAR(100),
    PRIMARY KEY (emp_id, project_id)
);


INSERT INTO departments (dept_name, location) VALUES
('Human Resources', 'New York'),
('Engineering', 'San Francisco'),
('Finance', 'Chicago'),
('Sales', 'Boston'),
('Marketing', 'Los Angeles');


INSERT INTO employees (first_name, last_name, email, phone, hire_date, job_title, salary, manager_id, dept_id) VALUES
('Alice', 'Johnson', 'alice.johnson@company.com', '555-1010', '2020-01-10', 'HR Manager', 90000, NULL, 1),
('Bob', 'Smith', 'bob.smith@company.com', '555-2020', '2021-03-15', 'Engineer', 85000, NULL, 2),
('Charlie', 'Brown', 'charlie.brown@company.com', '555-3030', '2022-07-01', 'Senior Engineer', 105000, 2, 2),
('Diana', 'Prince', 'diana.prince@company.com', '555-4040', '2019-10-22', 'Finance Manager', 95000, NULL, 3),
('Ethan', 'Hunt', 'ethan.hunt@company.com', '555-5050', '2021-08-12', 'Sales Executive', 70000, NULL, 4),
('Fiona', 'Clark', 'fiona.clark@company.com', '555-6060', '2023-02-10', 'HR Specialist', 65000, 1, 1),
('George', 'Miller', 'george.miller@company.com', '555-7070', '2020-11-18', 'Software Engineer', 80000, 2, 2),
('Hannah', 'Lee', 'hannah.lee@company.com', '555-8080', '2024-01-05', 'Marketing Associate', 60000, NULL, 5),
('Ian', 'Scott', 'ian.scott@company.com', '555-9090', '2022-03-12', 'Accountant', 72000, 4, 3),
('Julia', 'Adams', 'julia.adams@company.com', '555-1111', '2024-05-23', 'Sales Representative', 65000, 5, 4);


INSERT INTO projects (project_name, start_date, end_date, budget, dept_id) VALUES
('Employee Portal Upgrade', '2024-01-15', '2024-12-31', 150000, 2),
('Recruitment Drive', '2024-04-01', '2024-10-01', 50000, 1),
('Annual Financial Audit', '2024-06-01', '2024-09-30', 80000, 3),
('Q4 Sales Campaign', '2024-09-01', '2024-12-31', 120000, 4),
('Brand Revamp', '2024-02-01', '2024-11-30', 90000, 5);


INSERT INTO employee_projects (emp_id, project_id, assigned_date, role) VALUES
(2, 1, '2024-01-20', 'Backend Developer'),
(3, 1, '2024-01-22', 'Technical Lead'),
(6, 2, '2024-04-05', 'Recruiter'),
(1, 2, '2024-04-10', 'Project Owner'),
(9, 3, '2024-06-05', 'Auditor'),
(5, 4, '2024-09-10', 'Sales Lead'),
(10, 4, '2024-09-12', 'Sales Rep'),
(8, 5, '2024-02-10', 'Marketing Coordinator'),
(2, 5, '2024-03-01', 'Tech Advisor');
