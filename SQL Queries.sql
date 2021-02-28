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

-- Step 4. List the department of each employee with the following information: employee number, last name,
-- first name, and department name. --

SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM employee_data AS emp
INNER JOIN dept_emp ON emp.emp_no = dept_emp.emp_no
INNER JOIN departments AS dept ON dept.dept_no = dept_emp.dept_no;

-- Step 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B." --

SELECT first_name, last_name, sex
FROM employee_data
WHERE first_name = 'Hercules' AND
		last_name LIKE 'B%';
		
-- Step 6.  List all employees in the Sales department, including their employee number, last name, first name, and department name. --

SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM employee_data AS emp
INNER JOIN dept_emp ON emp.emp_no = dept_emp.emp_no
INNER JOIN departments AS dept ON dept.dept_no = dept_emp.dept_no
WHERE dept.dept_name = 'Sales'
ORDER BY emp.last_name, emp.first_name;

-- Step 7.  List all employees in the Sales and Development departments, including their employee number, last name,
-- first name, and department name.

SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM employee_data AS emp
INNER JOIN dept_emp ON emp.emp_no = dept_emp.emp_no
INNER JOIN departments AS dept ON dept.dept_no = dept_emp.dept_no
WHERE dept.dept_name = 'Sales' OR dept.dept_name = 'Development'
ORDER BY dept.dept_name, emp.last_name, emp.first_name;

-- Step 8.  In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) AS "Last Name Frequency Count"
FROM employee_data
GROUP BY last_name
ORDER BY "Last Name Frequency Count" DESC;