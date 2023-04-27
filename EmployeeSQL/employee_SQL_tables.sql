CREATE TABLE titles(
	title_id VARCHAR(10) PRIMARY KEY NOT NULL,
	title VARCHAR(255)
);

CREATE TABLE employees(
	emp_no VARCHAR(10) PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR(10) REFERENCES titles(title_id) NOT NULL,
	birth_date DATE,
	first_name VARCHAR(255),
	last_name VARCHAR(255),
	gender VARCHAR(255),
	hire_date DATE
);

CREATE TABLE departments(
	dept_no VARCHAR(10) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(255)
);

CREATE TABLE dept_emp(
	emp_no VARCHAR(10) REFERENCES employees(emp_no) NOT NULL,
	dept_no VARCHAR(10) REFERENCES departments(dept_no) NOT NULL
);

CREATE TABLE dept_manager(
	dept_no VARCHAR(10) REFERENCES departments(dept_no) NOT NULL,
	emp_no VARCHAR(10) REFERENCES employees(emp_no) NOT NULL
);

CREATE TABLE salaries(
	emp_no VARCHAR(10) REFERENCES employees(emp_no) NOT NULL,
	salary INT
);
