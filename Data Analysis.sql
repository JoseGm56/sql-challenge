-- 1. List the employee number, last name, first name, sex, and salary of each employee.

SELECT employees.emp_num, employees.last_name, employees.first_name, employees.sex, salary.salary
FROM employees
INNER JOIN salary ON
salary.emp_num = employees.emp_num;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE employees.hire_date LIKE '%1986';

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT employees.last_name, employees.first_name, department_managers.emp_num, departments.dept_num, departments.dept_name
FROM department_managers
INNER JOIN departments ON departments.dept_num = department_managers.dept_num
INNER JOIN employees ON employees.emp_num = department_managers.emp_num; 

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT employees.last_name, employees.first_name, department_employees.emp_num, departments.dept_num, departments.dept_name
FROM department_employees
INNER JOIN departments ON departments.dept_num = department_employees.dept_num
INNER JOIN employees ON employees.emp_num = department_employees.emp_num;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE employees.first_name = 'Hercules' and employees.last_name LIKE 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.

SELECT employees.emp_num, employees.last_name, employees.first_name --, departments.dept_name
FROM department_employees
INNER JOIN departments ON departments.dept_num = department_employees.dept_num
INNER JOIN employees ON employees.emp_num = department_employees.emp_num
WHERE departments.dept_name = 'Sales';

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT employees.emp_num, employees.last_name, employees.first_name, departments.dept_name
FROM department_employees
INNER JOIN departments ON departments.dept_num = department_employees.dept_num
INNER JOIN employees ON employees.emp_num = department_employees.emp_num
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT employees.last_name, COUNT(employees.last_name) as "Repeats"
FROM employees
GROUP BY employees.last_name
ORDER BY "Repeats" DESC;






