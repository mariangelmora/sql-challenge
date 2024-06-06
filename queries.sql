-- Data Analysis
-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT
    emp.emp_no,
    emp.last_name,
    emp.first_name,
    emp.sex,
    sal.salary
FROM employees as emp
JOIN salaries as sal on emp.emp_no = sal.emp_no
ORDER BY (emp.emp_no);

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT
    first_name,
    last_name,
    hire_date 
FROM employees
WHERE date_part('year', hire_date) = 1986;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT
    de.dept_no,
    dep.dept_name,
    emp.emp_no,
    emp.first_name,
    emp.last_name,
    dep.dept_name

FROM employees AS emp
INNER JOIN dept_emp AS de 
ON (emp.emp_no = de.emp_no)
INNER JOIN departments AS dep
ON (dep.dept_no = de.dept_no)



-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT
    de.dept_no,
    emp.emp_no,
    emp.first_name,
    emp.last_name,
    dep.dept_name

FROM employees as emp
INNER JOIN dept_emp AS de
ON (emp.emp_no = de.emp_no)
INNER JOIN departments as dep
on (dep.dept_no = de_dept_no) 


-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex FROM employees
WHERE first_name  'Hercules' AND last_name ='B%'

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT de.dept_no, emp.first_name, emp.last_name, depart.dept_name
FROM dept_emp
JOIN employees
ON  de.emp_no = emp.emp_no
JOIN dept_emp
ON de.dept_no = depart.dept_no
WHERE depart.dept_name = 'Sales';


-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
    emp.emp_no,
    emp.last_name,
    emp.first_name,
    dep.dept_name

FROM employees AS emp
INNER JOIN dept_emp AS de
ON emp.emp_no = de.emp_no
INNER JOIN departments AS dep
ON de.dept_no = dep.dept_no
WHERE dep.dept_name IN ('Sales', 'Development');

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT
    last_name,
    COUNT(*) as frequency_count

FROM employees
GROUP BY last_name
ORDER BY frequency_count DESC;
