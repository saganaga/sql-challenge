-- List the employee number, last name, first name, sex, and salary of each employee
SELECT employees.emp_no, last_name, first_name, sex, salary
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no
ORDER BY emp_no ASC;

-- List the first name, last name, and hire date for the employees
-- who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE date_part('year', hire_date) = 1986
ORDER BY hire_date;

-- List the manager of each department along with their department number,
-- department name, employee number, last name, and first name
SELECT departments.dept_no, dept_name, dept_manager.emp_no, last_name, first_name
FROM departments
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no;

-- List the department number for each employee along with that employee’s employee number,
-- last name, first name, and department name
SELECT departments.dept_no, dept_emp.emp_no, last_name, first_name, dept_name
FROM departments
JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
JOIN employees ON dept_emp.emp_no = employees.emp_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and 
-- whose last name begins with the letter B
SELECT last_name, first_name, sex
FROM employees
WHERE first_name = 'Hercules'
  AND starts_with(last_name, 'B')
--   AND last_name LIKE 'B%'
ORDER BY last_name;

-- List each employee in the Sales department, including their employee number, last name,
-- and first name
SELECT dept_emp.emp_no, last_name, first_name
FROM dept_emp
JOIN departments ON departments.dept_no = dept_emp.dept_no
JOIN employees ON dept_emp.emp_no = employees.emp_no
WHERE dept_name = 'Sales';

-- List each employee in the Sales and Development departments, including their employee
-- number, last name, first name, and department name
SELECT dept_emp.emp_no, last_name, first_name, dept_name
FROM dept_emp
JOIN departments ON departments.dept_no = dept_emp.dept_no
JOIN employees ON dept_emp.emp_no = employees.emp_no
WHERE dept_name = 'Sales' 
  OR dept_name = 'Development';

-- List the frequency counts, in descending order, of all the employee last names,
-- that is, how many employees share each last name
SELECT last_name,COUNT(last_name)AS Frequency
FROM employees
GROUP BY last_name
ORDER BY
COUNT (last_name)DESC;
