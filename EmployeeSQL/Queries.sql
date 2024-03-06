------------ DATA ANALYSIS -----------------

-- list of employee number, last name, first name, sex, and salary of each employee

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
JOIN salaries AS s
ON e.emp_no = s.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= DATE '1986-01-01' AND hire_date < DATE '1987-01-01';


--List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT DISTINCT d.dept_no, d.dept_name, de.employee_no, e.last_name, e.first_name
FROM departments AS d
JOIN dept_manager AS dm 
ON d.dept_no = dm.dept_no
JOIN dept_employee AS de
ON d.dept_no = de.dept_no
JOIN employees AS e
ON e.emp_no = de.employee_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name,d.dept_name
FROM employees AS e
JOIN dept_employee AS de
ON e.emp_no = de.employee_no
JOIN departments AS d
ON de.dept_no = d.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name

SELECT e.emp_no, e.last_name, e.first_name
FROM employees AS e
JOIN dept_employee AS de
ON de.employee_no = e.emp_no
JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE dept_name = 'Sales';


-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_employee AS de
ON e.emp_no = de.employee_no
JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT(last_name) AS last_name_count
FROM employees
GROUP BY last_name
ORDER BY last_name_count DESC;