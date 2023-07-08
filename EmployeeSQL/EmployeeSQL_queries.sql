-- Testing to see if the .csv files imported to SQL tables error free
-- select * from titles
-- select * from dept_emp
-- select * from employees
-- select * from departments
-- select * from dept_manager
-- select * from salaries

--------------------------------- Data Analysis questions
-- 1. List the employee number, last name, first name, sex, and salary of each employee.
-- SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
-- FROM salaries as s
-- INNER JOIN employees as e ON
-- e.emp_no=s.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
-- SELECT e.first_name, e.last_name, e.hire_date
-- FROM employees as e
-- WHERE SUBSTRING(hire_date, 6, 9) = '1986';

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
-- SELECT d.dept_no, d.dept_name, de.emp_no, e.last_name, e.first_name
-- FROM Departments AS d
-- 	INNER JOIN dept_emp AS de ON 
-- 	d.dept_no = de.dept_no
-- 	INNER JOIN Employees AS e ON 
-- 	de.emp_no = e.emp_no
-- 		WHERE de.emp_no IN (
-- 			SELECT emp_no
-- 			FROM dept_manager
-- 		);

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
-- SELECT de.emp_no, e.last_name, e.first_name, d.dept_no, d.dept_name
-- FROM Employees AS e
-- INNER JOIN dept_emp AS de ON 
-- e.emp_no = de.emp_no
-- INNER JOIN Departments AS d ON 
-- de.dept_no = d.dept_no;
  
-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
-- SELECT first_name, last_name, sex
-- FROM Employees
-- WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
-- SELECT e.emp_no, e.last_name, e.first_name
-- FROM Employees AS e
-- INNER JOIN dept_emp AS de ON 
-- e.emp_no = de.emp_no
-- INNER JOIN Departments AS d ON 
-- de.dept_no = d.dept_no
-- WHERE d.dept_name = 'Sales';

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
-- SELECT e.emp_no, e.last_name, e.first_name
-- FROM Employees AS e
-- INNER JOIN dept_emp AS de ON 
-- e.emp_no = de.emp_no
-- INNER JOIN Departments AS d ON 
-- de.dept_no = d.dept_no
-- WHERE d.dept_name IN('Sales','Development');

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(*) AS frequency
FROM Employees
GROUP BY last_name
ORDER BY frequency DESC;