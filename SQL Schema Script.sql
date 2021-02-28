-- DROP TABLE employee_data CASCADE; 
-- DROP TABLE employee_salary CASCADE;
-- DROP TABLE employee_title_info CASCADE;
-- DROP TABLE 

-- Task 1:  Create Table Schemas Within Database

---- Table 1:  Employee Data

CREATE TABLE employee_data (
	emp_no INT NOT NULL,
	emp_title_id VARCHAR(5),
	birth_date DATE,
	first_name VARCHAR(20),
	last_name VARCHAR(30),
	sex VARCHAR(1),
	hire_date DATE,
	PRIMARY KEY (emp_no)
);

---- Table 2:  Employee Title Info

CREATE TABLE employee_title_info (
	title_id VARCHAR(5) UNIQUE,
	title VARCHAR(18)
);

---- Adding the Foreign Key after the required table was created

ALTER TABLE employee_data
ADD FOREIGN KEY (emp_title_id) REFERENCES employee_title_info(title_id);

---- Table 3:  Employee Salary.  Using "BIGINT" based on recommendation found here
---- "https://stackoverflow.com/questions/15726535/postgresql-which-datatype-should-be-used-for-currency"

CREATE TABLE employee_salary(
	emp_no INT NOT NULL,
	salary BIGINT,
	FOREIGN KEY (emp_no) REFERENCES employee_data(emp_no),
	PRIMARY KEY (emp_no)
);

-- Table 4:  Departments Info.  Intentionally creating prior to dept_emp and dept_manager tables to avoid adding foreign keys later.

CREATE TABLE departments(
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR,
	PRIMARY KEY (dept_no)
);

--== Table 5:  Department Employee Roster

CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	PRIMARY KEY (emp_no,dept_no),
	FOREIGN KEY (emp_no) REFERENCES employee_data(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

---- Table 6:  Department Manager Data

CREATE TABLE dept_manager(
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employee_data(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);


