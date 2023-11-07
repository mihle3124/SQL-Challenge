
-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT salaries.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM salaries
INNER JOIN employees ON
employees.emp_no=salaries.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date from employees where hire_date > '1985-12-31' and hire_date < '1987-01-01';

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments
JOIN dept_manager
ON departments.dept_no=dept_manager.dept_no
JOIN employees
ON dept_manager.emp_no=employees.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT dept_emp.dept_no, dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
From dept_emp
JOIN employees
ON dept_emp.emp_no=employees.emp_no
Join departments
On departments.dept_no=dept_emp.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex FROM employees where first_name = 'Hercules' and last_name like 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
FROM departments
JOIN dept_emp
ON departments.dept_no=dept_emp.dept_no
JOIN employees
ON dept_emp.emp_no=employees.emp_no
WHERE dept_name = 'Sales';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name 
FROM departments
JOIN dept_emp
ON departments.dept_no=dept_emp.dept_no
JOIN employees
ON dept_emp.emp_no=employees.emp_no
WHERE departments.dept_name = 'Sales' or departments.dept_name = 'Development';

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS "frequency counts" FROM employees GROUP BY last_name ORDER BY COUNT(last_name) DESC;
