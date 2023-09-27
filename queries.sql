-- List the employee number, last name, first name, sex, and salary of each employee.
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary from "employees" as e 
left join "salaries" as s
on (e.emp_no = s.emp_no)
order by e.emp_no;
-- List the first name, last name, and hire date for the employees who were hired in 1986.
select first_name, last_name, hire_date 
from "employees"
where hire_date BETWEEN '01/01/1986' and '12/31/1986';

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
select dm.dept_no, dep.dept_name, de.emp_no, e.last_name, e.first_name FROM "dept_manager" as dm
inner join "departments" as dep
on(dm.dept_no = dep.dept_no)
inner join "dept_emp" as de
on (de.dept_no = dm.dept_no)
JOIN "employees" as e
on (e.emp_no = de.emp_no);

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT e.emp_no, e.first_name, e.last_name, dep.dept_name FROM "employees" as e
JOIN "dept_emp" as de
ON (de.emp_no = e.emp_no)
JOIN "departments" as dep
ON (dep.dept_no = de.dept_no);

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex FROM "employees"
WHERE first_name = 'Hercules'
AND last_name Like 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no, e.last_name, e.first_name, dep.dept_name FROM "employees" as e
JOIN "dept_emp" as de
ON (de.emp_no = e.emp_no)
JOIN "departments" as dep
ON (dep.dept_no = de.dept_no)
WHERE dept_name = 'Sales'
;

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, dep.dept_name FROM "employees" as e
JOIN "dept_emp" as de
ON (de.emp_no = e.emp_no)
JOIN "departments" as dep
ON (dep.dept_no = de.dept_no)
WHERE dept_name = 'Sales'
OR dept_name = 'Development'
;

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name,
count(last_name) AS "frequency"
FROM "employees"
GROUP BY last_name
ORDER By last_name desc
;