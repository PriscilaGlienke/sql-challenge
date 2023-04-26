-- CREATE TABLE employees(
-- 	emp_no VARCHAR(10) PRIMARY KEY NOT NULL,
-- 	emp_title_id VARCHAR(10) NOT NULL,
-- 	birth_date DATE,
-- 	first_name VARCHAR(255),
-- 	last_name VARCHAR(255),
-- 	gender VARCHAR(255),
-- 	hire_date DATE
-- );

-- CREATE TABLE departments(
-- 	dept_no VARCHAR(10) PRIMARY KEY NOT NULL,
-- 	dept_name VARCHAR(255)
-- );

-- CREATE TABLE dept_emp(
-- 	emp_no VARCHAR(10) REFERENCES employees(emp_no) NOT NULL,
-- 	dept_no VARCHAR(10) REFERENCES departments(dept_no) NOT NULL
-- );

-- CREATE TABLE dept_manager(
-- 	dept_no VARCHAR(10) REFERENCES departments(dept_no) NOT NULL,
-- 	emp_no VARCHAR(10) REFERENCES employees(emp_no) NOT NULL
-- );

-- CREATE TABLE salaries(
-- 	emp_no VARCHAR(10) REFERENCES employees(emp_no) NOT NULL,
-- 	salary INT
-- );

-- CREATE TABLE titles(
-- 	title_id VARCHAR(10) NOT NULL,
-- 	title VARCHAR(255)
-- );

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees
INNER JOIN salaries
ON employees.emp_no = salaries.emp_no;

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

SELECT departments.dept_no, departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
INNER JOIN employees
ON dept_manager.emp_no = employees.emp_no;

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments
ON dept_emp.dept_no = departments.dept_no;

SELECT first_name, last_name, gender
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';
-- WHERE first_name = 'Hercules' AND last_name LIKE 'B%' - Code found in stackoverflow
--https://stackoverflow.com/questions/3739365/how-to-display-employee-names-starting-with-a-and-then-b-in-sql

SELECT employees.emp_no, employees.last_name, employees.first_name
FROM employees
INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name IN ('Salaes', 'Development');

SELECT last_name, COUNT(last_name) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;