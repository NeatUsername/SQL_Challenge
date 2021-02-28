-- Step 1: List the following details of each employee: employee number, last name, first name, sex, and salary. --

SELECT  e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employee_data AS e
INNER JOIN employee_salary AS s ON
	e.emp_no = s.emp_no;
	
-- Step 2: List first name, last name, and hire date for employees who were hired in 1986. --

SELECT first_name, last_name, hire_date
FROM employee_data
WHERE hire_date >= '1986/01/01' AND
		hire_date <= '1986/12/31';
		
-- Step 3. List the manager of each department with the following information: department number, department name, --
-- the manager's employee number, last name, first name. --

SELECT d.dept_no, d.dept_name, mgr.emp_no, e.last_name, e.first_name
FROM dept_manager AS mgr
INNER JOIN departments AS d ON d.dept_no = mgr.dept_no
INNER JOIN employee_data AS e ON e.emp_no = mgr.emp_no
ORDER BY 	d.dept_name DESC,
			e.last_name;
