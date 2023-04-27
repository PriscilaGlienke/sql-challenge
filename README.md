# sql-challenge

This is Priscila's SQL challenge

-- WHERE first_name = 'Hercules' AND last_name LIKE 'B%' 
-- Code found in stackoverflow
--https://stackoverflow.com/questions/3739365/how-to-display-employee-names-starting-with-a-and-then-b-in-sql


Code for QuickDBD:

Employees
- 
emp_no VARCHAR(10) PK
emp_title_id VARCHAR(10) FK -< Titles.title_id
birth_date DATE
first_name VARCHAR(255)
last_name VARCHAR(255)
gender VARCHAR(10)
hire_date DATE

Departments
- 
dept_no VARCHAR(10) PK
dept_name VARCHAR(255)

Department_Employees
- 
emp_no VARCHAR(10) FK >- Employees.emp_no
dept_no VARCHAR(10) FK >- Departments.dept_no

Department_Managers
- 
dept_no VARCHAR(10) FK - Departments.dept_no
emp_no VARCHAR(10) FK >- Employees.emp_no

Salaries
- 
emp_no VARCHAR(10) FK >- Employees.emp_no
salary INT

Titles
- 
title_id VARCHAR(10) PK
title VARCHAR(255)
